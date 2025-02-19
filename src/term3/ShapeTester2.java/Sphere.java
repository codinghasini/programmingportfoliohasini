class Sphere {
  // Declaring the radius attribute
  double r;

  // Constructor
  Sphere(double r) {
      this.r = r;
  }

  // Method to calculate the sphere volume
  public double sphereVol() {
    double sVol = (4.0 / 3.0) * Math.PI * Math.pow(r, 3);
    return sVol; 
  }

  // Method to calculate the sphere surface area
  public double sphereSufArea() {
    double sphereArea = 4 * Math.PI * Math.pow(r, 2);
    return sphereArea;
  }
}