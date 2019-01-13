// Example 6B: Set the brightness of LED to 
//             a brightness specified by the
//             value of the analogue input.
//             20181026

const int LED = 9;
int val = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
  // Analog pins are automatically set as inputs.
}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(0);
  analogWrite(LED, val/4);
  // note: brightness divided by 4, because the analogRead return number 
  //       max is 1023 but the analogWrite accepts a max of 255.
  delay(10);
}