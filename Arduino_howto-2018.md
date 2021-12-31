# Arduino howto

2018 Viktor Godard

- Arduino
    - Arduino IDE       (adventures on Tamiya RC Unimog automation)
    - Processing IDE

---

I started on Oct 2018 with the book "**Getting Started with Arduino**", 2nd edition by **Massimo Banzi**.

I finished the book on 20181028 and did all the exercises.


Below are the resources I used to learn how to convert my RC **Tamiya Unimog**
 so it could have very basic autonomous capabilities (2018).

See the Unimogbot specs and sketch for final and successfully ran project :)


### Resources:

EXPLORING ARDUINO: A New Book by Jeremy Blum: 
https://youtu.be/dcyy6fHLkhg

Language Reference: 
https://www.arduino.cc/reference/en/

Glossary: 
https://www.arduino.cc/glossary/en/

What is an Arduino Shield?: 
https://youtu.be/KeCN4t79vdM

Arduino Buying Guide 2017: Shawn's Picks: 
https://youtu.be/zJJkNJWWcIU

Project Hub: 
https://create.arduino.cc/projecthub

ARDUINO MOTOR SHIELD TUTORIAL: 
https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/

How to control Servo motor with Arduino with and without potentiometer: 
https://youtu.be/kZ9b31gVemc

Using Arduino Motor Shield to control 2 DC motors: 
https://youtu.be/kIgbjyqNrV8

Robojax.com source code for YouTube Videos (good): 
http://robojax.com/learn/arduino/

Arduino for Beginners 20 Using a Motor Shield: 
https://youtu.be/cqfkH7pyyfY

SPI (Serial Parallel Interface): 
https://learn.sparkfun.com/tutorials/serial-peripheral-interface-spi

NOTE: SPI is synchronous Master-Slave, 4wires, full duplex, 10Mbits/s 
versus Serial Port asynchronous TX/DX, 2 wires, 230.2Kbits/s

I2C ( ): 
https://learn.sparkfun.com/tutorials/i2c 

NOTE: The best combo of SPI and Serial Port: synchronous, Master-Slave, 2 wires, full duplex? 400Kbits/s.

Control Large DC Motors with Arduino! SyRen Motor Driver Tutorial: 
https://youtu.be/OW-Bf3yjUyE

RC MERCEDES-BENZ UNIMOG 406: 
https://www.tamiyausa.com/shop/110-trucks/rc-mercedes-benz-unimog-406-3/

NOTE: I painted my Unimog yellow though, it looked so much better ;)

---

## Extra notes:

I got the chassis below, but decided not to use it as completing such project is expensive and with not enough ROI.

Lesson learn: 
- 1 to 4 motors maximum (this one had 6 wheels).
- lower Amperage motors are better to learn IOT/Robotics.

Dagu Wild Thumper 6WD All-Terrain Chassis 
https://www.pololu.com/product/1561

> The three motors on each side of the robot are wired in parallel, so only two channels of motor control are required to get this chassis moving.
> The motors are intended for a maximum nominal operating voltage of 7.2 V (2V minimum), and each has a stall current of 6.6 A and a no-load current of 420 mA at 7.2 V.
> Since the motors will briefly draw the full stall current when abruptly starting from rest (and nearly twice the stall current when abruptly going from full speed in one direction to full speed in the other), we recommend a motor driver capable of supplying the 20A combined per-channel stall current of these motors at 7.2 V.


Pololu Dual VNH5019 Motor Driver Shield for Arduino:

https://www.pololu.com/product/2507

https://github.com/pololu/dual-vnh5019-motor-shield


DAGU CONTROLLER FOR WILD THUMPER 6X6 CHASSIS (for ref only, not on sale):

https://www.robotshop.com/community/forum/t/lmr-review-dagu-wild-thumper-motor-driver/13660

---
