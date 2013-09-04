class triangleObjects {
  
  PShape triangleShape;
  
 triangleObjects(PVector vertex1, PVector vertex2, PVector vertex3) {
  
   //fill(random(255),20,50,100);
   fill(random(randomRedStart,randomRedEnd),random(randomGreenStart,randomGreenEnd),random(randomBlueStart,randomBlueEnd),random(randomAlphaStart,randomAlphaEnd));
   stroke(255,8);
   strokeWeight(0);
   
  triangleShape = createShape();
  triangleShape.beginShape();
  triangleShape.vertex(vertex1.x, vertex1.y);
  triangleShape.vertex(vertex2.x, vertex2.y);
  triangleShape.vertex(vertex3.x, vertex3.y);
  triangleShape.endShape();
  shape(triangleShape);
  
 } 
  
  
  
}
