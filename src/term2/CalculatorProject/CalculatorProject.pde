// Kirubashini S | Sept 30 | 24
//Button b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b1O, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24;
Button[] buttons = new Button[23];
String dVal = "0";
float l, r, result;
char op;
boolean left;



void setup() {
  size(210, 300);
  stroke(#E33989);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  buttons [0] = new Button(65, 230, 80, 30, '0', true);
  buttons [1]= new Button(40, 190, 30, 30, '1', true);
  buttons [2]= new Button(40, 150, 30, 30, '4', true);
  buttons [3]= new Button(40, 110, 30, 30, '7', true);
  buttons [4]= new Button(50, 70, 50, 25, 'π', false);
  buttons [5]= new Button(85, 110, 30, 30, '8', true);
  buttons [6]= new Button(85, 150, 30, 30, '5', true);
  buttons [7]= new Button(85, 190, 30, 30, '2', true);
  buttons [8]= new Button(110, 70, 50, 25, '.', false);
  buttons [9]= new Button(132, 110, 30, 30, '9', true);
  buttons [10]= new Button(132, 150, 30, 30, '6', true);
  buttons[11]= new Button(132, 190, 30, 30, '3', true);
  buttons [12]= new Button(172, 70, 50, 25, '^', false);
  buttons [13]= new Button(177, 190, 30, 30, 'X', false);
  buttons [14]= new Button(177, 150, 30, 30, '÷', false);
  buttons [15]= new Button(177, 110, 30, 30, '+', false);
  buttons [16]= new Button(177, 230, 30, 30, '-', false);
  buttons [17]= new Button(132, 230, 30, 30, '=', false);
  buttons [18] = new Button(40, 330, 80, 30, '0', true);
  buttons [19] = new Button(40, 270, 30, 30, '√', false);
  buttons [20] = new Button(85, 270, 30, 30, '±', false);
  buttons [21] = new Button(132, 270, 30, 30, 's', false);
  buttons [22] = new Button(177, 270, 30, 30, 'C', false);
}

void draw() {
  background(255, 142, 195);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }



  updateDisplay();
}



void updateDisplay() {
  fill(#B4577E);
  rectMode(CENTER);
  rect(width/2, 25, 190, 30);
  fill(245);
  textSize(15);
  textAlign(RIGHT);
  text(dVal, width-50, 25);
}

void mousePressed() {
  println("Left:" + l + "Right:" + r + "Result:" + result + "Op:" + op + " L " + left );
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val == 'C') {
      dVal = "0";
      l = 0;
      r = 0;
      result = 0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val == '+') {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val == '=') {
      performCalc();
    } else if (buttons[i].on && buttons[i].val == 'X') {
      handleEvent("X", false);
    } else if (buttons[i].on && buttons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (buttons[i].on && buttons[i].val == '-') {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val == '^') {
      op= '^';
      left = false;
      dVal="0";
    } else if (buttons[i].on && buttons[i].val == '±') {
      if (left) {
        l = -l;
        dVal = str(l);
      } else {
        r = -r;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (left == false) {
        r = PI;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val == '.') {
      if (left) {
        if (!dVal.contains(".")) {
          dVal += ".";
          l = float(dVal);
        }
      } else {
        if (!dVal.contains(".")) {
          dVal += ".";
          l = float(dVal);
        }
      }
    } else if (buttons[i].on && buttons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left == false) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val == 's') {
      if (left) {
        l = l*l;
        dVal = str(l);
      } else if (left == false) {
        r = r*r;
        dVal = str(r);
      }
    }
  }
}




void performCalc() {
  if (op == '+') {
    result = l + r;
    dVal = str(result);
  } else if (op == '-') {
    result = l - r;
    dVal = str(result);
  } else if (op == 'X') {
    result = l * r;
    dVal = str(result);
  } else if (op == '÷') {
    result = l / r;
    dVal = str(result);
  } else if (op == '^') {
    result = pow(l, r);
    dVal = str(result);
  }
}

void keyPressed() {
  println("Key:" + key);
  println("KeyCode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
    println("0");
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
    println("1");
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
    println("2");
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
    println("3");
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
    println("4");
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
    println("5");
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
    println("6");
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
    println("7");
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
    println("8");
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
    println("9");
  } else if (key == '+' || keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
    println("+");
  } else if (key == '÷' || keyCode == 111 || keyCode == 47) {
    handleEvent("÷", false);
    println("÷");
  } else if (key == '-' || keyCode == 109 || keyCode == 45 ) {
    handleEvent("-", false);
    println("-");
  } else if (key == 'X' || keyCode == 88) {
    handleEvent("X", false);
    println("X");
  } else if (key == '.' || keyCode == 110 || keyCode == 46) {
    handleEvent(".", false);
    println(".");
  } else if ( keyCode == 10 ) {
    handleEvent("=", false);
    println("=");
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length()<12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      // set l to dVal and check length of dVal
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = '+';
  } else if (keyVal.equals("-") && !isNum) {
    left = false;
    dVal = "0";
    op = '-';
  } else if (keyVal.equals("X") && !isNum) {
    left = false;
    dVal = "0";
    op = 'X';
  } else if (keyVal.equals("÷") && !isNum) {
    left = false;
    dVal = "0";
    op = '÷';
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals(".") && !isNum) {
    if (!dVal.contains(".")) {
      dVal+= keyVal;
    } else if (keyVal.equals("^") && !isNum) {
      op= '^';
      left = false;
      dVal="0";
    } 
  }
}
