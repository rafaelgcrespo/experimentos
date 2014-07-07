boolean gravidadeLigada = true;
boolean atracaoMutuaLigada = true;
boolean friccaoLigada = true;
boolean attractorLigado = true;
boolean bordasLigada = true;
boolean movCircular = true;

float r = 0.5;

int quantos = 500;
int quantosA = 1;

float massA = 120;

float g = 0.2;
float attractorG =2;
float c = 0.01;
float gravidade = 0.1;

int alphaParticle = 100;
int alphaRender = 90;

int r1 = 0;
int r2 = 255;
int g1 = 0;
int g2 = 255;
int b1 = 0;
int b2 = 255;

float minSize = 0.1;
float maxSize =0.5;

Attractor[] a = new Attractor[quantosA];
Mover[] movers = new Mover[quantos];

int[] cr_ = new int[movers.length];
int[] cg_ = new int[movers.length];
int[] cb_ = new int[movers.length];

float[] theta = new float[movers.length];


void setup() {
  
  size(640,480, P3D);
  noStroke();
  smooth();
 rectMode(CENTER);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(minSize,maxSize),random(width/2-width/250,width/2+width/250),random(height/2-height/250,height/2+height/250)); 
    cr_[i] = int(random(r1,r2));
    cg_[i] = int(random(g1,g2));
    cb_[i] = int(random(b1,b2));
    theta[i] = int(random(0,360));

}
for(int i = 0; i < a.length; i++) {

a[i] = new Attractor(massA);

}

}

void draw() {
  
  //background(0,60);
  
  float xCircular;
  float yCircular;
  
  for(int i = 0; i < a.length; i++) {
  a[i].drag();
  a[i].hover(mouseX,mouseY);
  a[i].display();
  }
  
  fill(220,alphaRender);
  rect(width/2,height/2,width,height);

  for (int i = 0; i < movers.length; i++) {
    
    xCircular = r * cos(theta[i]);
    yCircular = r * sin(theta[i]);
    PVector circular = new PVector(xCircular,yCircular);
    
    movers[i].applyForce(circular);
    theta[i] += 0.02;
    
    PVector gravity = new PVector(0,gravidade);
    if(gravidadeLigada) {movers[i].applyForce(gravity);};
    
    for(int j=0; j< a.length; j++) {
    PVector forceA = a[j].attract(movers[i]);
    if(attractorLigado) {movers[i].applyForce(forceA);};
    }
    
    
    
    
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        
        if(atracaoMutuaLigada){movers[i].applyForce(force);};
      }
    }

    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    
    if(friccaoLigada){movers[i].applyForce(friction);};
    
    movers[i].update(movCircular);
    movers[i].display(cr_[i],cg_[i],cb_[i]);
    //movers[i].display(0,0,0);
    if(bordasLigada){movers[i].checkEdges();};
  }
  
  

}

void mousePressed() {
  for(int i = 0; i < a.length; i++) {
  a[i].clicked(mouseX,mouseY);
  }
}

void mouseReleased() {
  for(int i = 0; i < a.length; i++) {
  a[i].stopDragging(); 
  }
  
}


