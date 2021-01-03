#include <inttypes.h>

#include "hexify.h"

/******************************************************************************
 * Private data.
 *****************************************************************************/

enum {
    ENC_STATE_READY = 0,
    ENC_STATE_TYPE_HI,
    ENC_STATE_TYPE_LO,
    ENC_STATE_DATA_HI,
    ENC_STATE_DATA_LO,
    ENC_STATE_CHKSUM_HI,
    ENC_STATE_CHKSUM_LO,
    ENC_STATE_END_CHAR,
    ENC_STATE_DONE
};

enum {
    DEC_STATE_READY,
    DEC_STATE_TYPE_HI,
    DEC_STATE_TYPE_LO,
    DEC_STATE_DATA_1ST,
    DEC_STATE_DATA_HI,
    DEC_STATE_DATA_LO,
};

static const char hexchars[] = "0123456789ABCDEF";

/******************************************************************************
 * Private functions.
 *****************************************************************************/

// Turn low "nibble" of byte into ASCII hex
static char hex_enc_lo(uint8_t x)
{
    x &= 0xf;
    return hexchars[x];
}

// Turn high "nibble" of byte into ASCII hex
static char hex_enc_hi(uint8_t x)
{
    x >>= 4;
    return hex_enc_lo(x);
}

// Set lower 4 bits of byte pointed to by 'data' param
// and return 1 if c is a valid ASCII hex character.
// Otherwise return 0 and don't touch *data.
static int hex_dec_lo(char c, uint8_t *data)
{
    if (c >= '0' && c <= '9') {
        *data &= 0xf0;
        *data |= c - '0';
        return 1;
    } else if (c >= 'A' && c <= 'F') {
        *data &= 0xf0;
        *data |= c - 'A' + 10;
        return 1;
    } else if (c >= 'a' && c <= 'f') {
        *data &= 0xf0;
        *data |= c - 'a' + 10;
        return 1;
    } else {
        return 0;
    }
}

// As above but sets upper 4 bits of *data.
static int hex_dec_hi(char c, uint8_t *data)
{
    uint8_t tmp = 0;

    int ret;
    ret = hex_dec_lo(c, &tmp);
    if (ret) {
        *data &= 0x0f;
        *data |= tmp << 4;
    }
    return ret;
}

/******************************************************************************
 * Public functions.
 *****************************************************************************/

// Call this first when sending a new message.
void hexify_sender_start(hexify_encoder_t *enc, uint8_t type, uint8_t *buf, int len)
{
    enc->state = ENC_STATE_READY;
    enc->type = type;
    enc->data = buf;
    enc->len = len;
    enc->chksum = type;
    enc->ptr = 0;
}

// Call this to get each character of the encoded message. Returns 1
// if busy (character is valid) and 0 when done (character has not
// been set.)
int hexify_sender_next(hexify_encoder_t *enc, char *c)
{
    if (enc->state == ENC_STATE_DONE)
        return 0;

    switch (enc->state) {
        case ENC_STATE_READY:
            *c = ':';
            enc->state = ENC_STATE_TYPE_HI;
            break;
        case ENC_STATE_TYPE_HI:
            *c = hex_enc_hi(enc->type);
            enc->state = ENC_STATE_TYPE_LO;
            break;
        case ENC_STATE_TYPE_LO:
            *c = hex_enc_lo(enc->type);
            if (enc->len > 0)
                enc->state = ENC_STATE_DATA_HI;
            else
                enc->state = ENC_STATE_CHKSUM_HI;
            break;
        case ENC_STATE_DATA_HI:
            *c = hex_enc_hi(enc->data[enc->ptr]);
            enc->state = ENC_STATE_DATA_LO;
            break;
        case ENC_STATE_DATA_LO:
            *c = hex_enc_lo(enc->data[enc->ptr]);
            enc->chksum += enc->data[enc->ptr];
            enc->ptr++;
            if (enc->ptr < enc->len)
                enc->state = ENC_STATE_DATA_HI;
            else
                enc->state = ENC_STATE_CHKSUM_HI;
            break;
        case ENC_STATE_CHKSUM_HI:
            *c = hex_enc_hi(-enc->chksum);
            enc->state = ENC_STATE_CHKSUM_LO;
            break;
        case ENC_STATE_CHKSUM_LO:
            *c = hex_enc_lo(-enc->chksum);
            enc->state = ENC_STATE_END_CHAR;
            break;
        case ENC_STATE_END_CHAR:
            *c = '\n';
            enc->state = ENC_STATE_DONE;
            break;
    }
    return 1;
}

