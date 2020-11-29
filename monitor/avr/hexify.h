#ifndef HEXIFY_H
#define HEXIFY_H

/*
 * Send & receive binary data as ASCII HEX characters.
 *
 */


#include <inttypes.h>

typedef struct {
    uint8_t *data;
    int size;
    int ptr;
    uint8_t state;
    uint8_t type;
    uint8_t chksum;
    uint8_t byte;
} hexify_decoder_t;

typedef struct {
    uint8_t *data;
    int len;
    int ptr;
    uint8_t state;
    uint8_t type;
    uint8_t chksum;
} hexify_encoder_t;

void hexify_sender_start(hexify_encoder_t *enc, uint8_t type, uint8_t *buf, int len);
int hexify_sender_next(hexify_encoder_t *enc, char *c);
void hexify_recvr_init(hexify_decoder_t *dec, uint8_t *buf, int size);
int hexify_recvr_next(hexify_decoder_t *dec, char c, uint8_t *type, int *len);

#endif //HEXIFY_H
