Cell cell;
PGraphics cellCanvas;
PFont f;

import controlP5.*;
import processing.pdf.*;
int asd = 0;
color bgColor = color(0,0,255);

ControlP5 cp5;

int interfacePaddingX = 10;
int interfacePaddingY = 80;
int interfaceBetweenPaddingY = 20;

int cx = 250;
int cy = 20;
int cw = 300;
int ch = 300;
int ow = 0;
int or = 0;
int og = 0;
int ob = 0;
int oa = 0;
int bgr = 30;
int bgg = 30;
int bgb = 30;
int bga = 255;
int sbgr = 100;
int sbgg = 100;
int sbgb = 100;
int sbga = 255;
int ix = 0;
int iy = 50;
int iw = 200;
int ih = 200;
int ir = 0;
int io = 255;
int px = 0;
int py = 0;
int pr = 30;
int psx = 0;
int psy = 0;
String t = "BLOCKS";
boolean sp = false;

boolean saveOneFrame = false; 


void setup() {
  
  
  
  size(1280, 1024);
  
  cp5 = new ControlP5(this);
  f = createFont("Arial", 24);
  textFont(f);
  
  configInterface();
  
  cell = new Cell();
    cell.setType(t);
    cell.createCanvas(cx,cy,cw,ch);
    cell.setOutline(ow, color(or, og, ob, oa));
    cell.setBG(color(bgr, bgg, bgb, bga));
    
    cell.importImage(0, "cell.png", 50, 50);
      cell.imgPosition(0, ix, iy);
      cell.imgSize(0, iw, ih);
      cell.imgRotation(0, ir);
      cell.imgOpacity(0, io);
      
    cellCanvas = cell.getCanvas();  
    
      cell.patternPadding(px, py);
      cell.patternRotation(pr);
      cell.patternSlide(psx,psy);
    
    cell.generateFinalCell();
}

void draw() {
  
  if(saveOneFrame == true) {
    beginRecord(PDF, "Line.pdf"); 
  }
  
  background(sbgr, sbgg, sbgb);
  
  
  cell.update();
  
  //coloque o que quiser na célula
  cellCanvas.beginDraw();
      cellCanvas.strokeWeight(1);
      cellCanvas.stroke(50);
      cellCanvas.fill(255,255,255);
      cellCanvas.ellipse(asd,10,30,30);
      cellCanvas.fill(random(255),255,255,150);
      float speed = abs((mouseX-cx)-(pmouseX-cx)) + abs((mouseY-cy)-(pmouseY-cy));
      cellCanvas.ellipse((mouseX-cx), (pmouseY-cy), speed, speed);
  cellCanvas.endDraw();
  cell.display();
  fill(50);
  rect(0,0,200,1000);
  fill(255);
    textAlign(LEFT);
    text(t, 20,50);
    
    if(saveOneFrame == true) {
      endRecord();
      saveOneFrame = false; 
  }
  
  asd++;
  
}



void mouseReleased() {
  
    cell = new Cell();
    cell.createCanvas(cx,cy,cw,ch);
    cell.setType(t);
    cell.setOutline(ow, color(or, og, ob, oa));
    cell.setBG(color(bgr, bgg, bgb, bga));
    cell.importImage(0, "cell.png", 50, 50);
      cell.imgPosition(0, ix, iy);
      cell.imgSize(0, iw, ih);
      cell.imgRotation(0, ir);
      cell.imgOpacity(0, io);
      
    cellCanvas = cell.getCanvas();  
    
      cell.patternPadding(px, py);
      cell.patternRotation(pr);
      cell.patternSlide(psx,psy);
    
    if(sp) {
       
     cell.showPattern(); 
      
    }
    
    else{
     
     cell.hidePattern(); 
      
    }
    
    cell.generateFinalCell();
    cell.update();
    cell.display();
    
    
}

void keyPressed() {
  
 if(key=='s') {
  
   sp = true;
  cell.showPattern();
 } 
 
 if(key=='a') {
   sp = false;
   cell.hidePattern();
   
 }
 
 if(key=='q') {
   
   t = "BLOCKS";
   cell.setType(t);
 }
 
 if(key=='w') {
   
   t = "BRICKS";
   cell.setType(t);
 }
 
 if(key=='e') {
   
   t = "HALFDROP";
   cell.setType(t);
 }
 
 if(key=='r') {
   
   t = "TRIANGLES";
   cell.setType(t);
 }
 
 if(key=='z') {
  saveOneFrame = true; 


   
 }
  
}
