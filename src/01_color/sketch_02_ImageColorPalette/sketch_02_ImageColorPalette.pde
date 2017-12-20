/// Color Palette from An Image
/// 2017.12.14.
/// Takafumi Oyama
/// WIP

import generativedesign.*;
import java.util.Calendar;

PImage img;
color[] colors;
String sortMode = null;

void setup(){
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  //noCursor();
  img = loadImage("lena.jpg");
  image(img, 0, 0);
  
}

void draw(){
  background(0);
  int tileCount = width / max(10, 3);
  float rectSize = width / float(tileCount);

  // get colors from image
  int i = 0; 
  colors = new color[tileCount*tileCount];
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      int px = (int) (gridX * rectSize);
      int py = (int) (gridY * rectSize);
      colors[i] = img.get(px, py);
      i++;
    }
  }
  
  // sort colors
  if (sortMode != null) colors = GenerativeDesign.sortColors(this, colors, sortMode);
  
  // draw grid
  i = 0;
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {
      fill(colors[i]);
      float x = gridX*rectSize+rectSize/2;
      float y = gridY*rectSize+rectSize/2;
      int rand = int(random(2));
      
      rectSize += sq((mouseX - x) + (mouseY - y))*0.000000005;
      if (x > mouseX && y > mouseY) {
        rect(x+rectSize, y+rectSize, 10, 10);
      } else if (x > mouseX && y < mouseY) {
        rect(x+rectSize, y+rectSize, 10, 10);
      } else if (x < mouseX && y > mouseY) {
        rect(x+rectSize, y+rectSize, 10, 10);
      } else {
        rect(x+rectSize, y+rectSize, 10, 10);
      }
      
      //rect(x+rectSize, y+rectSize, 10, 10);
      i++;
    }
  }
  
}


void keyReleased(){
  if (key=='c' || key=='C') GenerativeDesign.saveASE(this, colors, timestamp()+".ase");

  if (key == '1') img = loadImage("lena.jpg");

  if (key == '2') sortMode = null;
  if (key == '3') sortMode = GenerativeDesign.HUE;
  if (key == '4') sortMode = GenerativeDesign.SATURATION;
  if (key == '5') sortMode = GenerativeDesign.BRIGHTNESS;
  if (key == '6') sortMode = GenerativeDesign.GRAYSCALE;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}