//random cell
//by Rafael Guimarães Crespo
//rafealgcrespo@gmail.com

import controlP5.*;

ControlP5 cp5;
Grid[] grid;

int stageWidth = 1024;
int stageHeight = 768;

int showGrid = 1;

int sides = 9;
int radius = 15;
int steps =  4;
int stepsPadding = 15;
int triangles = 9;
int cells = 4;

int bgRed = 5;
int bgGreen = 5;
int bgBlue = 5;

int interfacePaddingY = 50;
int interfaceBetweenPaddingY = 20;
int interfacePaddingX = 50;

int interfaceWidth = 250;

int paddingXCells = ((stageWidth-200)/(cells+1))+interfaceWidth;
int paddingXBetweenCells = paddingXCells -interfaceWidth;


int randomRedStart = 0;
int randomRedEnd = 255;
int randomGreenStart = 20;
int randomGreenEnd = 21;
int randomBlueStart = 49;
int randomBlueEnd = 50;
int randomAlphaStart = 99;
int randomAlphaEnd = 100;


void setup() {
  
  size(stageWidth, stageHeight, OPENGL);
  
  smooth(8);
  
  background(bgRed,bgGreen,bgBlue);
  fill(0);
  rect(0,0,interfaceWidth,height);
  
  grid = new Grid[cells];
  cp5 = new ControlP5(this);
  
  interfaceDraw();

  for(int i=0;i<cells;i++) {
    
  grid[i] = new Grid(paddingXCells, height/2, radius, sides, steps, stepsPadding);
  
  paddingXCells+=paddingXBetweenCells;
  
  grid[i].createTriangles(triangles);
  
  }
}


void draw() {
  
}

void mouseReleased() {
  pushStyle();
  paddingXCells = ((stageWidth-200)/(cells+1))+interfaceWidth;
  paddingXBetweenCells = paddingXCells-interfaceWidth;
  
  background(bgRed,bgGreen,bgBlue);
  
  fill(0);
  strokeWeight(0);
  rect(0,0,interfaceWidth,height);
  
  grid = new Grid[cells];
  
  for(int i=0;i<cells;i++) {
    grid[i] = new Grid(paddingXCells, height/2, radius, sides, steps, stepsPadding);
    paddingXCells+=paddingXBetweenCells;
    grid[i].createTriangles(triangles);
    //grid[i].changeTriangles(); 
    
  
  }
  
 
  
}


