// Processing language intro class
// http://hello.processing.org/editor
// 20181028

// SETUP
void setup() {
  size(500,400);
}


// DRAW
void draw() {
  // color args: r,g,b (light values)
  background(231,238,154);
  if (mousePressed) {
    background(20,100,200);
    stroke(30,100,150);
    fill(50,120,50);
    } else {
  stroke(77,64,218);
  fill(0,200,60);
  }
  // shapes args: y,x,w,h
  rect(250,200,150,180); 
  // if mouseX/Y is used, then figures will move
  // with the mouse acordingly.
  ellipse(250,mouseY,180,180);
  if (mousePressed) {
    rect(50,20,150,180);
  } else {
      ellipse(50,20,150,190);
  }
  stroke(255,0,0);
  fill(0,0,255);
  ellipse(mouseX,mouseY,40,80);
}
