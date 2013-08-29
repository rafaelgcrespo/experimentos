// Mangueira colorida
// Inspirado nos aprendizados do livro Nature of Code
// Use as teclas w,a,s,d para movimentar o emissor
// qualquer dúvida entre em contato rafaelgcrespo@gmail.com


Cannon cannon;
boolean isPressed = false;
char keyValue;


void setup() {
  
  size(1024,768);
  cannon = new Cannon(int(random(width)),int(random(height)));
  smooth();
  
}

void draw() {
  
  pushStyle();
  fill(255,255,255,30);
  rect(0,0,width,height);
  popStyle();
  
  
  cannon.update();
  cannon.display();
  
  if(keyPressed==true) {
    cannon.walk(key);
  }
  
  if(mouseX>0 && mouseY>0){
  cannon.shoot();
  }
  
}


void keyPressed() {
 isPressed = true;
 keyValue = key;
  
}
void keyReleased() {
 isPressed = false;
}
 
  

