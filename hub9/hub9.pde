//lularocha@gmail.com


//random cell
//by Rafael Guimarães Crespo
//rafealgcrespo@gmail.com

//importando biblioteca de UI e Som
import controlP5.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.pdf.*;

//Criando os objetos
Minim minim;  
AudioPlayer jingle;
FFT fftLin;
ControlP5 cp5;
MultiList songList;
MultiListButton b;
Grid[] grid;

int vertexGlobalId = 0;
boolean savePDF = false;

//Declarando Variáveis a serem controladas pela UI (a maioria)
float spectrumScale = 8;

int stageWidth = 1700;
int stageHeight = 768;

int sides = 9;
int radius = 15;
int steps =  4;
int stepsPadding = 15;
int howManyShapes = 15;
int shapesVertex = 3;
int cells = 3;
int howManyLines = 1;


int bgRed = 5;
int bgGreen = 5;
int bgBlue = 5;

float rotation = 0.00;

int interfacePaddingY = 50;
int interfaceBetweenPaddingY = 20;
int interfacePaddingX = 50;

int interfaceWidth = 300;

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

int strokeSize = 0;
int strokeRedStart = 255;
int strokeRedEnd = 255;
int strokeGreenStart = 255;
int strokeGreenEnd = 255;
int strokeBlueStart = 255;
int strokeBlueEnd = 255;
int strokeAlphaStart = 0;
int strokeAlphaEnd = 0;

boolean equalizer = false;
boolean showGrid = false;

String[] songs = {"shabba.mp3", "strong.mp3", "dontyouworrychild.mp3", "pursuitofhappiness.mp3", "stereohearts.mp3","sweetnothing.mp3","wildonetwo.mp3"};
int selectedSong = 0;

int equalizerPower = 20;
int equalizerLimit = 50;

void setup() {
  
  //configurações do Stage
  size(stageWidth,stageHeight, OPENGL);
  smooth(8);
  
  //cria os objetos para load e analise do espectro do som
  minim = new Minim(this);
  jingle = minim.loadFile(songs[int(random(songs.length))], 1024);
  jingle.loop();
  fftLin = new FFT( jingle.bufferSize(), jingle.sampleRate() );
  
  //desenha a UI no stage
  cp5 = new ControlP5(this);
  interfaceDraw();
  
  //cria grids e os triangulos em cada grid
  grid = new Grid[cells];
  for(int j=0; j<howManyLines; j++) {
    int paddingYLines =  stageHeight/(howManyLines+1);
  for(int i=0;i<cells;i++) {
    grid[i] = new Grid(paddingXCells, paddingYLines+(j*paddingYLines), radius, sides, steps, stepsPadding);
    paddingXCells+=paddingXBetweenCells;
    grid[i].createShapes(howManyShapes, shapesVertex);
  }
  }
}


void draw() {
  if(savePDF){
      beginRecord(PDF, "hub9.pdf");  
    }
  //equalizador
  if(equalizer) {
    jingle.play();
  fftLin.linAverages(256);
  fftLin.forward( jingle.mix );
  }
  else {
   jingle.pause(); 
    
  }
  
  //desenha stage
  background(bgRed,bgGreen,bgBlue);
  fill(0);
  noStroke();
  rect(0,0,interfaceWidth,height);
  fill(255);
  
  //desenha os triangulos na tela
  for(int i=0;i<grid.length;i++) {
    
    grid[i].update();
    
    if(showGrid) {
      grid[i].showGrid(true);
    }
    else {
      grid[i].showGrid(false);
    }
    
    grid[i].display();
    
  }
  if(savePDF){
  endRecord();
  savePDF=false;
  }
  
}

//atualiza os triangulos/grid quando o mouse eh clicado
void mouseReleased() {
  
  
  paddingXCells = ((stageWidth-200)/(cells+1))+interfaceWidth;
  paddingXBetweenCells = paddingXCells-interfaceWidth;
  
  background(bgRed,bgGreen,bgBlue);
  
  fill(0);
  strokeWeight(0);
  rect(0,0,interfaceWidth,height);
  
  grid = new Grid[cells];
  for(int j=0; j<howManyLines; j++) {
    int paddingYLines =  stageHeight/(howManyLines+1);
  for(int i=0;i<grid.length;i++) {
    grid[i] = new Grid(paddingXCells, paddingYLines+(j*paddingYLines), radius, sides, steps, stepsPadding);
    paddingXCells+=paddingXBetweenCells;
    grid[i].createShapes(howManyShapes, shapesVertex);
  }
  }
 
  
}


//se apertar w, muda os triangulos de lugar, mas nao re-cria os grids
void keyPressed() {
  if (key == 'w') {
    

  for(int i=0;i<cells;i++) {
    
    grid[i].changeShapes(); 

  }
  
 
  }
  
  if(key=='s'){
    
    savePDF = true;
    
    
  }
}


