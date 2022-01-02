# Electronics simulation on Linux, howto

  20211226
  Viktor Godard

I was playing with some electronic kits that Ruth got me for x-mas. 
I started wondering if I can run Electronic circuits simulation on Linux. 
Long time ago at University I used ORCAD (old and does not run on Linux though) 
Here is what I found!

---


# Application: SimulIDE

version: 0.4.15-SR9 
License: GPLv3 
Source Code: (for 0.5.15-RC3) 
https://bazaar.launchpad.net/~arcachofo/simulide/trunk/files

The package exist on the Ubuntu repo, but it is an old version (0.1.7 vs 0.4.15): 

    apt info simulide
        simulide/focal 0.1.7+dfsg-2build1 amd64
        simple real time electronic circuit simulator


Quote: 
> Homepage: https://sourceforge.net/projects/simulide
> Description: simple real time electronic circuit simulator
> Simulide is a real time electronic circuit simulator intended for hobbist and
> student experimentation with simple general purpose electronic circuits and
> PIC, AVR and Arduino microcontroller simulations.
> PIC and AVR simulation are provided by gpsim and simavr.

The project home is at: 
https://www.simulide.com/p/home.html

The latest version is 0.4.15 at: 
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

The most important things to notice are:
- on Source Components, select a "Fixed Voltage" source (e.g.)
- to close the circuit select Ground.
- put whatever else you like between the source and ground and start simulating ;)


---

Do you want to find about other applications available?

then Google: **electronic design and simulation on linux**

e.g.: 
- https://www.ubuntupit.com/best-electronic-design-automation-tools-eda-tools-for-linux/
- https://en.wikipedia.org/wiki/List_of_free_electronics_circuit_simulators
- https://en.wikipedia.org/wiki/Comparison_of_EDA_software

---

# Application: Qucs  (Quite_Universal_Circuit_Simulator)

**Qucs is not as easy or intuitive as SimulIDE**

Qucs will take the color theme from the OS, but in dark mode you can hardly read anything on this app.

Change the OS color theme to light mode, at least in the meantime you try this app.

Video: Qucs Tutorial: Simulating a common emitter bjt amplifier circuit: 
https://www.youtube.com/watch?v=AyK7N_aSQx4

At Wikipedia: https://en.wikipedia.org/wiki/Quite_Universal_Circuit_Simulator

Project install instructions at: http://qucs.sourceforge.net/install.html#install_ubuntu 

The regular version is not part of the Ubuntu regular repos, so we need to add its repo before installing:

    sudo apt-add-repository ppa:qucs/qucs
    sudo apt-get update
    sudo apt-get install qucs


### Application: Qucs-S  (Qucs with SPICE)

This is the same Qucs application, but with SPICE integration and packaged with AppImage! (so, much better).

Repo at: https://ra3xdh.github.io/

Download the latest AppImage at: 
https://github.com/ra3xdh/qucs_s/releases/download/0.0.22/Qucs-S-0.0.22_x86_64.AppImage

    mv ~/Downloads/Qucs-S-0.0.22_x86_64.AppImage ~/bin/.
    chmod 750 ~/bin/Qucs-S-0.0.22_x86_64.AppImage
    cd ~/bin
    ./Qucs-S-0.0.22_x86_64.AppImage


---

# Application: NGSPICE

NOTE: this app is 100% CLI :)

at Wikipedia: https://en.wikipedia.org/wiki/Ngspice 

NGSPICE latest version is 35, the one available on the Ubuntu 20.04 repo is 31.

version 31 is from 2019, so it is good enough to try.

    sudo apt install ngspice
    cd ~
    ngspice

Tutorials at: http://ngspice.sourceforge.net/tutorials.html

This is a great introduction video!

noc20 ee12 Getting started with NgSpice:  
https://www.youtube.com/watch?v=m621rS1pdwA


---

# Application: GPSim

at Wikipedia: https://en.wikipedia.org/wiki/Gpsim

Project home: http://gpsim.sourceforge.net/gpsim.html

Video: Using GPSIM on a Raspberry Pi To Debug PIC Assembly Language:  
https://www.youtube.com/watch?v=KUlD0ynIc8g

Note that 0.31 is the latest version (from 2019):

    apt info gpsim
        gpsim/focal 0.31.0-2build1 amd64
        Simulator for Microchip's PIC microcontrollers


Install Pre-reqs: 

    sudo apt install libcanberra-gtk-module

Install gpsim:

    sudo apt install gpsim

NOTE: This app runs in dual mode CLI & GUI at the same time.

To start, at CLI type:

    gpsim


---

That is all for now. 

# Conclusion: focus on SimulIDE and NGSPICE.

---

<!---
Comments:

 Markdown rendering of this doc tested with mdless and also with pandoc as follows:
    pandoc thisdoc.md | lynx -stdin

 Markdown syntax style used from:
    https://www.markdownguide.org/basic-syntax/
-->

