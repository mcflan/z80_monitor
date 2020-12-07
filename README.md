# Z80 Monitor

<img src="https://github.com/mcflan/z80_monitor/blob/master/images/z80_monitor-render.jpg" height="200"></img>

A device that allows a host PC to read and write memory on the bus of a Z80
computer (or potentially other CPUs) as well as a few other functions. It makes
use of the Z80's BUSRQ / BUSAK feature to gain access to the bus while the CPU
is running. The circuit is based on an Atmel atmega1281. The host interface is
a bidirectional TTL-level serial (UART) connection that uses a simple hex-based
protocol to control the monitor and provide handshaking. The host interface is
electrically isolated to allow the target device to be power-cycled properly
without being back-powered by the serial signals. This also avoids any risk of
SCR latch-up.

## Host Connector

This is 6-way single-row header to fit a standard FTDI FT232 serial cable (TTL type.) It will work with the 5V and 3V3 versions.

 | Number | Function      |
 |:------:|:------------- |
 |  6     | Not Used      |
 |  5     | Serial Out    |
 |  4     | Serial In     |
 |  3     | Power In      |
 |  2     | Not Used      |
 |  1     | Ground        |


## Bus Connector

See the [pinout file](bus_pinout.md)
