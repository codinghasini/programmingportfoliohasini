class Spaceship {
  // Member Varaibles
  int x, y, w, laserCount, turretCount, health;

  //Constructor
  Spaceship() {
    x = width/2;
    y= height/2;
    w= 100;
    laserCount = 25;
    turretCount = 2;
    health = 5;
  }
  // Member Methods
  void display() {
    stroke(#C65F0A);
    fill(#FA8D08);
    ellipse(x-0, y+63, 10, 40);
    stroke(#430606);
    fill(#811E1E);
    square(x, y+40, 20);
    stroke(0,0,0);
    fill(#AA1B59);
    ellipse(x, y, 40, 90);
    fill(99);
    ellipse(x+2, y+30, 65, 10);
    fill(99);
    circle(x, y-5, 20);
  }




  void move(int tempX, int tempY) {
    x = tempX;
    y= tempY;
  }


  boolean fire() {
    if (laserCount > 0) {
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
