// Kirubashini S | Temp Converter | 09/23/24

void setup() {
  size(400, 200);
}

void draw() {
  background(128);
  textSize(15);
  text("Kirubashini's Farehneit to Celsius Converter", width/2, 50);
  line(0, 150, width, 150);
  for (int i=0; i<width+1; i=i+20) {
    textSize(10);
    line(i, 145, i, 155);
    textAlign(CENTER);
    text(i-200, i, 165);
  }

  text("Cel: " + farToCel(mouseX-200), width/2, 100);
  println("MouseX:" +  mouseX + " : " + farToCel(mouseX));
  
   text("Cel: " + farToCel(mouseX), width/2, 80);
  println("MouseX:" +  mouseX + " : " + celToFar(mouseX));
}

float farToCel(float tempFar) {
  //formulate to calc cel conv
  tempFar = (tempFar-32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = (tempCel+32) * (9/5);
  return tempCel;
}
