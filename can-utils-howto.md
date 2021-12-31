# can-utils howto
20211230
Viktor Godard

# Application: CAN-UTILS

sudo apt install can-utils

NOTE: This is more advanced than scantool and  piobdii.py ,
      TODO in the future if I get the time.

Code is available at:
  git@github.com:linux-can/can-utils.git

See ~/acode/can-utils/LICENSES for details, parts of this app are under
- GNU GPL v2
- BSD-3 Clause
- also see the Linux syscall note.

Instructions on how to use can-utils are at:
  ~/acode/can-utils/README.md
  https://github.com/linux-can/can-utils/blob/master/can-j1939-kickstart.md


sudo apt info can-utils

Quote:

Description: SocketCAN userspace utilities and tools
 CAN is a message-based network protocol designed for vehicles originally
 created by Robert Bosch GmbH. SocketCAN is a set of open source CAN drivers
 and a networking stack contributed by Volkswagen Research to the Linux kernel.
 .
 This package contains some userspace utilities for Linux SocketCAN subsystem.
 .
 Basic tools to display, record, generate and replay CAN traffic:
 candump, canplayer, cansend, cangen, cansniffer.
 CAN access via IP sockets: canlogserver, bcmserver, socketcand.
 CAN in-kernel gateway configuration: cangw.
 CAN bus measurement and testing: canbusload, can-calc-bit-timing, canfdtest.
 ISO-TP (ISO 15765-2 2016) tools: isotpsend, isotprecv, isotpsniffer,
 isotpdump, isotpserver, isotpperf, isotptun.
 CAN log file converters: asc2log, log2asc, log2long.
 CAN Serial Line Discipline configuration (for slcan driver):
 slcan_attach, slcand, slcanpty.
 SAE J1939 tools and demo: jacd, jspy, jsr, testj1939.

Unquote.


####

Extra info:

see:

- https://thesecuritynoob.com/interviews/an-interview-with-hacker-author-occupy-the-web/

- https://www.hackers-arise.com/post/2017/08/08/automobile-hacking-part-2-the-can-utils-or-socketcan

- https://www.hackers-arise.com/automobile-hacking-1


NOTE: You have to be a Subscriber PRO to take the full class above ($1500.00 for 24 courses for 3 years).

https://www.hackers-arise.com/subscriber-pro

####
