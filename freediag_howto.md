# FreeDiag Howto

20220101 Viktor Godard

## FREEDIAG - Free diagnostic software for OBD-II compliant motor vehicles


In Ubuntu is easy to install FreeDiags


Clone the repo:

    git clone git@github.com:fenugrec/freediag.git


Read the install instructions:

    view ~/acode/freediags/doc/build_system.txt


Install the pre-reqs:

    sudo apt install wget unzip build-essential cmake g++ make pkg-config


Run the compiler script:

    cd ~/acode/freediags
    sudo ./build_simple.sh


Find the executables at:

    cd ~/acode/freediag/build/scantool
    ./diag_test
    ./freediag


TBD :)


