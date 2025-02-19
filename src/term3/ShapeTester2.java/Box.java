// Creating a Java class
class Box {
  // Declaring and initializing the attributes
  double l;
  double w;
  double h;
  
  //constructor
  Box(double l, double w, double h) {
      this.l = l;
      this.w = w;
      this.h = h;
  }

  // methods to set breed, age, and color of the dog
  public double boxVol() {
    double vol = l*w*h; //calulates the volume user inputs
    return vol; //
  }
  public double boxSufArea() {
    double sufArea = 2*l*w + 2*l*h + 2*h*w;
    return sufArea;
  }
}