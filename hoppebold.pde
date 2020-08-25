//Mover[] movers = new Mover[100];
PFont f;
int score = 0;
ArrayList<Mover> movers = new ArrayList<Mover>();
Catcher catcher = new Catcher();
int moverAmount = 0;
boolean paused = false;

void setup() {
  size(700, 400);
  f = createFont("Courier", 32, true);
}

void draw() {
  if (!paused) {
    baggrund();

    //PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.08);

    for (int i = 0; i < movers.size(); i++) {
      //checkCatched(movers.get(i));
      for (int j = 0; j < movers.size(); j++) {
        if (j != i) {
          movers.get(i).checkCollision(movers.get(j));
        }
      }
      //movers.get(i).applyForce(wind);
      movers.get(i).applyForce(gravity);
      movers.get(i).update();
      movers.get(i).checkEdges();
      //catcher.checkCatched(movers.get(i), i);
      checkCatched(movers.get(i), i);
      movers.get(i).display();
    }
    catcher.display();
  }
  displayInfo();
}

void baggrund() {
  noStroke();
  background(0, 204, 204);
  fill(150, 75, 0);
  rectMode(CORNERS);
  //træstamme venstre
  rect(100, 400, 150, 200);
  // træstamme midte
  rect(300, 400, 350, 200);
  //træstamme højre
  rect(500, 400, 550, 200);
  fill(102, 204, 0);
  // trækrone venstre
  ellipse(100, 200, 75, 75);
  ellipse(80, 230, 75, 75);
  ellipse(150, 200, 75, 75);
  ellipse(170, 230, 75, 75);
  ellipse(100, 260, 75, 75);
  ellipse(150, 260, 75, 75);
  ellipse(125, 230, 75, 75);
  // trækrone midte
  ellipse(300, 200, 75, 75);
  ellipse(280, 230, 75, 75);
  ellipse(350, 200, 75, 75);
  ellipse(370, 230, 75, 75);
  ellipse(300, 260, 75, 75);
  ellipse(350, 260, 75, 75);
  ellipse(325, 230, 75, 75);
  // trækrone højre
  ellipse(500, 200, 75, 75);
  ellipse(480, 230, 75, 75);
  ellipse(550, 200, 75, 75);
  ellipse(570, 230, 75, 75);
  ellipse(500, 260, 75, 75);
  ellipse(550, 260, 75, 75);
  ellipse(525, 230, 75, 75);
  //sol
  fill(255, 255, 0);
  ellipse(700, 0, 100, 100);

  stroke(255);
  line(0, 350, width, 400);
  triangle(0, 350, 0, 400, width, 400);
}

void checkCatched(Mover other, int i) {
  float catcherLocX = catcher.location.x;
  float catcherLocY = catcher.location.y;

  float locX = other.location.x;
  float locY = other.location.y;

  int index = i;

  if (locX > catcherLocX-50 && locX < catcherLocX+50) {
    if (locY > catcherLocY && locY < catcherLocY+20 && other.velocity.y > 0) {
      println("CATCHED!");
      score++;
      moverAmount--;
      other.alive = false;
      spawnNew();
    }
  }
}

void spawnNew() {
  float catcherLocX = catcher.location.x;
  float catcherLocY = catcher.location.y;
  if (score < 10) {
    movers.add(new Mover(2, catcherLocX+random(-275, 275), 50));
    moverAmount++;
  } /*else {
   for (int i = int(score/10); i > 0; i--) {
   movers.add(new Mover(2, catcherLocX+random(-275, 275), 50));
   moverAmount++;
   }*/
}

void displayInfo() {
  textFont(f);
  textAlign(LEFT);
  fill(0);
  textSize(16);
  text("Score:", 10, 365);
  textSize(32);
  text(score, 10, 390);

  textSize(16);
  text(moverAmount, 200, 390);
}

void mouseClicked() {
  if (moverAmount < 100) {
    //movers[moverAmount] = new Mover(2, mouseX, mouseY);
    movers.add(new Mover(2, mouseX, mouseY));
    moverAmount++;
  }
}

void keyPressed() {
  if (key == 'r') {
    moverAmount = 0;
    //movers = new Mover[100];
    movers.clear();
    score = 0;
  }

  if (key == 'p') {
    if (!paused) {
      paused = true;
    } else {
      paused = false;
    }
  }

  if (key == 'd') {
    catcher.moveRight();
  }

  if (key == 'a') {
    catcher.moveLeft();
  }

  if (key == 'w') {
    catcher.moveUp();
  }

  if (key == 's') {
    catcher.moveDown();
  }
}



/*void checkCatched(Mover other) {
 float locX = other.location.x;
 float locY = other.location.y;
 
 float catcherLocX = catcher.location.x;
 float catcherLocY = catcher.location.y;
 
 int index = movers.indexOf(other);
 
 if (locX > catcherLocX && locX < catcherLocX+100) {
 if (locY > catcherLocY) {
 println("CATCHED!");
 movers.remove(index);
 }
 }
 }*/
