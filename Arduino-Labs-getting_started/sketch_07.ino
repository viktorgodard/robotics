// Example 07: Send to the computer the values read
//             from analogue input 0
//             Make sure you click on "Serial Monitor"
//             after you upload.
//             20181026

const int SENSOR = 0;
int val = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(SENSOR);
  Serial.println(val);
  delay(100); // wait 100ms between each send.
}