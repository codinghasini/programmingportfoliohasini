class Laser {
  // Member Varaibles
  int x, y, w, h, speed;

  //Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y= y;
    w = 5;
    h = 10;
    speed = 5;
  }
  // Member Methods
  void display() {
    fill(#FA086D);
    rectMode(CENTER);
    rect(x,y,w,h);
    
    
  }


  void move() {
    y=y-speed;
  }


  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
