
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
   if(canvasOutlineWeight>0){
   canvas.beginDraw();
       canvas.strokeWeight(canvasOutlineWeight);
       canvas.stroke(canvasOutlineColor);
       canvas.noFill();
       canvas.rect( 0,0  , canvasSizeW, canvasSizeH);
     canvas.endDraw(); 
   }
  }
  
  void createFinalCell() {
    noStroke();
    generateFinalCell();
    
    if(cellType=="BLOCKS") {
      finalCell.beginDraw();
      finalCell.noStroke();
      finalCell.image(canvas, 0, 0);
      finalCell.endDraw();
      
    }
    
    if(cellType=="HALFDROP") {
      finalCell.beginDraw();
      finalCell.noStroke();
      finalCell.image(canvas, 0, 0);
      finalCell.image(canvas, canvasSizeW+patternCellPaddingX, -((canvasSizeH+patternCellPaddingY)/2)+patternSlideY);
      finalCell.image(canvas, canvasSizeW+patternCellPaddingX,  ((canvasSizeH+patternCellPaddingY)/2)+patternSlideY);
      finalCell.endDraw();
    }
    
    if(cellType=="BRICKS") {
      finalCell.beginDraw();
      finalCell.noStroke();
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
