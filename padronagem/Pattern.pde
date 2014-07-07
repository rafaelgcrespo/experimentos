
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

