void interfaceDraw() {
  
  cp5.addSlider("bgRed")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgGreen")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgBlue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("radius")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,100)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sides")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,50)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("steps")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,100)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("stepsPadding")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,100)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("triangles")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,1000)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cells")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,30)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("showGrid")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,1)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
  
  
}