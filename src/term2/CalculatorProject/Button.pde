class Button {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on, isNum;
  // Constructor
  Button(int x, int y, int w, int h, char val, boolean isNum) {
    this.x=x;
    this.y=y;
    this.h=h;
    this.w=w;
    w = 30;
    h = 30;
    c1 = color(#F5DCE6);
    c2 = color(#E33989);
    this.val = val;
    on=false;
    this.isNum = isNum;
  }
  // Member Methods
  void display() {
    if (on == true) {
      fill(c2);
    } else {
      fill(c1);
    }

    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
