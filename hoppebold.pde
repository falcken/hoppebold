Mover[] movers = new Mover[100];
int moverAmount = 0;

void setup() {
  size(700, 400);
}

void draw() {
  baggrund();


  PVector wind = new PVector(0.01,0);
  PVector gravity = new PVector(0,0.1);

  for (int i = 0; i < moverAmount; i++) {
    for (int j = 0; j < moverAmount; j++) {
      if (j != i) {
        movers[i].checkCollision(movers[j]);
      }
    }
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
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

void mouseClicked() {
  if (moverAmount < 100) {
    movers[moverAmount] = new Mover(2, mouseX, mouseY);
    moverAmount++;
  }
}
