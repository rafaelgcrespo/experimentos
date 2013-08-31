class Puzzle {
  
 Movie m;
 int mWidth;
 int mHeight;
 int mFileWidth;
 int mFileHeight;
 int puzzleLines;
 int puzzleColumns;
 color movieColors[];
 Leds leds[];
 Leds ledTemp;
 int blockWidth;
 int blockHeight;
 int count;
 PVector location;
 int ledNumber;
 int puzzleX;
 int puzzleY;
 
 boolean ledsCreated = false;
 boolean ledDetected = false;
 int detectedLedID = -1;
 int grabbedLed;
  
 Puzzle(Movie movie_ , int puzzleX_, int puzzleY_, int mFileWidth_, int mFileHeight_, int mWidth_, int mHeight_ ) {
   
   m = movie_;
   m.loop();
   
   puzzleX = puzzleX_;
   puzzleY = puzzleY_;
   
   mWidth = mWidth_;
   mHeight = mHeight_;
   mFileWidth = mFileWidth_;
   mFileHeight = mFileHeight_;

 } 
 
 void createLeds(int puzzleLines_, int puzzleColumns_) {
   
   puzzleLines = puzzleLines_;
   puzzleColumns = puzzleColumns_;
   
   movieColors = new color[puzzleColumns * puzzleLines];
   
   leds = new Leds[movieColors.length];
   
   blockWidth = mWidth / puzzleColumns;
   blockHeight = mHeight / puzzleLines;
   
   for(int line = 0; line < puzzleLines; line++) {
       for(int column = 0; column < puzzleColumns; column++) {
       
         leds[line * puzzleColumns + column] = new Leds(column*blockWidth + puzzleX, line*blockHeight + puzzleY, blockWidth, blockHeight, line * puzzleColumns + column );
       
       }
   }
   
 }
 
 void update() {
   
   if(m.available() == true) {
     
     m.read();
     m.loadPixels();
     
     count = 0;
   
     for(int line = 0; line < puzzleLines; line++) {
       for(int column = 0; column < puzzleColumns; column++) {
       
         movieColors[count] = m.get(int(map(column*blockWidth, 0, mWidth, 0, mFileWidth)), int(map(line*blockHeight, 0, mHeight, 0, mFileHeight)));
         count++;
       
       }
     }
     
     for(int line = 0; line < puzzleLines; line++) {
       for(int column = 0; column < puzzleColumns; column++) {
         ledNumber = line * puzzleColumns + column;
         leds[ledNumber].update(movieColors[leds[ledNumber].getDepth()]);
       }
       
     }
     
     }
   
 }

 
 void display() {
   
     for(int line = 0; line < puzzleLines; line++) {
       for(int column = 0; column < puzzleColumns; column++) {
         ledNumber = line * puzzleColumns + column;
         leds[ledNumber].display();
       }
     }
     
     ledsCreated = true;
   
}  
   
 void mouseOver() {
   
     for(int line = 0; line < puzzleLines; line++) {
       for(int column = 0; column < puzzleColumns; column++) {
         ledNumber = line * puzzleColumns + column;
         leds[ledNumber].mouseOver();
       }
     }
 }
 
 
 boolean available() {
   
     if(ledsCreated) {
       return true;
    } 
  
    else {
       return false;
    }
   
 }
 
 void highestDepth(int currentDepth) {
   
   ledTemp = leds[currentDepth];
   
   for(int i = currentDepth; i < leds.length-1; i++) {
     
   leds[i] = leds[i+1];
   
  }
  
  leds[leds.length-1] = ledTemp;
  
 }
 
  void grabLed(int grabbedLed_) {
    
    grabbedLed = grabbedLed_;
    highestDepth(grabbedLed);
    grabbedLed = leds.length - 1;
    leds[grabbedLed].grab(); 
 }
 
int getLedClicked(int detectMouseX_, int detectMouseY_) {
    
    for(int line = 0; line < puzzleLines; line++) {
       for(int column = 0; column < puzzleColumns; column++) {
         
         ledNumber = line * puzzleColumns + column;
         ledDetected = leds[ledNumber].detect(detectMouseX_, detectMouseY_);
         
         if(ledDetected) {
           detectedLedID = ledNumber;
         }
         
       }
     }
     
     return detectedLedID;
 }
 
  void releaseLed() {
    
         leds[grabbedLed].release();
 }
 
 void shuffleLeds(int shuffleNumber) {
   
   for(int i = 0; i < shuffleNumber; i++) {
     
     leds[int(random(leds.length))].shuffleLocation();
     
   }
   
 }
  
 
 
}

