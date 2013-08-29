class Cannon {
  
  float angle;
  PVector location;
  PVector direction;
  int baseWidth = 50;
  int baseHeight = 50;
  int stickWidth = 30;
  int stickHeight = 10;
  PVector stick = new PVector(0+baseHeight/2, 0-stickWidth/2);
  Bullet[] bullet = new Bullet[500];
  boolean shooted = false;
  int b = 0;
  int b_ = 0;
  boolean maxBullet = false;
  PVector locationBullet;
  float speedChar = 10;
  PVector upMov = new PVector(0,-1*speedChar);
  PVector downMov = new PVector(0,1*speedChar);
  PVector leftMov = new PVector(-1*speedChar,0);
  PVector rightMov = new PVector(1*speedChar,0);
  PVector wind = new PVector(0.002,0);
  PVector gravity = new PVector(0,4);
  

  
  
  Cannon(int cannonX, int cannonY) {
    
    location = new PVector(cannonX, cannonY);
    
  }
  
  
  
  void update() {
    
    if(mouseX > 0 && mouseY > 0) {
      PVector mouse = new PVector(mouseX,mouseY);
      direction = PVector.sub(mouse,location);
      angle = atan2(direction.y,direction.x);
    }
    
   
    
    if(shooted) {
      
      for(int i=0; i<b_;i++){
        
        
        
        bullet[i].update();
         float c = 0.1; 
        PVector friction = bullet[i].direction.get(); 
        friction.mult(-1);
        friction.normalize();
        friction.mult(c); 
        bullet[i].applyForce(friction); 
        bullet[i].checkEdges();
        bullet[i].applyForce(wind);
        bullet[i].applyForce(gravity);
       
        
        bullet[i].display();
      }
    }

  }
  
  
  void display() {
    
    fill(190);
    stroke(0);
    strokeWeight(2);
    noStroke();
    pushMatrix();
    translate(location.x,location.y);
    ellipse(0,0,baseWidth,baseHeight);
    rotate(angle);
    rect(stick.x, stick.y ,stickHeight, stickWidth);
    popMatrix();
    
  }
  
  void shoot() {
    
    shooted = true;
    if(b < bullet.length) {
      
      bullet[b] = new Bullet(location, direction, stick, angle);
      b++;
      
      if(!maxBullet){
        
      b_++;
      
      }
    }
    
    else { 
      
      b = 0;
      bullet[b] = new Bullet(location, direction, stick, angle);
      
      b++;
      b_ = bullet.length;
      maxBullet = true;
      
    }

  }
  
  void walk(char keyValue_) {
    

    
    if(keyValue_ == 'w') {
      
      location.add(upMov);
      
    }
    
    if(keyValue_ == 's') {
      
      location.add(downMov);
      
    }
    
    if(keyValue_ == 'a') {
      
      location.add(leftMov);
      
    }
    
    if(keyValue_ == 'd') {
      
      location.add(rightMov);
      
    }
    
    
    
  }
  
  

}
