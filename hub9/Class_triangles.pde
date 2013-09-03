class triangleObjects {
  
  PShape triangleShape;
  
 triangleObjects(PVector vertex1, PVector vertex2, PVector vertex3) {
  
   
  triangleShape = createShape();
  triangleShape.beginShape();
  //triangleShape.fill(0,50,int(random(200)));
  triangleShape.fill(random(255),20,50,100);
  triangleShape.stroke(255,8);
    triangleShape.strokeWeight(0);
  triangleShape.vertex(vertex1.x, vertex1.y);
   triangleShape.vertex(vertex2.x, vertex2.y);
    triangleShape.vertex(vertex3.x, vertex3.y);
     triangleShape.endShape();
     shape(triangleShape);
  
 } 
  
  
  
}
