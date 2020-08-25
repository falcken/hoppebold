class Mover {
  
  float mass;
  float radius;
  float lastColl = 0;
  float maxVelo = 10;
  float lastLocationX = 0;
  float lastLocationY = 0;
  boolean alive = true;
  int index;
  
  color fill = color(random(0, 255), random(0, 255), random(0, 255));
  
  // linjens hældning
  float b = 0.07142857142;
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector lastLocation;
  
  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0.5,0.5);
    acceleration = new PVector(0,0);
    radius = mass*8;
  }
 
  void applyForce(PVector f) {
    acceleration.add(f);
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    if (velocity.x > maxVelo || velocity.y > maxVelo) {
      velocity.x = 1;
      velocity.y = 1;
    }
  }
  
  void display() {
    if (alive) {
      stroke(0);
      fill(fill);
      ellipse(location.x,location.y,mass*16,mass*16);
    } else {
      movers.remove(movers.indexOf(this));
    }
  }
  
  void checkEdges() {
    
    if (location.x > width-radius) {
      location.x = width-radius;
      velocity.x *= -1;
    } else if (location.x < 0+radius) {
      velocity.x *= -1;
      location.x = 0+radius;
    }
    
    /*if (location.y > height-radius) {
      location.y = height-radius;
      velocity.y *= -1;
    } else if (location.y < 0+radius) {
      velocity.y *= -1;
      location.y = 0+radius;
    }*/
    
    // check kollision med skrå linje
    if (location.y > 350+location.x*b-radius) {
      location.y = 350+location.x*b-radius;
      velocity.y *= -1;
    } else if (location.y < 0+radius) {
      velocity.y *= -1;
      location.y = 0+radius;
    }

  }
  
  void checkCollision(Mover other) {
    // find distancen mellem de to bolde
    PVector distanceVect = PVector.sub(other.location, location);
    
    // find længden af vectoren der sepererer de to bolde
    float distanceVectMag = distanceVect.mag();

    // find kollisionslængden
    float minDistance = radius + other.radius;
    
    //float collisionAngle = PVector.angleBetween(location, other.location);
    //collisionAngle = collisionAngle*(180/PI);
    
    float heading = degrees(location.heading());
    
    // hvis sammenstød
    if (distanceVectMag <= minDistance /*&& other.alive*/) {
      
      if(distanceVectMag < minDistance-5) {
        location.x = random(0, 700);
        location.y = random(0, 300);
        velocity.set(0.5, 0.5);
      }
      
      //println(l  ocation.x, location.y);
      //location.x = location.x + radius*cos(collisionAngle);
      //location.y = location.y + radius*sin(collisionAngle);
      //println(heading);
      
      velocity.x *= -1;
      velocity.y *= -1;
     
      fill = color(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}
