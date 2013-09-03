class Grid {
  
  PVector[] location;
  PVector location1;
  PVector location2;
  PVector location3;
  triangleObjects[] triangleObj;
  int count = 0;
  int centerX;
  int centerY;
  
  
 Grid(int centerX_, int centerY_, int radius_,  int sides_, int sizes_, int sizeVariations_) {
  
   centerX = centerX_;
   centerY = centerY_;
   
   location1 = new PVector(centerX, centerY);
   
  location = new PVector[sizes_ * sides_];
  fill(0,10);
  stroke(0,10);
  ellipse(centerX, centerY, 2, 2);
  
  for(int i = 0; i < sizes_; i++) {
    
   for(int j = 0; j < sides_; j++) {
    
      location[count] = new PVector(int(cos(radians(j*360/sides_))*radius_ + centerX), int(sin(radians(j*360/sides_))*radius_ + centerY));
      ellipse(location[count].x, location[count].y, 2, 2);
      count++;
      
   } 
   
   radius_ += sizeVariations_;
    
  }
  
 } 
 
 void createTriangles(int howManyTriangles) {
   
   triangleObj = new triangleObjects[howManyTriangles];
   
   for(int i=0; i < howManyTriangles; i ++) {

     location2 = location[int(random(count))].get();
     location3 = location[int(random(count))].get();
     
     triangleObj[i] = new triangleObjects(location1, location2, location3);
     
   }
   
 }
 
 void update() {
   
 }
 
 void display() {
   
   
 }
 
 void changeTriangles() {
   
 }
   
   
  
  
  
}
