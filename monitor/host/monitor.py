#!/usr/bin/env python3
#

# Host code for Z80 monitor
# J.Macfarlane 2020.

import serial, sys, argparse

MSG_WR              = 0x01
MSG_RD              = 0x02
MSG_BUS_ACK         = 0x03
MSG_BUS_REL         = 0x04
MSG_RESET           = 0x05

ADDRSPACE_MEM = 0
ADDRSPACE_IO = 1

class Message(object):
    def __init__(self, mtype, data):
        self.type = mtype
        self.data = data

    @classmethod
    def from_msg(cls, line):
        # line is a bytearray received by the serial module.
        # We need to convert it to a string first and remove
        # the linefeed.
        msg = line.decode('utf-8').rstrip()
        if msg[0] == '#':
            print(msg)
            return None
        if msg[0] != ':':
            print("Message didn't start with ':' - '{}'".format(msg))
            return None
        # Now attempt to decode as ASCII hex
        try:
            raw = bytes.fromhex(msg[1:])
        except:
            print("Couldn't decode message as hex - '{}'".format(msg))
            return None

        chksum = sum(raw) % 256
        if chksum != 0:
            print("checksum error on message - '{}'".format(msg))
            return None
        mtype = raw[0]
        mdata = raw[1:-1]
        return cls(mtype, mdata)


def get_msg(port):
    resp = ser.readline()
    if len(resp) == 0:
        printf("Timeout\n")
        return None
    return Message.from_msg(resp)

def printable(b):
    pb = bytes([ x if x >= 0x20 and x < 0x7f else 32 for x in b])
    return pb.decode('utf-8')

def pretty(addr: int, data: bytearray):
    count = len(data)
    print("{:04X} ".format(addr), end='')
    for b in data:
        print(" {:02X}".format(b), end='')
    print("   "*(16-count), end='')
    print("  ", printable(data))


def get_resp(port, mtype):
    resp = get_msg(port)
    if resp:
        if resp.type == 2:
            addr = int.from_bytes(resp.data[0:2], byteorder='little')
            pretty(addr, resp.data[2:])
        else: 
            print("Got response type {}".format(resp.type))

def send_msg(port, mtype, msg: bytearray = None):
    # Prepend type byte
    type_stub = mtype.to_bytes(length=1, byteorder='little')
    if msg is None:
        msg = type_stub
    else:
        msg = type_stub + msg
    chksum = (256 - sum(msg) % 256) % 256
    msg += chksum.to_bytes(length=1, byteorder='little')
    enc = b':' + msg.hex().encode('utf-8') + b'\n'
    port.write(enc)
    get_resp(port, mtype)

# Parse a line from an Intel hex file
def unhex(line):
    chksum = sum(bytes.fromhex(line[1:-1])) % 256
    if chksum != 0:
        printf("checksum error")
        return None
    type = int(line[7:9],16)
    length = int(line[1:3],16)
    addr = int(line[3:7],16)
    #print("{} 0x{:04X} {:2d}".format(type, addr, length))
    if type == 0:
        data = bytes.fromhex(line[9:-3])
        msg = ADDRSPACE_MEM.to_bytes(length=1, byteorder='little')
        msg += addr.to_bytes(length=2, byteorder='little')
        msg += data
        return msg
    return None

def auto_int(x):
    return int(x, 0)

parser = argparse.ArgumentParser(description="Z80 Monitor")
parser.add_argument('-b', '--baud', metavar='baud', type=int, nargs=1,
                    default=230400, help='Baud Rate')
parser.add_argument('-r', '--read', metavar=('addr','count'), type=auto_int, nargs=2,
                    default=None, help='Read from addr')
parser.add_argument('port', type=str, help='Serial Device')
parser.add_argument('files', type=str, nargs='*',
                    help='Intel Hex File')

args = parser.parse_args()

ser = serial.Serial(args.port, args.baud, timeout=1)

def send_read_msg(port, memtype, addr, size):
    msg = memtype.to_bytes(length=1, byteorder='little')
    msg += addr.to_bytes(length=2, byteorder='little')
    msg += size.to_bytes(length=1, byteorder='little')
    send_msg(ser, MSG_RD, msg)


send_msg(ser, MSG_BUS_ACK)

if args.read is not None:
    start_addr = args.read[0]
    count = args.read[1]
    for i in range(0,count,16):
        send_read_msg(ser, ADDRSPACE_MEM, start_addr+i, min(count-i, 16))

for name in args.files:
    with open(name) as f:
        for line in f:
            msg = unhex(line)
            if msg is not None:
                send_msg(ser, MSG_WR, msg)
send_msg(ser, MSG_BUS_REL)

ser.close()

# TODO: implement reading.
