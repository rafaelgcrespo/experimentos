void interfaceDraw() {
  
  cp5.addSlider("bgRed")
     .setLabel("Background Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgGreen")
     .setLabel("Background Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgBlue")
     .setLabel("Background Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("radius")
     .setLabel("Grid Inner Radius")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,100)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sides")
     .setLabel("Grid Polygon Sides")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,50)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("steps")
     .setLabel("Grid Size Steps")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,30)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("stepsPadding")
     .setLabel("Grid Steps Padding")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,50)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("howManyShapes")
     .setLabel("How Many Shapes?")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,100)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("shapesVertex")
     .setLabel("Total Vertex Per Shape")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(3,10)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cells")
     .setLabel("How Many Cells?")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,30)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomRedStart")
     .setLabel("Fill Red Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomRedEnd")
     .setLabel("Fill Red Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomGreenStart")
     .setLabel("Fill Green Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomGreenEnd")
     .setLabel("Fill Green Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomBlueStart")
     .setLabel("Fill Blue Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomBlueEnd")
     .setLabel("Fill Blue Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomAlphaStart")
     .setLabel("Fill Alpha Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("randomAlphaEnd")
     .setLabel("Fill Alpha Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("rotation")
     .setLabel("Rotation")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(-0.50,0.50)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeSize")
     .setLabel("Stroke Size")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,5)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeRedStart")
     .setLabel("Stroke Red Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeRedEnd")
     .setLabel("Stroke Red Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeGreenStart")
     .setLabel("Stroke Green Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeGreenEnd")
     .setLabel("Stroke Green Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeBlueStart")
     .setLabel("Stroke Blue Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeBlueEnd")
     .setLabel("Stroke Blue Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeAlphaStart")
     .setLabel("Stroke Alpha Min")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("strokeAlphaEnd")
     .setLabel("Stroke Alpha Max")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
  
     cp5.addToggle("equalizer")
     .setLabel("Equalizer")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setSize(10,10)
     ;
     
     cp5.addToggle("showGrid")
     .setLabel("Show Grid")
     .setPosition(interfacePaddingX+60,interfacePaddingY)
     .setSize(10,10)
     ;
     interfacePaddingY += interfaceBetweenPaddingY+10;
     
     cp5.addSlider("equalizerPower")
     .setLabel("Equalizer Power")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,60)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("equalizerLimit")
     .setLabel("Equalizer Limit")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,300)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
      /*songList = cp5.addMultiList("Song List",interfacePaddingX+60,interfacePaddingY,100,12);
      b = songList.add("Songs",1);
      b.add("selectedSong", 0).setLabel("Song 1");
      b.add("selectedSong", 1).setLabel("Song 2");*/
}
