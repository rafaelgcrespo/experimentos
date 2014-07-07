import megamu.mesh.*;

boolean gravidadeLidada = false;
boolean atracaoMutuaLigada = true;
boolean friccaoLigada = false;
boolean attractorLigado = true;
boolean bordasLigada = false;
boolean conectarPontos = false;
boolean meshLigado = false;


int quantos =   500;
int quantosA = 10;
int rangeConectar = 50;

float massA = 40;
float distancia;

float g = 0.004;
float attractorG =1;
float c = 0.01;
float gravidade = 0.1;

float minSize =0.8;
float maxSize =4;

int qualDistancia = 0;

Attractor[] a = new Attractor[quantosA];
Mover[] movers = new Mover[quantos];

int[] cr_ = new int[movers.length];
int[] cg_ = new int[movers.length];
int[] cb_ = new int[movers.length];


void setup() {
  
  size(640,480);
  noStroke();
  smooth();
 rectMode(CENTER);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(minSize,maxSize),random(width),random(height)); 
    cr_[i] = int(random(255,255));
    cg_[i] = int(random(150,255));
    cb_[i] = int(random(0,80));

}
for(int i = 0; i < a.length; i++) {

a[i] = new Attractor(massA);

}

}

void draw() {
  
  //background(50,60);
  
   
  
  for(int i = 0; i < a.length; i++) {
  a[i].drag();
  a[i].hover(mouseX,mouseY);
  a[i].display();
  
  
  
  }
  
  fill(0,60);
  rect(width/2,height/2,width,height);
  
  float[][] points = new float[movers.length][2];
  for (int i = 0; i < movers.length; i++) {
    
    if(meshLigado){
      
      		
      points[i][0] = movers[i].location.x; // first point, x
      points[i][1] = movers[i].location.y; // first point, y

      }

    PVector gravity = new PVector(0,gravidade);
    if(gravidadeLidada) {movers[i].applyForce(gravity);};
    
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
    
    movers[i].update();
    movers[i].display(cr_[i],cg_[i],cb_[i]);
    //movers[i].display(0,0,0);
    if(bordasLigada){
      movers[i].checkEdges();
  
     };
  }
 
   /*Delaunay myDelaunay = new Delaunay( points ); 
      float[][] myEdges = myDelaunay.getEdges();

    for(int i=0; i<myEdges.length; i++)
    {
	float startX = myEdges[i][0];
	float startY = myEdges[i][1];
	float endX = myEdges[i][2];
	float endY = myEdges[i][3];
         //strokeWeight(4);
        //stroke(255,255,255);
	//line( startX, startY, endX, endY );
}*/


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


