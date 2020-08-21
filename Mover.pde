class Mover {
  
  float mass = 5;
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
 
  void applyForce(PVector f) {
    acceleration.add(f);
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,mass*16,mass*16);
  }
  
  void checkEdges() {
    
    if (location.x > width-mass*8) {
      location.x = width-mass*8;
      velocity.x *= -1;
    } else if (location.x < 0+mass*8) {
      velocity.x *= -1;
      location.x = 0+mass*8;
    }
    
    if (location.y > height-mass*8) {
      location.y = height-mass*8;
      velocity.y *= -1;
    } else if (location.y < 0+mass*8) {
      velocity.y *= -1;
      location.y = 0+mass*8;
    }

  }
  
  void checkCollision(Mover other) {
    PVector distanceVect = PVector.sub(other.location, location);
  }
}
