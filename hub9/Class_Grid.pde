class Grid {
  
  PVector[] vertexLocation;
  PVector[] vertexLocationSelected;
  ShapesObjects[] shapesObj;
  int count = 0;
  int centerX;
  int centerY;
  int shapesNumber;
  int sidesGlobal;
  int radiusGlobal;
  int radiusGlobal_;
  int sizesGlobal;
  int sizeVariationsGlobal;
  int shapeSides;
  
  
  
 Grid(int centerX_, int centerY_, int radius_,  int sides_, int sizes_, int sizeVariations_) {
  
   centerX = centerX_;
   centerY = centerY_;
   sidesGlobal = sides_;
   radiusGlobal = radius_;
   sizesGlobal = sizes_;
   sizeVariationsGlobal = sizeVariations_;

  vertexLocation = new PVector[sizes_ * sides_];
  fill(0,0);
  stroke(0,0);
  //ellipse(centerX, centerY, 2, 2);
  
  for(int i = 0; i < sizes_; i++) {
    
   for(int j = 0; j < sides_; j++) {
    
      vertexLocation[count] = new PVector(int(cos(radians(j*(360/sides_)))*radius_), int(sin(radians(j*(360/sides_)))*radius_));

      count++;
      
   } 
   
   radius_ += sizeVariations_;
    
  }
  
 } 
 
 void createShapes(int shapesNumber_, int shapeSides_) {
   
   shapesNumber = shapesNumber_;
   shapeSides = shapeSides_;
   shapesObj = new ShapesObjects[shapesNumber];
   vertexLocationSelected = new PVector[shapeSides_];
   vertexLocationSelected[0] = new PVector(0,0);
   
   for(int i=0; i < shapesNumber; i++) {
     
     for(int j=1; j < shapeSides_; j++) {
       
       vertexLocationSelected[j] = vertexLocation[int(random(count))].get();
     }
     
     shapesObj[i] = new ShapesObjects(vertexLocationSelected);
     
   }
   
   
   
 }
 
 void changeShapes() {
   
   vertexLocationSelected[0] = new PVector(0,0);
   
   for(int i=0; i < shapesNumber; i++) {
     
     for(int j=1; j < shapeSides; j++) {
       
       vertexLocationSelected[j] = vertexLocation[int(random(count))].get();
     }
     
     shapesObj[i].change(vertexLocationSelected);
     
   }
   
   
   
 }
   
   
  void showGrid(boolean gridVisible) {
   
  
   if(gridVisible) {
   
     count = 0;
     radiusGlobal_ = radiusGlobal;
     
     for(int i = 0; i < sizesGlobal; i++) {
    
       for(int j = 0; j < sidesGlobal; j++) {
      
          fill(0);
          stroke(255,180);
          strokeWeight(1);
          
            if( j == sidesGlobal - 1) {
              line(vertexLocation[count].x + centerX, vertexLocation[count].y + centerY,vertexLocation[count-sidesGlobal+1].x + centerX, vertexLocation[count-sidesGlobal+1].y + centerY);
            }
            
            else {
              line(vertexLocation[count].x + centerX, vertexLocation[count].y + centerY,vertexLocation[count+1].x + centerX, vertexLocation[count+1].y + centerY);
            }
            
          ellipse(vertexLocation[count].x + centerX, vertexLocation[count].y + centerY, 2, 2);
          
          count++;
      
       } 
    
    }
    
   }
   
   
 }
 
  void display() {
   
  
   for(int i=0; i < shapesNumber; i ++) {
     
     shapesObj[i].display(centerX, centerY);
     
   }
   
   
 }
 
 void update() {
   
  
   for(int i=0; i < shapesNumber; i ++) {
     
     shapesObj[i].update();
     
     if (equalizer==1) {
     shapesObj[i].equalize();
     }
     
   }
   
   
 }
  
  
}
