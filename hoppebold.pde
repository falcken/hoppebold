//Mover hoppebold = new Mover();

int alder = 18;

void setup() {
  size(600, 400);
}

void draw() {
    baggrund();
}

void baggrund() {
  background(100, 200, 13);
  fill(50, 50, 100);
  rectMode(CORNERS);
  rect(100, 400, 150, 200);
  ellipse(200, 300, 50, 50);
}
