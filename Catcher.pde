class Catcher {
  PVector location;
  int score = 0;
  color fill = color(255, 255, 255);

  Catcher() {
    location = new PVector(width/2, 300);
  }

  void display() {
    fill(fill);
    stroke(0);
    arc(location.x, location.y, 100, 100, 0, PI);
  }

  void moveLeft() {
    if (location.x >= 50) { 
      location.add(-8, 0);
    }
  }

  void moveRight() {
    if (location.x <= 650) {
      location.add(8, 0);
    }
  }
  
  void moveDown() {
    if (location.y <= 300) { 
      location.add(0, 8);
    }
  }

  void moveUp() {
    if (location.y > 75) {
      location.add(0, -8);
    }
  }
}