// Call this before using hexify_recvr_next for first time.
void hexify_recvr_init(hexify_decoder_t *dec, uint8_t *buf, int size)
{
    dec->state = ENC_STATE_READY;
    dec->data = buf;
    dec->size = size;
}

// Call this with incoming characters that you want to decode. Returns 1 if
// busy (waiting for, or decoding message) and 0 when done (full message has
// been decoded and type and len have been set.)
// Note, the checksum byte is not placed in the buffer and does not count
// toward the value placed in 'len'.
int hexify_recvr_next(hexify_decoder_t *dec, char c, uint8_t *type, int *len)
{
    switch (dec->state) {

        case DEC_STATE_READY:
            if (c == ':') {
                dec->state = DEC_STATE_TYPE_HI;
                dec->ptr = 0;
            }
            break;

        case DEC_STATE_TYPE_HI:
            if (hex_dec_hi(c, &dec->type))
                dec->state = DEC_STATE_TYPE_LO;
            else {
                dec->state = DEC_STATE_READY;
                return -3;
            }
            break;

        case DEC_STATE_TYPE_LO:
            if (hex_dec_lo(c, &dec->type)) {
                dec->state = DEC_STATE_DATA_1ST;
                dec->chksum = dec->type;
            } else {
                dec->state = DEC_STATE_READY;
                return -3;
            }
            break;
 

        // Expecting 1st high half-byte in message.
        case DEC_STATE_DATA_1ST:
            if (c == '\n') {
                // Got the end-of-message character with no data or
                // checksum.
                dec->state = DEC_STATE_READY;
                return -3;
            } else {
                // Stash the upper half-byte in our temporary store.
                if (hex_dec_hi(c, &dec->byte))
                    dec->state = DEC_STATE_DATA_LO;
                else {
                    dec->state = DEC_STATE_READY;
                    return -3;
                }
            }
            break;

        // Expecting high half-byte or end-of-message char.
        case DEC_STATE_DATA_HI:
            dec->chksum += dec->byte;
            if (c == '\n') {
                // Got the end-of-message character.
                dec->state = DEC_STATE_READY;
                if (dec->chksum) {
                    // Invalid checksum.
                    return -2;
                }
                // If we get to here, we have rx'd a valid message.
                *type = dec->type;
                *len = dec->ptr;
                return 0; // Inform the caller.
            } else {
                // Put rx'd byte into rx buffer.
                if (dec->ptr >= dec->size) {
                    // Buffer overflow
                    dec->state = DEC_STATE_READY;
                    return -1;
                } else {
                    dec->data[dec->ptr++] = dec->byte;
                }

                // Stash the upper half-byte in our temporary store.
                if (hex_dec_hi(c, &dec->byte))
                    dec->state = DEC_STATE_DATA_LO;
                else {
                    dec->state = DEC_STATE_READY;
                    return -3;
                }
            }
            break;

        // Expecting low half-byte.
        case DEC_STATE_DATA_LO:
            if (hex_dec_lo(c, &dec->byte)) {
                dec->state = DEC_STATE_DATA_HI;
            } else {
                dec->state = DEC_STATE_READY;
                return -3;
            }
            break;
    }
    return 1;
}
