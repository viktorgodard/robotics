// Motor Shield Distance Sensor Test
// Viktor Godard 20181031
// with         Sharp GP2Y0A 02YK0F  
//              distance 20 cm to 150 cm (8″ to 60″), differential 2.05V, Update period: 38 ± 10 ms
// original was Sharp GP2Y0A 41SK0F  
//              distance: 4 cm to 30 cm (1.5″ to 12″), differential 2.3V, Update period: 16.5 ± 4 ms
// https://www.instructables.com/id/How-to-Use-the-Sharp-IR-Sensor-GP2Y0A41SK0F-Arduin/


const int distanceSensor = 2; // got to use A2, as A0 and A1 are taken by Motor Shield.
float volts;
int distance;

void setup() {
  Serial.begin(9600); // start the serial port
}

void loop() {
  
  // 5v
  volts = analogRead(distanceSensor)*0.0048828125;  // value from sensor * (5/1024)
  
  // the following line changed because of the longer distance (150cm vs 30cm):
  distance = 52*pow(volts, -1); // 13*pow for 30cm, 52*pow for 150cm
  
  delay(1000); // slow down serial port 
  
  if (distance <= 150){          // changed from 30cm to 150cm
    Serial.println(distance);   // print the distance
  }
}