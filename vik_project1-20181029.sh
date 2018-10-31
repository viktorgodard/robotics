# Vik_Project1
# Convert RC Unimog to Arduino controlled. 

The intro to the ARDUINO MOTOR SHIELD REV3:
    https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/
    https://store.arduino.cc/usa/arduino-motor-shield-rev3
    https://www.arduino.cc/en/uploads/Main/arduino_MotorShield_Rev3-schematic.pdf
    https://www.st.com/en/motor-drivers/l298.html
    https://www.st.com/resource/en/datasheet/l298.pdf
Specs:
    Operating Voltage:	5V to 12V
    Motor controller:	L298P, Drives 2 DC motors or 1 stepper motor
    Max current:    	2A per channel or 4A max (with external power supply)
    Current sensing:	1.65V/A
    Other:              Free running stop and brake function
Pin Mapping:
    Function	Channel A	Channel B
    -----------------------------------
    Direction	Digital 12	Digital 13
    Speed (PWM)	Digital 3	Digital 11
    Brake   	Digital 9	Digital 8
Current Sensing	Analog 0	Analog 1

Start with the main Motor:
I was able to connect the Unamog Motor to Channel B and ran the code in sketch
"Motor Shield 1-Channel DC Motor Demo"
It works with no-load, but once I put it in the floor, the current draw is too high
for what the Arduino Motor Shield can provide.

Now to the Servo:
    Reference: https://www.arduino.cc/en/Reference/Servo
    Note that loading the servo library disables analogWrite() (PWM) functionality
    on pins 9 and 10, whether or not there is a Servo on those pins.
    That means that we can not use Channel A of the Motor Shield, only Channel B.
    To provide power to the servo, I tried to use the Vin pin and create a voltage divider
    with resistors to lower the voltage from the battery from 7.2V to 6V, but the 
    voltage was probably still to high.
    I had to connect the Servo to the 5V pin on the Arduino, then it worked.
    Also, I am using pin 6 PWM instead of so not to conflict with the Motor Shield.
    Testing with the servo "Sweep" sketch, I was able to determine the turning radius
    of the Unimog (as I marked the limits, then disconnected the bearing).
    The turning radio range is 50 degrees, from 70 to 120 degrees.
    Again, this is tested with no-load. 


The how-to is at:
    RC Car Hack With Android And Arduino 
    https://create.arduino.cc/projecthub/danionescu/rc-car-hack-with-android-and-arduino-d31a95
Servo:
    https://learn.sparkfun.com/tutorials/hobby-servo-tutorial
Voltage dividers:
    https://learn.sparkfun.com/tutorials/voltage-dividers
PWM: 
    https://learn.sparkfun.com/tutorials/pulse-width-modulation

The battery provides 7.2V and 2000mAh (2Ah) and it is Ni-Cd.

The servo requires 4.8V min to 6V max at max 450mA with no-load.
So we can use one of the ports on the Arduino Motor Shield, but we need some
resistors to drive down (divide) the voltage:
    as per the formula: Vout = (Vin) (R2/(R1+R2))
                           6 = (7.2) (10K/(2K+10K))
    and the diagram:
        Vin----R1----|-----R2----Ground
                     Vout
                     
For the HiTec servo, pin1 (black) = Ground
                     pin2 (red)   = Power (Vout in this case)
                     pin3 (yellow)= Control signal
                     
The Motor requires 7.2V and can draw a lot of Amps, but it seems to do OK with
    the battery we have (2Ah).

The code in the demo is to contol the RC via Bluethoot instead:
    the sketch is called btRcCar.ino
    https://bitbucket.org/danionescu/arduino/src/164319ee4421e6dc633b94b9b2cc1a34fb47b2e8/robots/btRcCar/btRcCar.ino?at=default&fileviewer=file-view-default
    and there is an Android app to code.
    
But my porpuse is to automate not to remote control, so just use the code as a guide.

Next steps:
    cut wires
    test
    
