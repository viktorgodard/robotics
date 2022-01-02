# On-Board Diagnostics (OBD) on Linux, howto

20211231
Viktor Godard


## On-Board Diagnostics or OBD is associated with a vehicle self-diagnostics and reporting capability.


TODO: **SparkFun** has an excellent tutorial and the hardware needed to get started with OBD-II, see:
https://learn.sparkfun.com/tutorials/getting-started-with-obd-ii


TODO: **Tinkernut** has an excellent tutorial on how to create an OBD dashboard using Python, see:

- Make A Smart Car Digital Display - DIY Smart Car (Part 4)
  https://www.youtube.com/watch?v=VCU81PfSlcI
- here is the playlist for all the episodes:
  https://www.youtube.com/playlist?list=PLlg8lN4r9qWjdKXEfWgc1U6JKFLn9eYPY


TODO: **Scantool** has a good lab tutorial for their devices, see:
- https://www.scantool.net/scantool/downloads/194/18060_IVN_lab_manual.pdf
- https://www.scantool.net/scantool/downloads/195/18060_IVN_Slides.pdf


### OBD Use Cases

- Diagnostics
- Telematics and Vehicle Tracking
- Usage-based Insurance (UBI)
- Driver Behavior Monitoring and Feedback
- Performance Tuning and Reflashing
- Fleet Management


### Evolution

- 1968: Volkswagen introduced OBD to Europe, it evolved into the EOBD standard (European OBD).
- 1975: Datsun (Nissan) introduced it to Japan.
- 1988: In the USA, California introduced OBD-I to facilitate emissions testing.
- 1994: the California Air Resources Board issues the OBD-II specification.
- 1996: OBD-II becomes mandatory for all vehicles sold in the USA.
- 2001: EOBD becomes mandatory for all cars vehicles in Europe.
- 2008: OBD-II and ISO 15765-4 signaling standard (a variant of CAN) becomes mandatory for all vehicles sold in the USA.
- 2008: China introduces OBD standard GB18352 for vehicles sold there.
- 2010: HDOBD (Heavy Duty OBD, SAE J1939) specification becomes mandatory for selected commercial vehicles sold in the USA.


### OBD-II Connector

- It is a standardized hardware interface defined as a female 16-pin (2x8) J1962 connector.
- It is required to be within 2 feet (0.61 m) of the steering wheel.
- Only 9 pins of the 16 pins are specified, the other 7 pins are used in different ways depending on the vehicle manufacturer.

### SAE J1962 defines the pinout of the connector as follows

- Bus Line of SAE J1850 PWM and VPW: pin **2** = Bus Positive, pin **10** = Bus Negative
- Ground:                             pin **4** = Chassis ground, pin **5** = Signal ground
- HS CAN (ISO 15765-4 and SAE J2284): pin **6** = CAN High, pin **14** = CAN Low
- ISO/KWP (ISO 9141-2 / ISO 14230-4): pin **7** = K-Line, pin **15** = L-Line
- Battery voltage: pin **16**


### legislated OBD-II protocols
SAE J1850 PWM (Ford)
SAE J1850 VPW (GM)
ISO 9141-2    (Asian, European, Chrysler)
ISO 14230-4   (Keyword Protocol 2000)
ISO 15765-4   (HS CAN 250/500 kbps, 11/29 bit)
SAE J1939     (HD CAN)


### Standards

The official standards are not available for free unfortunately.
If you feel like to pay for them, you can find the latest revisions at:

- **SAE J1962**, Diagnostic Connector (2016 rev):
https://www.sae.org/standards/content/j1962_201607/

- **SAE J1850**, Class B Data Communications Network Interface (2015 rev):
https://www.sae.org/standards/content/j1850_201510/

- **SAE J1939**, On-Highway Equipment Control and Communication Network (2021 rev):
    - https://www.sae.org/standards/content/j1939/1_202109/
    - https://en.wikipedia.org/wiki/SAE_J1939

- **SAE J2284**, has 3 parts:
    - J2284/3_201611, High-Speed CAN (HSC) for Vehicle Applications at 500 KBPS
      https://www.sae.org/standards/content/j2284/3_201611/
    - J2284/4_201606, High-Speed CAN (HSC) for Vehicle Applications at 500 kbps with CAN FD Data at 2 Mbps
      https://www.sae.org/standards/content/j2284/4_201606/
    - J2284/5_201609, High-Speed CAN (HSC) for Vehicle Applications at 500 kbps with CAN FD Data at 5 Mbps
      https://www.sae.org/standards/content/j2284/5_201609/

- **ISO 15765-4**:2021
    - Road vehicles — Diagnostic communication over Controller Area Network (DoCAN) — Part 4: Requirements for emissions-related systems.
      https://www.iso.org/standard/78384.html

- **ISO 14230-4**, Road vehicles — Diagnostic systems — Keyword Protocol 2000 — Part 4: Requirements for emission-related systems (2000 rev)
https://www.iso.org/obp/ui/#iso:std:iso:14230:-4:ed-1:v1:en



### Abbreviations

- **SAE** : Society of Automotive Engineers
- **ISO** : International Organization for Standardization
- **MIL** : Malfunction Indicator Light (Check Engine light)
- **DLC** : Diagnostic Link Connector (OBD Port)
- **DTC** : Diagnostic Trouble Code
- **CAN** : Controller Area Network
- **PID** : Parameter ID
- **ECU** : Electronic Control Unit
- Types of ECUs:
    - **PCM** : Powertrain [Control Module]
    - **ECM** : Engine
    - **TCM** : Transmission
    - **BCM** : Body
    - Etc.: ABS/ESC, SRS, HVAC, immobilizer, ...



