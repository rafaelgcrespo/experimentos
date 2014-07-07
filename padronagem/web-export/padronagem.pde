Cell cell;
PGraphics cellCanvas;

import controlP5.*;

color bgColor = color(0,0,255);

ControlP5 cp5;

int interfacePaddingX = 10;
int interfacePaddingY = 10;
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


void setup() {
  
  cp5 = new ControlP5(this);
  
  size(1280, 1024);
  
  configInterface();
  
  cell = new Cell();
    cell.setType(t);
    cell.createCanvas(cx,cy,cw,ch);
    cell.setOutline(ow, color(or, og, ob, oa));
    cell.setBG(color(bgr, bgg, bgb, bga));
    
    cell.importImage(0, "cell.jpg", 50, 50);
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
  
  background(sbgr, sbgg, sbgb);
  
  
  cell.update();
  
  //coloque o que quiser na célula
  cellCanvas.beginDraw();
      cellCanvas.strokeWeight(1);
      cellCanvas.stroke(50);
      cellCanvas.fill(255,255,255,150);
      float speed = abs((mouseX-cx)-(pmouseX-cx)) + abs((mouseY-cy)-(pmouseY-cy));
      cellCanvas.ellipse((mouseX-cx), (pmouseY-cy), speed, speed);
  cellCanvas.endDraw();
  cell.display();
  fill(50);
  rect(0,0,200,1000);
}



void mouseReleased() {
  
    cell = new Cell();
    cell.createCanvas(cx,cy,cw,ch);
    cell.setType(t);
    cell.setOutline(ow, color(or, og, ob, oa));
    cell.setBG(color(bgr, bgg, bgb, bga));
    
    cell.importImage(0, "cell.jpg", 50, 50);
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
  
}

class Cell {
  
  PGraphics canvas;
  PGraphics finalCell;
  PGraphics canvasCellCopy;
  PGraphics patternCanvas;
  PGraphics canvasHalfDrop;
  PGraphics triangleMask;
  PGraphics triangleCell;
  PGraphics triangleCellCanvas;
  int canvasPosX;
  int canvasPosY;
  int canvasSizeW;
  int canvasSizeH;
  int finalCellSizeW = 0;
  int finalCellSizeH = 0;
  String cellType;
  int canvasOutlineWeight;
  color canvasOutlineColor;
  int maxImages = 10;
  int howManyImgs = 0;
  PImage[] images = new PImage[maxImages];
  String[] imageURL = new String[maxImages];
  int[] imagePosX = new int[maxImages];
  int[] imagePosY = new int[maxImages];
  int[] imageSizeW = new int[maxImages];
  int[] imageSizeH = new int[maxImages];
  int[] imageRotation = new int[maxImages];
  int[] imageOpacity = new int[maxImages];
  color canvasBGColor;
  boolean patternVisible = false;
  int patternCellPaddingX = 0;
  int patternCellPaddingY = 0;
  int patternCellSizeW;
  int patternCellSizeH;
  int patternSlideX;
  int patternSlideY;
  int patternRotationValue;
  
  void Cell() {
    
    cellType = "BLOCKS";
    createCanvas(0,0,100,100);
    setOutline(1, color(255,0,0,255));
    
    
  }
  
  void createCanvas(int canvasPosX_, int canvasPosY_, int canvasSizeW_, int canvasSizeH_) {
    
    canvasPosX = canvasPosX_;
    canvasPosY = canvasPosY_;
    canvasSizeW = canvasSizeW_;
    canvasSizeH = canvasSizeH_;
    canvas = createGraphics(canvasSizeW, canvasSizeH);
  }
  
  void setType(String cellType_) {
    
    cellType = cellType_;
    t = cellType;
    
  }
  
  void setOutline(int canvasOutlineWeight_, color canvasOutlineColor_) {
    
    canvasOutlineWeight = canvasOutlineWeight_;
    canvasOutlineColor = canvasOutlineColor_;
    
  }
  
  void setBG(color canvasBGColor_) {
    
    canvasBGColor = canvasBGColor_;
    
  }
  
  void importImage(int imgIndex, String imgURL_, int imagePosX_, int imagePosY_) {
    
    if(imgIndex < maxImages && imgIndex >= 0) {
    
      howManyImgs++;
      imageURL[imgIndex] = imgURL_;
      imagePosX[imgIndex] = imagePosX_;
      imagePosY[imgIndex] = imagePosY_;
      images[imgIndex] = loadImage(imageURL[imgIndex]);
    
    }
    
  }
  
