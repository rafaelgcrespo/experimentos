void configInterface() {
  
  cp5.addSlider("cx")
     .setLabel("Canvas X")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cy")
     .setLabel("canvas Y")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cw")
     .setLabel("Canvas Width")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ch")
     .setLabel("Canvas Height")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ow")
     .setLabel("Stroke Width")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,10)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("or")
     .setLabel("Stroke Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("og")
     .setLabel("Stroke Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ob")
     .setLabel("Stroke Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("oa")
     .setLabel("Stroke Alpha")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("cells")
     .setLabel("How Many Cells?")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,30)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgr")
     .setLabel("Cell Bg Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0, 255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgg")
     .setLabel("Cell Bg Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bgb")
     .setLabel("Cell Bg Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("bga")
     .setLabel("Cell Bg Alpha")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ix")
     .setLabel("Img X Pos")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("iy")
     .setLabel("Img Y Pos")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("iw")
     .setLabel("Img Width")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,width)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ih")
     .setLabel("Img Height")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,height)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("ir")
     .setLabel("Img Rotation")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,360)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("io")
     .setLabel("Img Opacity")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("pr")
     .setLabel("Pattern Rotation")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,360)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("px")
     .setLabel("Pattern Padding X")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,20)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("py")
     .setLabel("Pattern Padding Y")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,20)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
      cp5.addSlider("psx")
     .setLabel("Pattern Slide X")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,200)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("psy")
     .setLabel("Pattern Slide Y")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,200)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     
     cp5.addSlider("sbgr")
     .setLabel("Stage Bg Red")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0, 255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sbgg")
     .setLabel("Stage Bg Green")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sbgb")
     .setLabel("Stage Bg Blue")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     
     cp5.addSlider("sbga")
     .setLabel("Stage Bg Alpha")
     .setPosition(interfacePaddingX,interfacePaddingY)
     .setRange(0,255)
     ;
     interfacePaddingY += interfaceBetweenPaddingY;
     /*cp5.addSlider("strokeGreenEnd")
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
     */
      /*songList = cp5.addMultiList("Song List",interfacePaddingX+60,interfacePaddingY,100,12);
      b = songList.add("Songs",1);
      b.add("selectedSong", 0).setLabel("Song 1");
      b.add("selectedSong", 1).setLabel("Song 2");*/
  
}
