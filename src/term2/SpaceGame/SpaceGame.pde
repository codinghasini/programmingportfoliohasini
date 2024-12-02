// Kirubashini Senthilnathan | 6 Nov 2024 | SpaceGame
import processing.sound.*;
SoundFile laser;
Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate;
boolean play;
Timer t1, puTime;
PFont font;

void setup() {
  size(800, 800);
  s1 = new  Spaceship();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  t1 = new Timer(1000);
  t1.start();
  puTime = new Timer(2000);
  puTime.start();
  laser = new SoundFile (this, "laser17.wav.crdownload");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    if (frameCount % 1000 == 0) {
      level++;
      t1.totalTime -= 50;
      //level = level +1;
    }
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    //Render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i ++) {
      Powerup pu = powups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1) && pu.type =='h') {
        powups.remove(pu);
        s1.health += 100;
      } else if (pu.intersect(s1) && pu.type =='a') {
        s1.laserCount += 100;
        powups.remove(pu);
        if (pu.reachedBottom()) {
          powups.remove(pu);
        }
      }
    }


    // Render lasers and detect rock collide
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rocks.remove(rock);
          score += 5;
          lasers.remove(laser);
          if (rock.diam <1) {
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    //Rock distribution
    if (t1.isFinished()) {
      rocks.add(new Rock());
      t1.start();
    }
    //Rocks rendered
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        //detuct 10 points
        score -= 10;
        //deduct 10 health
        s1.health -= 10;


        //delet rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<1) {
      gameOver();
      noLoop();
    }
  }
}




void keyPressed() {
  if (!laser.isPlaying()) {
    laser.play();
  }

  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser (s1.x-10, s1.y));
    lasers.add(new Laser (s1.x+10, s1.y));
    s1.laserCount-=2;
  } else if (s1.fire() && s1.turretCount > 2) {
    lasers.add(new Laser (s1.x-10, s1.y));
    lasers.add(new Laser (s1.x+10, s1.y));
    s1.laserCount-=2;
  }
}








void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(20);
  text("Score:" + score, 20, 36);
  text("Health:" + s1.health, 200, 36);
  text("Level:" + level, 410, 36);
  text("Ammo:" + s1.laserCount, 590, 36);
}

void startScreen() {
  background(#742A4D);
  fill(#AA1B59);
  font = createFont("Courier New", 32);
  textFont(font);
  textSize(60);
  text("Welcome to SpaceGame!", 40, 245);
  textSize(40);
  text("Made by Kirubashini S", 175, 300);
  textSize(50);
  text("Please click to start", 100, 500);
  textSize(30);
  text("Powerups: purple = ammo, yellow = health", 40, 600);
  if (mousePressed) {
    play = true;
  }
}


void gameOver() {
  background(#742A4D);
  fill(#AA1B59);
  font = createFont("Courier New", 32);
  textFont(font);
  textSize(60);
  text("Game Over :(", 200, 300);
  textSize(40);
  text("level:" + level, 310, 350);
  textSize(50);
  text("Score:" + score, 255, 500);
  //text("Game Over", width/2, 300);
  //text("Score:" + score, width/2, 320);
  //text("level:" + level, width/2, 340);
}

void ticker() {
}

void mousePressed() {
  if (!laser.isPlaying()) {
    laser.play();
  }
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount--;
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser (s1.x-10, s1.y));
    lasers.add(new Laser (s1.x+10, s1.y));
    s1.laserCount-=2;
  } else if (s1.fire() && s1.turretCount > 2) {
    lasers.add(new Laser (s1.x-10, s1.y));
    lasers.add(new Laser (s1.x+10, s1.y));
    s1.laserCount-=2;
  }
}
