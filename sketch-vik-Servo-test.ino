/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.
 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep

 Modified by Viktor Godard 20181030
 with modifications to work with the Arduino Motor shield for my Unamog project
*/

#include <Servo.h>

Servo myservo;  // create servo object to control a servo


int pos = 0;    // variable to store the servo position

void setup() {
  myservo.attach(6);  // attaches the servo on pin 6
}

void loop() {
  // note, the servo can go from 0 to 180 degrees, I limited it here because I am 
  // looking for the range for the Unamog.
  delay(10000);
  for (pos = 70; pos <= 120; pos += 1) { // goes from 70 degrees to 120 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
  delay(10000);
  for (pos = 120; pos >= 70; pos -= 1) { // goes from 120 degrees to 70 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
}