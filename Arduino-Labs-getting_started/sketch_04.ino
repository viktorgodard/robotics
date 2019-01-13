// Example 04: Fade an LED in and out like on
//             like the sleeping LED in a laptop.
//             20181025

const int LED = 9;
int i = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  for (i = 0; i < 255; i++) {  // loop from 0 to 254 (fade in)
    analogWrite(LED, i);
    delay(10);
  }

  for (i = 255; i > 0; i--) { // loop from 255 to 1 (fade out)
    analogWrite(LED, i);
    delay(10);
  }
}