### Software

There is a nice list at: https://www.elmelectronics.com/help/obd/software/#Linux , the ones I have tried so far are:

- screen
- Scantool   github.com:kees/scantool.git
- PiOBD-II   github.com:BirchJD/PiOBDII.git


The other ones I want to try are:

- FreeDiag        https://github.com/fenugrec/freediag/  (todo)
- CAN-Utils       https://github.com/linux-can/can-utils/blob/master/can-j1939-kickstart.md
- OBD GPS Logger  http://icculus.org/obdgpslogger/
- ELMODB          https://github.com/rzetterberg/elmobd
  Go library for communicating with cars OBD-II system using ELM327 based USB-devices.
  


### Hardware

**WARNING**: With most available interfaces, do not use a computer powered from wall socket,
 because your car may not be adequately grounded.


Note that most of the available end-user devices are based on the ELM Electronics (London Ontario, Canada) chips.
Their most popular chip is the ELM327. There is also a low power version ELM327L, and a bluetooth version ELM329.


- Xtrcuk ELM327 OBD2 Scanner USB Android Adapter for Windows Code Read Check Engin Light Diagnostic Scan Tool (Black)
  upports all OBD2 protocols (J1850PWM,HS CAN, MS CAN, HS CAN2, HS CAN3)

  https://www.amazon.com/gp/product/B08ZJDNF1C/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1


- OBDLink EX FORScan OBD Adapter
  ELM327 based, switch seamlessly between HS-CAN, MS-CAN, and J1850 Ford networks

  https://www.amazon.com/gp/product/B081VQVD3F/ref=ppx_yo_dt_b_asin_title_o06_s00?ie=UTF8&psc=1


- OBDLink MX+ OBD2 Bluetooth Scanner
  Enhanced OEM support for Ford, GM, Mazda, Nissan/Infinity, Toyota/Lexus/Scion, Honda, Hyundai, Kia

  https://www.amazon.com/gp/product/B07JFRFJG6/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1


- bbfly-A9 OBD II OBD2 16 Pin Splitter Extension 1x Male and 2X Female Extension Cable Adapter (2FT/60CM)
  This is very helpful to better position the OBD device and to avoid damaging the main OBD port over time. 
  https://www.amazon.com/gp/product/B0711LGRGQ/ref=ppx_yo_dt_b_asin_title_o09_s00?ie=UTF8&psc=1



### Testing connection to device ELM327

We are going to use the screen console multiplexer to connect to the ELM327,
 as a pre-req, make sure your user is in the dialout group:

    sudo usermod -a -G dialout viktor
    newgrp dialout
    groups


Before connecting the ELM327, check available TTYs devices:

    ls /dev/tty*

Connect the ELM327 and find out the newest TTY device:

    ls /dev/tty*

You should see /dev/ttyUSB0


Connect with screen to it (the parameters are tty and baud rate):

    screen /dev/ttyUSB0 38400

Query the ELM327:

    01 01

Output (e.g.):

    >1 01 01 07 E5 00


Check the OBD-II_PIDs. The significant values are the 3rd and 4th pairs (e.g. 01 07 in this case)


Read the ELM327 Data Sheet, on page 35, "Interpreting Trouble Codes":

https://www.elmelectronics.com/wp-content/uploads/2017/01/ELM327DS.pdf




https://en.wikipedia.org/wiki/OBD-II_PIDshttps://en.wikipedia.org/wiki/OBD-II_PIDs


### Additional Resources

Scantool.net:

OBD Development Kit

The OBD Development Kit is a modular development system designed to speed up the development of devices that interface with the OBD bus. It consists of the Interconnect Board, three removable modules (Power, OBD Drivers, and STN OBD IC), and an OBD cable.

https://www.scantool.net/obd-development-kit/


ECUsim 2000 OBD Simulator

ECUsim™ 2000 is an OBD simulator for OBD-II software and hardware testing and development. The 2000 is available in 3 editions which offer varying levels of user control. The Professional & Ultimate editions feature over 40 software commands that provide complete administration of the simulator, and allow you to create custom ECUs, add/delete DTCs & freeze frames, create PIDs, and dynamically assign their values.

https://www.scantool.net/ecusim-2000/


ECUsim 5100 OBD Simulator

ECUsim™ 5100 is a small, lightweight, benchtop simulator that can be used for testing and development of OBD devices and software. It supports all legislated OBD protocols, fixed and user adjustable parameter IDs (PIDs), diagnostic trouble codes (DTCs), freeze frames, and many other SAE J1979 services.

https://www.scantool.net/ecusim-5100/


J1939 Bus OBD Simulator (HDOBD)

OE91C1700 is intented to help to Truck and CAR j1939 protocol programmer.
With a few external component , this chip simulate an ECU with 29/250 CAN BUS diagnose output via j1939 protocol.
 some of J1979 compliant DMs are implemented.

https://www.scantool.net/j1939-bus-obd-simulator/

https://www.ozenelektronik.com/downs/pdf/oe91c1700.pdf


### Sources

- Wikipedia:
    - On-Board Diagnostics  https://en.wikipedia.org/wiki/On-board_diagnostics
    - OBD-II PIDs  https://en.wikipedia.org/wiki/OBD-II_PIDs
    - ELM327  https://en.wikipedia.org/wiki/ELM327

