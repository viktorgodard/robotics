# Electronics simulation on Linux, howto
  20211226
  Viktor Godard

I was playing with some electronic kits that Ruth got me for x-mas.
I started wondering if I can run Electronic circuits simulation on Linux.
Long time ago at University I used ORCAD (old and does not run on Linux though)
Here is what I found!

####

# Application: SimulIDE
  version: 0.4.15-SR9
  License: GPLv3
  Source Code: (for 0.5.15-RC3)
    https://bazaar.launchpad.net/~arcachofo/simulide/trunk/files

The package exist on the Ubuntu repo, but it is an old version (0.1.7 vs 0.4.15):

sudo apt search simul
simulide/focal 0.1.7+dfsg-2build1 amd64
  simple real time electronic circuit simulator

sudo apt info simulide
Quote:
Homepage: https://sourceforge.net/projects/simulide
Description: simple real time electronic circuit simulator
 Simulide is a real time electronic circuit simulator intended for hobbist and
 student experimentation with simple general purpose electronic circuits and
 PIC, AVR and Arduino microcontroller simulations.
 PIC and AVR simulation are provided by gpsim and simavr.
End Quote.

The latest version is 0.4.15 at:
https://www.simulide.com/p/home.html
https://www.simulide.com/p/downloads.html

I opted for the AppImage version, since it will mean that it comes with its own dependencies.

mv ~/Downloads/simulide_0.4.15-SR9.AppImage ~/abin/.
cd ~/abin/
chmod 754 simulide_0.4.15-SR9.AppImage

Running the Application:
./simulide_0.4.15-SR9.AppImage

Basic Usage:
https://www.simulide.com/p/basic-use.html

The Video tutorials from SimulIDE are at:
https://www.youtube.com/channel/UCv4QSL5PGN15wk41AVjgRdg/videos

The most important thing to notice is on Source components:
  - select "Fixed Voltage" source or any other.
  - to close the circuit select Ground.
  - put whatever else you like in the middle.


####

Do you want to find about other applications available?
Google: electronic design and simulation  linux

e.g.: 
https://www.ubuntupit.com/best-electronic-design-automation-tools-eda-tools-for-linux/
https://en.wikipedia.org/wiki/List_of_free_electronics_circuit_simulators
https://en.wikipedia.org/wiki/Comparison_of_EDA_software

####

# Application: Qucs

https://en.wikipedia.org/wiki/Quite_Universal_Circuit_Simulator
http://qucs.sourceforge.net/install.html#install_ubuntu
sudo apt-add-repository ppa:qucs/qucs
sudo apt-get update
sudo apt-get install qucs

NOTE: Qucs will take the color theme from the OS, but in dark mode you can varely
      read anything on this app. Change the OS color theme to light mode

NOTE: Qucs is not as easy or intuitive as SimulIDE.

See video:
   Qucs Tutorial: Simulating a common emitter bjt amplifier circuit
   https://www.youtube.com/watch?v=AyK7N_aSQx4


# Application: Qucs-S  (Qucs with SPICE)
  https://ra3xdh.github.io/
  Download the latest AppImage at:
  https://github.com/ra3xdh/qucs_s/releases/download/0.0.22/Qucs-S-0.0.22_x86_64.AppImage


####

# Application: NGSPICE
  https://en.wikipedia.org/wiki/Ngspice
  NOTE: this app is 100% CLI :)

NGSPICE latest version is 35, the one available on the Ubuntu 20.04 repo is 31.
version 31 is from 2019, so it is good enough to try.

sudo apt install ngspice

http://ngspice.sourceforge.net/tutorials.html

This is a great introduction video!!!
noc20 ee12 Getting started with NgSpice
   https://www.youtube.com/watch?v=m621rS1pdwA


####

# Other interesting applications:

# Application: GPSim
  https://en.wikipedia.org/wiki/Gpsim
  http://gpsim.sourceforge.net/gpsim.html

 Using GPSIM on a Raspberry Pi To Debug PIC Assembly Language
  https://www.youtube.com/watch?v=KUlD0ynIc8g

sudo apt search gpsim
   gpsim/focal 0.31.0-2build1 amd64
   Simulator for Microchip's PIC microcontrollers
   (NOTE: 0.31 is the latest version from 2019)

Pre-reqs:
sudo apt install libcanberra-gtk-module
Install gpsim:
sudo apt install gpsim

NOTE: This app runs in dual mode CLI & GUI at the same time.

To start, at CLI type:
gpsim

####

That is all for now. 

# Conclusion though, focus on SimulIDE and NGSPICE.

####
