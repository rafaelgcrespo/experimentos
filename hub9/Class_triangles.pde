class ShapesObjects {
  
  PShape shape;
  PVector distanceToCenter;
  PVector[] vertexStoreArray_;
  int vertexId;
  
 ShapesObjects(PVector[] vertexArray_) {
   vertexStoreArray_ = new PVector[vertexArray_.length];
   arrayCopy(vertexArray_, vertexStoreArray_);
   
   fill(random(randomRedStart,randomRedEnd),random(randomGreenStart,randomGreenEnd),random(randomBlueStart,randomBlueEnd),random(randomAlphaStart,randomAlphaEnd));
   stroke(255,8);
   strokeWeight(0);
   
   shape = createShape();
   shape.beginShape();
   
   
   
   for(int a =0; a < vertexArray_.length; a++) {
     
     shape.vertex(vertexArray_[a].x, vertexArray_[a].y );
     vertexId = vertexGlobalId;
     vertexGlobalId ++;
     if(vertexGlobalId >=50) {
       vertexGlobalId = 0;
     }
     
   }
   shape.endShape();
  
 } 
 
 void update() {
   
   
 }
 
 void equalize() {
   
   for(int i =1; i < shape.getVertexCount(); i++) {
     
     
     PVector distanceToCenter = PVector.sub(shape.getVertex(i), shape.getVertex(0));
     distanceToCenter.normalize();
     int average = constrain(int(fftLin.getAvg(vertexId)*20),0,50+int(fftLin.getAvg(1)));
     distanceToCenter.mult(average);
     PVector newVertex = PVector.add( vertexStoreArray_[i] ,distanceToCenter);
     shape.setVertex(i, newVertex);
     newVertex.mult(0);
   }
   
 }
 
 void change(PVector[] newVertexArray) {
   
   for(int i =0; i < shape.getVertexCount(); i++) {
     shape.setVertex(i, newVertexArray[i]);
     vertexStoreArray_[i] = newVertexArray[i];
   }
   
 }
 
 void display(int indexX, int indexY) {
   
   
  shape(shape,indexX, indexY);
   shape.rotate(rotation);
   
 }
  
  
  
}