  void imgPosition(int imgIndex, int imagePosX_, int imagePosY_) {
    
    if(imgIndex < maxImages && imgIndex >= 0) {
      
      imagePosX[imgIndex] = imagePosX_;
      imagePosY[imgIndex] = imagePosY_;
    
    }
    
  }
  
  void imgSize(int imgIndex, int imageSizeW_, int imageSizeH_) {
    
    if(imgIndex < maxImages && imgIndex >= 0) {
      
      imageSizeW[imgIndex] = imageSizeW_;
      imageSizeH[imgIndex] = imageSizeH_;
      images[imgIndex].resize(imageSizeW[imgIndex],imageSizeH[imgIndex]);
    
    }
    
  }
  
  void imgRotation(int imgIndex, int imageRotation_) {
    
    if(imgIndex < maxImages && imgIndex >= 0) {
      
      imageRotation[imgIndex] = imageRotation_;
    
    }
    
  }
  
  void imgOpacity(int imgIndex, int imageOpacity_) {
    
    if(imgIndex < maxImages && imgIndex >= 0) {
      
      imageOpacity[imgIndex] = imageOpacity_;
    
    }
    
  }
  
  PGraphics getCanvas() {
  
    return canvas;
    
  } 
  
  void showPattern() {
    patternVisible = true;
  }
  void hidePattern() {
    patternVisible = false;
  }
  
  void patternPadding(int patternCellPaddingX_, int patternCellPaddingY_) {
    
    patternCellPaddingX = patternCellPaddingX_;
    patternCellPaddingY = patternCellPaddingY_;
    
  }
  
   void patternCellSize(int patternCellSizeW_, int patternCellSizeH_) {
    
    patternCellSizeW = patternCellSizeW_;
    patternCellSizeH = patternCellSizeH_;
    
  }
  
  void patternSlide(int patternSlideX_, int patternSlideY_) {
    
    patternSlideX = patternSlideX_;
    patternSlideY = patternSlideY_;
    
  }
  
  void patternRotation(int patternRotationValue_) {
    
    patternRotationValue = patternRotationValue_;
    
  }
  
  void generateFinalCell() {
    
    if(cellType=="BLOCKS") {
      finalCellSizeW = canvasSizeW+patternCellPaddingX;
      finalCellSizeH = canvasSizeH+patternCellPaddingY;
      
    }
    
    if(cellType=="HALFDROP") {
      finalCellSizeW = 2*(canvasSizeW+patternCellPaddingX);
      finalCellSizeH = canvasSizeH+patternCellPaddingY;
    }
    
    if(cellType=="BRICKS") {
      finalCellSizeW = canvasSizeW+patternCellPaddingX;
      finalCellSizeH = 2*(canvasSizeH+patternCellPaddingY);
      
    }
    
    if(cellType=="TRIANGLES") {
      finalCellSizeW = canvasSizeW+patternCellPaddingX;
      finalCellSizeH = canvasSizeH+patternCellPaddingY;
      
    }
    
    finalCell = createGraphics(finalCellSizeW , finalCellSizeH);
    
  }
  
  void drawOutline() {
   
   canvas.beginDraw();
       canvas.strokeWeight(canvasOutlineWeight);
       canvas.stroke(canvasOutlineColor);
       canvas.noFill();
       canvas.rect( 0,0  , canvasSizeW, canvasSizeH);
     canvas.endDraw(); 
    
  }
  
