//Mover hoppebold = new Mover();

int alder = 18;

void setup() {
  size(700, 400);
}

void draw() {
    baggrund();
}

void baggrund() {
  noStroke();
  background(0, 204, 204);
  fill(150, 75, 0);
  rectMode(CORNERS);
  rect(100, 400, 150, 200);
  rect(300, 400, 350, 200);
  rect(500, 400, 550, 200);
  fill(0, 255, 0);
  ellipse(100, 200, 75, 75);
  ellipse(80, 230, 75, 75);
  ellipse(150, 200, 75, 75);
  ellipse(170, 230, 75, 75);
  ellipse(100, 260, 75, 75);
  ellipse(150, 260, 75, 75);
  ellipse(125, 230, 75, 75);
  
  ellipse(300, 200, 75, 75);
  ellipse(280, 230, 75, 75);
  ellipse(350, 200, 75, 75);
  ellipse(370, 230, 75, 75);
  ellipse(300, 260, 75, 75);
  ellipse(350, 260, 75, 75);
  ellipse(325, 230, 75, 75);
  
  ellipse(500, 200, 75, 75);
  ellipse(480, 230, 75, 75);
  ellipse(550, 200, 75, 75);
  ellipse(570, 230, 75, 75);
  ellipse(500, 260, 75, 75);
  ellipse(550, 260, 75, 75);
  ellipse(525, 230, 75, 75);

  fill(255, 255, 0);
  ellipse(700, 0, 100, 100);
}
