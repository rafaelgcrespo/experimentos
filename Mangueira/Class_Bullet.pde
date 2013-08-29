class Bullet {
  
  PVector location = new PVector();
  PVector direction = new PVector();
  PVector acceleration = new PVector();
  PVector stick = new PVector();
  int bulletWidth = int(random(30,40));
  int bulletHeight = int(random(10,20));
  float mass = bulletWidth/2;
  float bulletSpeed;
  float angle;
  boolean rightEdge = true;
  boolean leftEdge = false;
  boolean topEdge = false;
  boolean bottomEdge = true;
  int redColor = int(map(mouseX,0,width,0,255));
  int greenColor = int(map(mouseY,0,height,0,255));
 
  
  
  Bullet(PVector bulletLocation, PVector bulletDirection, PVector stickStart, float rotateAngle ) {
    
    location = bulletLocation.get();
    direction = bulletDirection.get();
    PVector mouse = new PVector(mouseX,mouseY);
    PVector distanceVector = PVector.sub(mouse,location);
    float distance = distanceVector.mag();
    bulletSpeed = distance/random(16,18);
    angle = rotateAngle;
    stick = stickStart.get();

    
  }
  
  void applyForce(PVector force) {
    
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
    
  }
  
  void update() {

    direction.normalize();
    direction.mult(bulletSpeed);
    direction.add(acceleration);
    location.add(direction);
    acceleration.mult(0);

  }
  
  
  void display() {
    float headTo = atan2(direction.y,direction.x);
    pushStyle();
    noStroke();
    fill(redColor,greenColor,255,40);
    pushMatrix();
    translate(location.x,location.y);
    //rotate(angle);
    rotate(headTo);
    ellipse(0,0,bulletWidth,bulletHeight);
    popMatrix();
    popStyle();
    
  }
  
  void checkEdges() {
    
    if (location.x > width && rightEdge) {
      location.x = width;
      direction.x *= -1;
    } else if (location.x < 0 && leftEdge) {
      location.x = 0;
      direction.x *= -1;
    }

    if (location.y > height && bottomEdge) {
      location.y = height;
      direction.y *= -1;
    }  else if (location.y < 0 && topEdge) {
      location.y = 0;
      direction.y *= -1;
    }
  }
  
  
}
