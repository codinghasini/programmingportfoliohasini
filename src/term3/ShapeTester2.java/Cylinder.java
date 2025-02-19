// Creating a Java class
class Cylinder {
  // Declaring and initializing the attributes
  double cr;
  double ch;
  
  //constructor
  Cylinder(double cr, double ch) {
      this.cr = cr;
      this.ch = ch;
  }

  // methods to set breed, age, and color of the dog
  public double cyVol() {
    double vol = Math.PI * Math.pow(cr , 2) * ch;
    return vol; 
  }
  public double cySufArea() {
    double sufArea = 2 * Math.PI * cr * ch + 2 * Math.PI * Math.pow(cr , 2);
    return sufArea;
  }
}