

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update(boolean movCircular_) {
    if(movCircular_){
      location.add(acceleration);
    }
    else if(!movCircular_){
    velocity.add(acceleration);
    location.add(velocity);
    };
    acceleration.mult(0);
  }

  void display(int r_, int g_, int b_) {
    float angle = atan2(velocity.y,velocity.x);

    fill(r_, g_, b_, alphaParticle);

    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    ellipse(0, 0, mass*10, mass*10);
    popMatrix();
  }
  
  void checkEdges() {

    if (location.x > width) {
      velocity.x *= -1;
      location.x = width;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
    else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }

  }

  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 0.5,10);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }


}
