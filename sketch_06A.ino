// Example 6A: Blink LED at the rate specified by the
//             value of the analogue input.
//             20181026

const int LED = 13;
int val = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
  // Analog pins are automatically set as inputs.
}

void loop() {
  // put your main code here, to run repeatedly:
  val = analogRead(0);
  digitalWrite(LED, HIGH);
  delay(val);
  digitalWrite(LED, LOW);
  delay(val);
}