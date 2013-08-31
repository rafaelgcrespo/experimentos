// Video Puzzle - By Rafael Crespo rafaelgcrespo@gmail.com
// Transforms a Movie in a puzzle..
// Press "s" to shuffle 5 puzzle blocks;

import processing.video.*;

Movie movie;
Puzzle puzzle;

 int movieFileWidth = 640;
 int movieFileHeight = 360;
 
 int widthPuzzle = 700;
 int heightPuzzle = 450; 
 
 int xPuzzle;
 int yPuzzle;
 
 int puzzleLinesY = 15;
 int puzzleColumnsX = 15;
 

void setup() {
 
 size(1024, 768);
 
 //centers the Puzzle on screen
 int xPuzzle = width/2-widthPuzzle/2;
 int yPuzzle = height/2-heightPuzzle/2;

 movie = new Movie(this, "movie.mov");

 puzzle = new Puzzle(movie, xPuzzle, yPuzzle, movieFileWidth, movieFileHeight, widthPuzzle, heightPuzzle);
 
 puzzle.createLeds(puzzleLinesY, puzzleColumnsX);
 
}

void draw() {
  
  background(255);
  
    puzzle.update();
    puzzle.mouseOver(); // enables a white outline on mouseOver
    puzzle.display();
 
} 

void mousePressed() {
  
  int ledClicked;
  
  if(puzzle.available() == true) {
    
    ledClicked = puzzle.getLedClicked(mouseX,mouseY);
    puzzle.grabLed(ledClicked);
    
  }
  
  
}

void mouseReleased() {
  
  if(puzzle.available() == true) {

    puzzle.releaseLed();
  
  }

}

void keyPressed() {
  
  if(key=='s') {
    
    // When press S, shuffles 5 puzzle blocks
    
    puzzle.shuffleLeds(5);
    
  }
  
}

  
  