  void createFinalCell() {
    
    generateFinalCell();
    
    if(cellType=="BLOCKS") {
      finalCell.beginDraw();
      finalCell.image(canvas, 0, 0);
      finalCell.endDraw();
      
    }
    
    if(cellType=="HALFDROP") {
      finalCell.beginDraw();
      finalCell.image(canvas, 0, 0);
      finalCell.image(canvas, canvasSizeW+patternCellPaddingX, -((canvasSizeH+patternCellPaddingY)/2)+patternSlideY);
      finalCell.image(canvas, canvasSizeW+patternCellPaddingX,  ((canvasSizeH+patternCellPaddingY)/2)+patternSlideY);
      finalCell.endDraw();
    }
    
    if(cellType=="BRICKS") {
      finalCell.beginDraw();
      finalCell.image(canvas, 0, 0);
      finalCell.image(canvas, -((canvasSizeW+patternCellPaddingX)/2)+patternSlideX, canvasSizeH+patternCellPaddingY);
      finalCell.image(canvas, ((canvasSizeW+patternCellPaddingX)/2)+patternSlideX, canvasSizeH+patternCellPaddingY);
      finalCell.endDraw();
      
    }
    
    if(cellType=="TRIANGLES") {
        
        triangleCell = createGraphics(finalCellSizeW , finalCellSizeH);
        triangleCellCanvas = createGraphics(canvasSizeW , canvasSizeH);
        
        triangleCellCanvas.beginDraw();
          triangleCellCanvas.image(canvas,0,0);
        triangleCellCanvas.endDraw();
        
        triangleCell.beginDraw();
          triangleCell.pushMatrix();
          triangleCell.scale(1,-1);
          triangleCell.image(triangleCellCanvas, -(canvasSizeW+patternSlideX)/2, -(canvasSizeH+patternCellPaddingY));
          triangleCell.image(triangleCellCanvas, (canvasSizeW+patternSlideX)/2, -(canvasSizeH+patternCellPaddingY));
          triangleCell.popMatrix();
          triangleCell.noStroke();
          triangleCell.fill(255);
          triangleCell.triangle(0,canvasSizeH,canvasSizeW/2,0,canvasSizeW,canvasSizeH);
        triangleCell.endDraw();
        
        
        
      finalCell.beginDraw();
        finalCell.image(canvas, 0, 0);
        finalCell.noStroke();
        finalCell.fill(255);
        finalCell.triangle(-canvasSizeW/2,0,0,canvasSizeH,canvasSizeW/2,0);
        finalCell.triangle(canvasSizeW/2,0,canvasSizeW,canvasSizeH,canvasSizeW/2+canvasSizeW,0);
        finalCell.endDraw();
      finalCell.blend(triangleCell,0,0, canvasSizeW,canvasSizeH, 0,0,canvasSizeW,canvasSizeH,DARKEST);
    }
    
    image(finalCell, canvasPosX, canvasPosY);
    
    
  }
  
  void drawPattern() {
    
    if(patternVisible) {
       patternCanvas = createGraphics(width, height);
       canvasCellCopy = finalCell;
       
       patternCanvas.beginDraw();
       for(int i=0; i < width*2/(finalCellSizeW+patternCellPaddingX);i++) {
         for(int j=0; j < height*2/(finalCellSizeH+patternCellPaddingY);j++) {
           
            patternCanvas.image(canvasCellCopy, i*(finalCellSizeW+patternCellPaddingX), j*(finalCellSizeH+patternCellPaddingY));
            
         }
       }
       patternCanvas.endDraw();
       image(patternCanvas,0,0);
     }
    
    
  }
  
  void drawBackground() {
    
        canvas.beginDraw();
          canvas.noStroke();
          canvas.fill(canvasBGColor);
          canvas.rect(0,0,canvasSizeW,canvasSizeH);
        canvas.endDraw(); 
    
  }
  
  void drawImportedImages() {
    
        //desenha e modifica as images importadas pra célula.
        canvas.beginDraw();  
        for(int i = 0; i < howManyImgs; i++) {
          canvas.pushMatrix();
          canvas.imageMode(CENTER);
          canvas.translate(imagePosX[i],imagePosY[i]);
          canvas.rotate(radians(imageRotation[i]));
          canvas.tint(255,imageOpacity[i] );
          canvas.image(images[i],0,0);
          canvas.popMatrix();
        }
        canvas.endDraw();
    
  }
  
  void update() {
    
     drawBackground();
     drawImportedImages();
    
    
  }
  
  void display() {
    
    drawOutline();
    createFinalCell();
    drawPattern(); 
  }
  
  
  
  
  
}

class Pattern {

  String patternType;
  int cellWidth, cellHeight;
  int slideX, slideY;
  int slideXTemp, slideYTemp;
  int paddingX, paddingY;
  PImage cellImage;
  int rotation;
  int cellWidthOrigin;
  int cellHeightOrigin;

  void Pattern() {

    patternType = "BLOCKS";
    cellWidth = 100;
    cellHeight = 100;
    slideX = 0;
    slideY= 0;
    paddingX = 0;
    paddingY = 0;
    rotation = 0;
  }

  void setType( String patternType_ ) {

    patternType = patternType_;
  }
  
  void importImage(String imageURL) {
     
      cellImage = loadImage(imageURL);
      cellWidthOrigin = cellImage.width;
      cellHeightOrigin = cellImage.height;
      
    
  }
  
  void resetCellSize() {
   cellWidth = cellWidthOrigin;
  cellHeight = cellHeightOrigin; 
    
  }
  
  void setRotation (int rotation_) {
    
   rotation = rotation_; 
    
  }

  void setPadding( int paddingX_, int paddingY_) {

    paddingX = paddingX_;
    paddingY = paddingY_;
  }

  void setSlide( int slideX_, int slideY_) {

    slideX = slideX_;
    slideY = slideY_;
  }

