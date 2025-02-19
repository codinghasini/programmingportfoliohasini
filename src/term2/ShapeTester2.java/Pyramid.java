class Pyramid {
  // Declaring and initializing the attributes
  double pl;
  double pw;
  double ph;

  // Constructor
  Pyramid(double pl, double pw, double ph) {
      this.pl = pl;
      this.pw = pw;
      this.ph = ph;
  }

  // Method to calculate the pyramid volume
  public double pyramidVol() {
    double pVol = (pl * pw * ph) / 3; // Calculates the volume, assuming a rectangular pyramid
    return pVol;
  }

  // Method to calculate the pyramid surface area
  public double pyramidArea() {
    double pyramidArea = (pl * pw) + (pl * Math.sqrt(Math.pow(pw / 2.0, 2) + Math.pow(ph, 2))) + (pw * Math.sqrt(Math.pow(pl / 2.0, 2) + Math.pow(ph, 2)));
    return pyramidArea;
  }
}