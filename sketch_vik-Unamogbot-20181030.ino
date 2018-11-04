/* Name: sketch_vik-Unamogbot-20181030
 * Date: Viktor Godard 20181029-1102
 * Description: modifying my Tamiya RC Unamog to auto-pilot via Arduino.
 *              using Arduino Uno R3 and Arduino Motor Shield R3
 * Resources:
 * https://www.arduino.cc/en/Reference/Servo
 * https://www.arduino.cc/en/Tutorial/Sweep
 * https://learn.sparkfun.com/tutorials/hobby-servo-tutorial
 * https://store.arduino.cc/usa/arduino-motor-shield-rev3
 * https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/
 * Motor Shield pin mapping:
 *  Function:        A:   B:
 *  Direction        D12  D13  (HIGH=forward, LOW=backward)
 *  Speed (PWM)      D03  D11  (lowSpeed=0, fullSpeed=255)
 *  Brake            D09  D08  (HIGH=engaged, LOW=disengage)
 *  Current Sensing  A00  A01
 *  If using servos, only channel B is available.
 *  
 *  Servo pin mapping:
 *  red: 5V, black: GND, yellow: signal PWM pin 6
 *  
 *  Distance senson pin mapping:
 *  red: 5V, black: GND, white: signal Analog pin 2
 */

// Tested and working 20181102
// notice that it keeps going backwards to the left until it clears the obstacle,
// then it will go forward to the right.

// Servo
#include <Servo.h>  
// note that the Servo library disables pin 9 and 10 for any other uses, 
// but pin 9 is used by Motor Shield to break on Channel A, therefore 
// only channel B can be used.
Servo servo1;      // create servo1 object.
int pos = 95;      // turning radius of Unamog is 50 degrees, this means:
int tleft = 70;    // full left:   70 degrees
int tright = 120;  // full right: 120 degrees
int tstraight = 95;// straight:    95 degrees

// Motor
// Using only motor on channel B:
const int Direction = 13;   // (HIGH=forward, LOW=backward)
const int Speed = 11;       // (lowSpeed=0, fullSpeed=255)
const int Brake = 8;        // (HIGH=engaged, LOW=disengage)

// IR Distance Sensor
const int distanceSensor = 2; // got to use A2, as A0 and A1 are taken by Motor Shield.
float volts;
int distance;

void setup() {
  servo1.attach(6);  // to avoid conflicts with Motor Shield, we do not use pin 9.
  pinMode(Direction, OUTPUT);
  pinMode(Brake, OUTPUT);
  // Speed is a PWM pin, which does not need to be initiated as output (?).
  //Serial.begin(9600); // start the serial port to debug distance sensor (only for debugging)
  delay(3000);   // pause to load changes in code
}


void loop() {
  volts = analogRead(distanceSensor)*0.0048828125;  // value from sensor * (5/1024)
  distance = 52*pow(volts, -1);  // 52 is the factor to match the sensor output to 150cm
  // Serial.println(distance);   // print the distance (for debugging)
  
  if (distance > 40) {
    // if we are more than 40cm away from any obstacles, run in circles to the right
    servo1.write(tright);           // turn stering right
    digitalWrite(Direction, HIGH);  // set direction forward
    digitalWrite(Brake, LOW);       // disengage brake
    analogWrite(Speed, 150);        // go speed (max is 255)
  }

  if (distance < 40) {
    // if we are less than 40cm from an obstacle, turn left and backup for 3 secs
    // then straighten steering and stop.
    digitalWrite(Brake, HIGH);      // engage brake
    delay(10);                    // for 3 seconds
    servo1.write(tleft);            // turn stering left
    digitalWrite(Direction, LOW);    // set direction backwards
    digitalWrite(Brake, LOW);        // disengage brake
    analogWrite(Speed, 150);         // go speed (max is 255)
    delay(100);                    // continue for 1 seconds
    servo1.write(tstraight);         // straight steering
    digitalWrite(Brake, HIGH);       // engage brake
  }

}