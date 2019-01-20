# HiFive1 RISC V howto
# 20181007
# Viktor Godard

# howto:
w3m https://sifive.cdn.prismic.io/sifive%2F9c57065b-6d28-465b-b67d-f416894123a9_hifive1-getting-started-v1.0.2.pdf

### tested on Centos 7: it didnot work.  NOTE: Use only Ubuntu !!!!

echo "Pre:"

echo "1- Install OpenOCD and its dependency jimtctl:"

yum install openocd
# openocd.x86_64 : Debugging, in-system programming and boundary-scan testing for embedded devices
# jimtcl.x86_64 : A small embeddable Tcl interpreter


echo  "2- Add permissions for OpenOCD to use usb and tty with the HiFive1 board and the Olimex Debugger (for use with E310 Arty Dev Kit)."

cat << EOF > /etc/udev/rules.d/99-openocd.rules
# These are for the HiFive1 Board
SUBSYSTEM=="usb", ATTR{idVendor}=="0403",
  ATTR{idProduct}=="6010", MODE="664", GROUP="plugdev"

SUBSYSTEM=="tty", ATTRS{idVendor}=="0403",
  ATTRS{idProduct}=="6010", MODE="664", GROUP="plugdev"

# These are for the Olimex Debugger for use with E310 Arty Dev Kit
SUBSYSTEM=="usb", ATTR{idVendor}=="15ba",
  ATTR{idProduct}=="002a", MODE="664", GROUP="plugdev"

SUBSYSTEM=="tty", ATTRS{idVendor}=="15ba",
  ATTRS{idProduct}=="002a", MODE="664", GROUP="plugdev"
EOF


echo "3- Gather USB and tty info:"

lsusb > lsusb-before
ls /dev/tty* > lstty-before

echo "Connect the board to USB"

lsusb > lsusb-after
ls /dev/tty* > lstty-after

diff lsusb-before lsusb-after 
diff lstty-before lstty-after 

# Example results:
# > Bus 003 Device 016: ID 0403:6010 Future Technology Devices International, Ltd FT2232C/D/H Dual UART/FIFO IC
# > /dev/ttyUSB0
# > /dev/ttyUSB1


echo "4- Stablish UART communication to the board using Screen:"
# For serial communication with the UART, you will always want to select the higher number of the pair, in this example /dev/ttyUSB1.

echo "Disconnect/Connect the board from/to the USB port and inmediately issue with Screen command so you can catch the connection test."

sudo screen /dev/ttyUSB1 115200

echo 'Answer yes to the question "Are the LEDs Changing? [y/n]", if that iss the case (led_fade demo)'


echo "5- Installing the Freedom E SDK"

# 5.1- Clone the Freedom E SDK git repository:
git clone --recursive https://github.com/sifive/freedom-e-sdk.git

# 5.2- Install all the necessary packages described in the repository’s README.md file:
# On Centos 7:
# these ones were not installed:
yum install libmpc-devel libusb-devel
# the following ones were actually installed:
yum install autoconf automake mpfr-devel gmp-devel gawk bison flex texinfo libtool make pkgconfig expat-devel zlib-devel
# couldnot find g++, but gcc++ is installed.

# On Ubuntu: autoconf automake libmpc-dev libmpfr-dev libgmp-dev gawk bison flex texinfo libtool libusb-1.0-0-dev make g++ pkg-config libexpat1-dev zlib1g-dev


# 5.3- To build the software toolchain:
cd freedom-e-sdk
make -j 3 tools  # to use 3 cores instead of just one. Process takes a long time.


# 5.4- To keep your software toolchain up to date with the upstream repository:
cd freedom-e-sdk
git pull origin master
git submodule update --init --recursive
make -j 3 tools


echo "6- Testing all works:"

cd freedom-e-sdk/software
# just follow pdf at:
wget https://sifive.cdn.prismic.io/sifive%2F9c57065b-6d28-465b-b67d-f416894123a9_hifive1-getting-started-v1.0.2.pdf

#NOTE: Use only Ubuntu !!!!  
