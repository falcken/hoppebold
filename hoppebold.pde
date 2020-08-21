Mover[] movers = new Mover[100];
int moverAmount = 0;

void setup() {
  size(600, 400);
  /*for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),0,0);
  }*/
}

void draw() {
  baggrund();
    
    
  PVector wind = new PVector(0.01,0);
  PVector gravity = new PVector(0,0.1);

  for (int i = 0; i < moverAmount; i++) {
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
//  checkClick();
}

void baggrund() {
  background(100, 200, 13);
  fill(50, 50, 100);
  rectMode(CORNERS);
  rect(100, 400, 150, 200);
  ellipse(200, 300, 50, 50);
}

void mouseClicked() {
  if (moverAmount < 100) {
    movers[moverAmount] = new Mover(5,0,0);
    moverAmount++;
  }
}
