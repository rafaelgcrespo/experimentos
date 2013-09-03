//random cell
//by Rafael Guimarães Crespo
//rafealgcrespo@gmail.com


Grid[] grid;

int sides = 9;

int radius = 20;

int sizes =  4;

int sizeVariation =  20;

int triangles = 20;

color triangle1 = color (255,0,0);
color triangle2 = color (100,0,0);
color triangle3 = color (200,0,50);
int a = 100;



void setup() {
  
  size(640,480, P2D);
  background(255);
  smooth();
  grid = new Grid[4];
  for(int i=0;i<4;i++) {
  grid[i] = new Grid(a, height/2, radius, sides, sizes, sizeVariation);
  grid[i].createTriangles(triangles); 
  a+=150;
  }
  
}


void draw() {
  
  
}

void mouseReleased() {
  
 
  
}
