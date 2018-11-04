/*
Motor Shield 1-Channel DC Motor Demo
by Randy Sarafan
For more information see:
https://www.instructables.com/id/Arduino-Motor-Shield-Tutorial/

Modified by Viktor on 20181030
Pin Mapping:
    Function  Channel A Channel B
    -----------------------------------
    Direction   Digital 12  Digital 13
    Speed (PWM) Digital 3   Digital 11
    Brake       Digital 9   Digital 8
Current Sensing Analog 0    Analog 1

Use only channel B if you need to combine with the Servo library.
it combines the led fading in and out as a a test to see what PWMs are available
when using the Motor shield.
*/

const int LED = 6; // PWM
int i = 0;

void setup() {
  //Setup Channel B
  pinMode(13, OUTPUT); //Initiates Motor Channel B pin
  pinMode(8, OUTPUT); //Initiates Brake Channel B pin
  
  pinMode(LED, OUTPUT);
}

void loop(){
  //forward @ full speed
  digitalWrite(13, HIGH); //Establishes forward direction of Channel B
  digitalWrite(8, LOW);   //Disengage the Brake for Channel B
  analogWrite(11, 200);   //Spins the motor on Channel B at almost full speed (full is 255)
  delay(3000);
  digitalWrite(8, HIGH); //Eengage the Brake for Channel B
  delay(1000);
  
  //backward @ half speed
  digitalWrite(13, LOW); //Establishes backward direction of Channel B
  digitalWrite(8, LOW);   //Disengage the Brake for Channel B
  analogWrite(11, 123);   //Spins the motor on Channel B at half speed
  delay(3000);
  digitalWrite(8, HIGH); //Eengage the Brake for Channel B
  delay(1000);

  // fade in LED
  for (i = 0 ; i < 255; i++) {
    analogWrite(LED, i);
    delay(10);
  }
  // fade out LED
  for (i = 255; i > 0; i--) {
    analogWrite(LED, i);
    delay(10);
  }
}