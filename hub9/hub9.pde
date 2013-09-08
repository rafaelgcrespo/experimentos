//random cell
//by Rafael Guimarães Crespo
//rafealgcrespo@gmail.com

//importando biblioteca de UI e Som
import controlP5.*;
import ddf.minim.analysis.*;
import ddf.minim.*;

//Criando os objetos
Minim minim;  
AudioPlayer jingle;
FFT fftLin;
ControlP5 cp5;
Grid[] grid;

int vertexGlobalId = 0;

//Declarando Variáveis a serem controladas pela UI (a maioria)
float spectrumScale = 8;

int stageWidth = 1024;
int stageHeight = 768;

int showGrid = 0;

int sides = 9;
int radius = 15;
int steps =  4;
int stepsPadding = 15;
int howManyShapes = 15;
int shapesVertex = 3;
int cells = 3;

int bgRed = 5;
int bgGreen = 5;
int bgBlue = 5;

float rotation = 0.01;

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

int equalizer= 0;


void setup() {
  
  //configurações do Stage
  size(stageWidth, stageHeight, OPENGL);
  smooth(8);
  
  //cria os objetos para load e analise do espectro do som
  minim = new Minim(this);
  jingle = minim.loadFile("strong.mp3", 1024);
  jingle.loop();
  fftLin = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  
  //desenha a UI no stage
  
  cp5 = new ControlP5(this);
  interfaceDraw();
  
  //cria grids e os triangulos em cada grid
  grid = new Grid[cells];
  for(int i=0;i<cells;i++) {
    grid[i] = new Grid(paddingXCells, height/2, radius, sides, steps, stepsPadding);
    paddingXCells+=paddingXBetweenCells;
    grid[i].createShapes(howManyShapes, shapesVertex);
  }
}


void draw() {
  
  //equalizador
  if(equalizer!=0) {
    jingle.play();
  fftLin.linAverages(256);
  fftLin.forward( jingle.mix );
  }
  else {
   jingle.pause(); 
    
  }
  
  background(bgRed,bgGreen,bgBlue);
  fill(0);
  noStroke();
  rect(0,0,interfaceWidth,height);
  fill(255);
  
  //desenha os triangulos na tela
  for(int i=0;i<grid.length;i++) {
    
    grid[i].update();
    
    if(showGrid == 1) {
      grid[i].showGrid(true);
    }
    else {
      grid[i].showGrid(false);
    }
    
    grid[i].display();
    
  }
  
}

void mouseReleased() {
  
  
  paddingXCells = ((stageWidth-200)/(cells+1))+interfaceWidth;
  paddingXBetweenCells = paddingXCells-interfaceWidth;
  
  background(bgRed,bgGreen,bgBlue);
  
  fill(0);
  strokeWeight(0);
  rect(0,0,interfaceWidth,height);
  
  grid = new Grid[cells];
  
  for(int i=0;i<grid.length;i++) {
    grid[i] = new Grid(paddingXCells, height/2, radius, sides, steps, stepsPadding);
    paddingXCells+=paddingXBetweenCells;
    grid[i].createShapes(howManyShapes, shapesVertex);
  }
  
 
  
}

void keyPressed() {
  if (key == 'w') {
    

  for(int i=0;i<cells;i++) {
    
    grid[i].changeShapes(); 

  }
  
 
  }
}