  void setCellSize( int cellWidth_, int cellHeight_) {

    cellWidth = cellWidth_;
    cellHeight = cellHeight_;
  }

  void showGrid() {
    pushStyle();
    stroke(0,255,0,50);
    if ( patternType == "BLOCKS") {

      for (int x = 0; x < (width+width/2) / cellWidth; x++) {
        line(x*cellWidth- (width/4), 0, x*cellWidth, height);
      }
      for (int y = 0; y < (height+height/2) / cellHeight; y++) {
        line(0, y*cellHeight- (height/4), width, y*cellHeight);
      }
    }
    popStyle();
  }
  
  void createDrawingArea(int drawingX_, int drawingY_, int drawingWidth_, int drawingHeight_) {
  }

  void update() {
    
    cellImage.resize(cellWidth, cellHeight);
    
  }


  void display() {
    
    //BLOCKS, BRICKS, HALF-DROP, SCALE, DIAMOND, HIVE

    if ( patternType == "BLOCKS") {

      for (int x = 0; x < (width+3*width) / cellWidth; x++) {
        for (int y = 0; y < (height+3*height) / cellHeight; y++) {
          if(y!= 0 && y % 2 != 0) {
            slideXTemp = slideX;
            slideYTemp = slideY;
          }
          else {
            slideXTemp = 0;
            slideYTemp = 0;
          }
          pushMatrix();
          translate(width/2,height/2);
          rotate(radians(rotation));
            translate((x * (cellWidth + paddingX)) + slideXTemp - 2*width, (y * (cellHeight + paddingY))+slideYTemp-2*height);
            
            image(cellImage,0,0);
          popMatrix();
        }
      }
    }
    
    
    
    
    
  }
}

void configInterface() {
  
  cp5.addSlider("cx")
     .setLabel("Canvas X")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cy")
     .setLabel("canvas Y")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cw")
     .setLabel("Canvas Width")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ch")
     .setLabel("Canvas Height")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ow")
     .setLabel("Stroke Width")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,10)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("or")
     .setLabel("Stroke Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("og")
     .setLabel("Stroke Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ob")
     .setLabel("Stroke Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("oa")
     .setLabel("Stroke Alpha")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cells")
     .setLabel("How Many Cells?")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,30)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgr")
     .setLabel("Cell Bg Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0, 255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgg")
     .setLabel("Cell Bg Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgb")
     .setLabel("Cell Bg Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bga")
     .setLabel("Cell Bg Alpha")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ix")
     .setLabel("Img X Pos")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("iy")
     .setLabel("Img Y Pos")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("iw")
     .setLabel("Img Width")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ih")
     .setLabel("Img Height")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ir")
     .setLabel("Img Rotation")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,360)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("io")
     .setLabel("Img Opacity")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("pr")
     .setLabel("Pattern Rotation")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,360)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("px")
     .setLabel("Pattern Padding X")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,20)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("py")
     .setLabel("Pattern Padding Y")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,20)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
      cp5.addSlider("psx")
     .setLabel("Pattern Slide X")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,200)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("psy")
     .setLabel("Pattern Slide Y")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,200)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     
     cp5.addSlider("sbgr")
     .setLabel("Stage Bg Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0, 255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sbgg")
     .setLabel("Stage Bg Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sbgb")
     .setLabel("Stage Bg Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sbga")
     .setLabel("Stage Bg Alpha")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     /*cp5.addSlider("strokeGreenEnd")
     .setLabel("Stroke Green Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeBlueStart")
     .setLabel("Stroke Blue Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeBlueEnd")
     .setLabel("Stroke Blue Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeAlphaStart")
     .setLabel("Stroke Alpha Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeAlphaEnd")
     .setLabel("Stroke Alpha Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
  
     cp5.addToggle("equalizer")
     .setLabel("Equalizer")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setSize(10,10)
     ;
     
     cp5.addToggle("showGrid")
     .setLabel("Show Grid")
     .setPosition(interfacePaddingX+60,interfacePaddingY)
     .setSize(10,10)
     ;
     interfacePaddingY += interfaceBetweenPaddingY+10;
     
     cp5.addSlider("equalizerPower")
     .setLabel("Equalizer Power")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,60)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("equalizerLimit")
     .setLabel("Equalizer Limit")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,300)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     */
      /*songList = cp5.addMultiList("Song List",interfacePaddingX+60,interfacePaddingY,100,12);
      b = songList.add("Songs",1);
      b.add("selectedSong", 0).setLabel("Song 1");
      b.add("selectedSong", 1).setLabel("Song 2");*/
  
}

