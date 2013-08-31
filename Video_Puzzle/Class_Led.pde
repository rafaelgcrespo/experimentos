class Leds {
  
  int ledWidth;
  int ledHeight;
  int depth = 0;
  color ledColor;
  int locationX;
  int locationY;
  int mouseOverX;
  int mouseOverY;
  int distanceMouseClickX;
  int distanceMouseClickY;
  boolean grabbed;
  int thick = 0;
  
  
  Leds(int x,int y, int ledWidth_, int ledHeight_, int depth_) {
    
    locationX = x;
    locationY = y;
    
    grabbed = false;
    
    ledWidth = ledWidth_;
    ledHeight = ledHeight_;
    
    depth = depth_;
    
  }
  
  void update(color ledColor_) {
   
    thick = 0;
    ledColor = ledColor_;
    
    if(grabbed) {
      
      locationX = mouseX - distanceMouseClickX;
      locationY = mouseY - distanceMouseClickY;
      
    }
    
  }
  void display() {
    
      stroke(255);
      strokeWeight(thick);
      fill(ledColor);
      rect(locationX, locationY, ledWidth, ledHeight);
    
  }
  
  int getDepth() {
    
      return depth;
    
  }
  
  void mouseOver() {
    
    if(mouseX >= locationX && mouseX < locationX + ledWidth) {
      if(mouseY >= locationY && mouseY < locationY + ledHeight) {
        
        
       thick = 1;
        
      }
    }
    
  }
  
  boolean detect(int detectMouseX, int detectMouseY) {
    
    distanceMouseClickX = detectMouseX - locationX;
    distanceMouseClickY = detectMouseY - locationY;
    

   if(detectMouseX >= locationX && detectMouseX < locationX + ledWidth) {
      if(detectMouseY >= locationY && detectMouseY < locationY + ledHeight) {
        
      return true;
      
      }
      
      else {
        
        return false;
        
      }
      
   }
   
   
   else {
     
     return false;
     
   }
    
  }
  
  void grab() {
    
    grabbed = true;
    
  }
  
  
  void release() {
      
      grabbed = false;
      
  }
  
  void shuffleLocation() {
    
    int shuffleX = xPuzzle + 1;
    int shuffleY = yPuzzle + 1;
    
    if(!grabbed) {
      
      while (shuffleX > xPuzzle - ledWidth && shuffleX < xPuzzle + widthPuzzle && shuffleY > yPuzzle - ledHeight && shuffleY < yPuzzle + heightPuzzle) {
        
        shuffleX = int(random(width));
        shuffleY = int(random(height));
        
      }
      
      locationX = shuffleX;
      locationY = shuffleY;
      
    }
    
  }
  
  
}
