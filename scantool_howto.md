# scantool howto

Viktor Godard
20211221

Scantool is licensed under the GNU GPL v2 
So if you change it, pass it along and let the original
 author have the improvements so we all benefit.


**There are 2 ways to use Scantool on Ubuntu Linux 20.04**

### Using version 2.0 from the Ubuntu repo:

    sudo apt install scantool

### Using version 2.1 from Kees github repo:

    mkdir ~/acode
    cd ~/acode
    git clone git@github.com:kees/scantool.git
    cd scantool

Read the manual (it's short):

    less ~/acode/scantool/USAGE.md

Compile the binary (as told in the manual). For v2.1 do:

    sudo apt install -y liballegro4.4 liballegro4-dev allegro4-doc
    cd ~/acode/scantool
    make clean
    make

NOTE: the binary and the *.o compiled C files will be added to the repo. 
preferably, delete all the files *.o files generated during the compilation process on the repo.


IMPORTANT: Make sure you add your user to the dialout group so it has rights to the USB port, 
otherwise the app will not be able to find the OBDII device:

    sudo usermod -a -G dialout viktor
    newgrp dialout
    groups


Make a working directory were you will move over the compiled binary:

    mkdir ~/bin
    mv ~/acode/scantool/scantool ~/bin/.

Finally, run the app:

    cd ~/bin
    ./scantool

---

The first time you run the application, you will be ask to configure the options: 
- Port: /dev/ttyUSB0
- Baud: 115200

Once provided, they will be saved in a temporary file at:

    cat ~/.scantoolrc

Please note that the values on that file contain some basic settings
 that apply to all circunstances (the general and comm sections),
 but also some values that vary depending on the car you connect it to
 (the sensors section)

The basic values are:

    cat >> ~/.scantoolrc << EOF
    version = 2.1
    
    [general]
    system_of_measurements = 1
    display_mode = 1
    log_comms = 1
    
    [comm]
    baud_rate = 4098
    comport_number = 100
    EOF


NOTE though that is better to delete the configuration file and start from zero
 if you are going to connect to a different car (make a backup of the previous one)

e.g.: 

    cp ~/.scantoolrc ~/adata/scantoolrc-HondaCivicTouring2016-20211221at1500
    rm ~/.scantoolrc

---

NOTE: The Sensor Data information is defined at: 
    ~/acode/scantool/sensors.c

---