# General Specs:
Item: RC Mercedes-Benz Unimog 406 Series U900 (CC-01)
Scale: 1/10 Electric R/C Car Series No.457
Link: http://www.tamiya.com/english/products/58457unimog/index.htm
Length: 407mm
Width: 220mm
Height: 229mm
Weight: 1460g
Wheelbase: 242mm
Tread (Front & Rear): 163mm
Tire Width/Diameter (Front & Rear): 33/90mm

Chassis: Ladder Frame Bathtub Type
Drivetrain: Longitudinally Placed Motor Shaft-Driven Full-Time 4WD
Differential: Front and Rear 3-Bevel Differential Gears
Front Suspension: Double Wishbone, Rear Suspension: 4-Link Rigid
Dampers: Front and Rear CVA Oil Dampers
Gear Radio: Gear Ratio＝1：14.67

ESC: TEU-104BK ESC Tamiya
Motor: RS540 Type RS-540SH , made by Tamiya Mabuchi Motor Co. LTD
Servo: HS-645MG HiTec ultra torque Servo

# Electronic Speed Controller Specs:
ESC: TEU-104BK ESC Tamiya
Link: https://www.tamiyausa.com/shop/tools/rc-esc-teu-104bk-brushed-2/
Battery: Lithium-Ion battery only!
BEC: Warning, this model as no BEC (battery eliminator circuitry) 
     which is needed by modern RC receivers to regulate and reduce voltage 
     from 7.2V down to 6V
Size: 39.4x36.5x15mm. Weight: 47g. 
Input voltage: 6.6-7.2V.
Maximum continuous current of 60A forward and 30A reverse.
Motor support: Sport Tuned Motors (Item 53068) and 25T and above motors.
Heat and current protection functions with LED indicator.
Battery voltage cut-off function can be disabled. 
The setting button allows the forward/reverse and neutral positions to be easily set. 
The reverse function can be disabled. 
Features heat and current protection functions with LED indicator. 
Forward (100%) and reverse (50%) output. 
Equipped with an aluminum heat sink.

# Motor Specs:
Motor: RS540 Type RS-540SH-7520 , made by Tamiya Mabuchi Motor Co. LTD
Link: http://www.alphalanding.com/rc-track/rs_540rhsh.pdf
Torque: 27 or 25 Turn Tamiya Torque Tuned motor
Top Speed: 24.3Km/h or 26km/h

# Servo Specs:
Servo: HS-645MG HiTec ultra torque Servo
Link: https://www.robotshop.com/media/files/pdf/hs645mg.pdf
Dimensions:  1.59" x 0.77"x 1.48" (40.6 x 19.8 x 37.8mm)
Product Weight:  1.94oz. (55.2g)
Output Shaft Style:  24 tooth (C1) spline
Voltage Range:  4.8V - 6.0V
No-Load Speed (4.8V):  0.24sec/60°
No-Load Speed (6.0V):  0.20sec/60°
Stall Torque (4.8V):   106.93 oz/in. (7.7kg.cm)
Stall Torque (6.0V):   133.31 oz/in. (9.6kg.cm)
Max PWM Signal Range (Standard): 553-2520μsec
Travel per µs (out of box):  .100°/μsec
Max Travel (out of box): 197°
Pulse Amplitude:  3-5V
Operating Temperature:  -20°C to +60°C
Current Drain - idle (4.8V):      8.8mA
Current Drain - idle (6.0V):      9.1mA
Current Drain - no-load (4.8V): 350mA
Current Drain - no-load (6V):   450mA
Continuous Rotation Modifiable: Yes
Direction w/ Increasing PWM Signal:  Clockwise
Deadband Width:  8µs
Motor Type: 3 Pole Ferrite
Potentiometer Drive: Indirect Drive
Feedback Style:  5KΩ Potentiometer
Output Shaft Support:   Dual Ball Bearings
Gear Type:  Straight Cut Spur
Gear Material:  3 Metal Gears and 1 Resin Metal Gear
Wire Length: 11.81" (300mm)
Wire Gauge:  22AWG


