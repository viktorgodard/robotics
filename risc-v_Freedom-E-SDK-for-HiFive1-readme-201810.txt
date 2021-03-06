RISC-V Freedom-E SDK for HiFive1

201810 Viktor Godard

I completed this project successfully in October 2018.

Board: Sifive Freedom e300 HiFive1
       https://www.sifive.com/boards/hifive1

SDK:   Sifive Freedom-E
       https://www.sifive.com/software

Vendor: SiFive
        https://en.wikipedia.org/wiki/SiFive

Sifive for Developers: documentation, forums, etc. at


###
Update:
Please note, as of 2020,  the original HiFive1 board has been discontinued, there is a newer board (rev B).
Also note that the development environment has improved, now an Eclipse based IDE is provided.
   Manual 2021: https://static.dev.sifive.com/dev-tools/FreedomStudio/2021.04/freedom-studio-manual-2021-04.pdf
   Freedom Studio — v2021.04.1 Linux download: https://www.sifive.com/software
###


This repository, maintained by SiFive, Inc, makes it easy to get started developing software for the Freedom E RISC-V platform. 

### Contents ###

* RISC-V Software Toolchain 
* RISC-V Debugging Toolchain
* Board Support Packages for FE310 and Development Kits
* A Few Example Programs

### Setting up the SDK ###

First, clone this repository:

```
git clone --recursive https://github.com/sifive/freedom-e-sdk.git
```

To see Makefile options:

```
cd freedom-e-sdk
make help
```

#### Building Tools from Source ####

Ubuntu packages needed:

	$ sudo apt-get install autoconf automake libmpc-dev libmpfr-dev libgmp-dev gawk bison flex texinfo libtool libusb-1.0-0-dev make g++ pkg-config libexpat1-dev zlib1g-dev  

Next, build the tools:

```
cd freedom-e-sdk
make tools [BOARD=freedom-e300-hifive1]
```

If your machine has enough resources, you can speed up the build process by adding `-j n` to `make`, where `n` is the number of processors of your build system.


#### Using Pre-Built Binary Tools ####

If you would like to avoid compiling the tools from source, they are
available as pre-built binaries from

https://www.sifive.com/products/tools

For OpenOCD and/or RISC-V GNU Toolchain,
download the .tar.gz for your platform, and unpack it to
your desired location. Then, use the `RISCV_PATH` and `RISCV_OPENOCD_PATH`
variables when attempting to use the tools:

```
cp openocd-<date>-<platform>.tar.gz /my/desired/location/
cp riscv64-unknown-elf-gcc-<date>-<platform>.tar.gz /my/desired/location
cd /my/desired/location
tar -xvf openocd-<date>-<platform>.tar.gz
tar -xvf riscv64-unknown-elf-gcc-<date>-<platform>.tar.gz
export RISCV_OPENOCD_PATH=/my/desired/location/openocd
export RISCV_PATH=/my/desired/location/riscv64-unknown-elf-gcc-<date>-<version>
```

### Updating your SDK ###

If you'd like to update your SDK to the latest version:

```
cd freedom-e-sdk
git pull origin master
git submodule update --init --recursive
```

If you would like to recompile the entire toolchain after performing the above:

```
make uninstall
make tools
```
### Using the Tools ###

To compile a bare-metal RISC-V program:

```
cd freedom-e-sdk
make software [PROGRAM=demo_gpio] [BOARD=freedom-e300-hifive1]
```

Run `make help` for more commands.

### Benchmarking ###

#### Dhrystone ####

After setting up the software and debug toolchains, you can build and
execute everyone's favorite benchmark as follows:

- Compile the benchmark with the command `make software BOARD=freedom-e300-hifive1 PROGRAM=dhrystone LINK_TARGET=dhrystone`. Note that a slightly different linker file is used for Dhrystone which stores read only data in DTIM instead of external flash.
- Run on the HiFive1 board with the command `make upload BOARD=freedom-e300-hifive1 PROGRAM=dhrystone`.
  This will take a few minutes.  Sample output is provided below.
- Compute DMIPS by dividing the Dhrystones per Second result by 1757, which
  was the VAX 11/780's performance.  In the example below, 729927 / 1757 =
  415 DMIPS.
- Compute DMIPS/MHz by dividing by the clock rate: in the example below,
  415 / 268 = 1.55 DMIPS/MHz.

```
core freq at 268694323 Hz

Dhrystone Benchmark, Version 2.1 (Language: C)

<snip>

Microseconds for one run through Dhrystone: 1.3
Dhrystones per Second:                      729927.0
```

#### CoreMark ####

We cannot distribute the CoreMark benchmark, but following are instructions
to download and run the benchmark on the HiFive1 board:

- Download CoreMark from EEMBC's web site and extract the archive from
  http://www.eembc.org/coremark/download.php.
- Copy the following files from the extracted archive into the
  `software/coremark` directory in this repository:
  - `core_list_join.c`
  - `core_main.c`
  - `coremark.h`
  - `core_matrix.c`
  - `core_state.c`
  - `core_util.c`
- Compile the benchmark with the command `make software PROGRAM=coremark`.
- Run on the HiFive1 board with the command `make upload PROGRAM=coremark`.
- Divide the reported Iterations/Sec by the reported core frequency in MHz to
  obtain a CoreMarks/MHz value.

