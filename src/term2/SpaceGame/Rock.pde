class Rock {
  int x, y, diam, speed;
  PImage image;
  Rock() {
    image = loadImage("Rock.png");
    x= int(random(width));
    y= -100;
    diam = int(random(20, 80));
    speed = int(random(1, 5));
  }

  void display() {
    imageMode(CENTER);
    image.resize(170,170);
    image(image,x,y);
    
  }


  void move () {
    y=y+speed;
  }

  boolean reachedBottom () {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
