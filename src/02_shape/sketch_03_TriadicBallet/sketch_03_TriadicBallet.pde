// P_2_0_03.pde


boolean recordPDF = false;

color strokeColor = color(0, 10);
float hue = random(0, 360);
int resolution = 100;


void setup(){
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noFill();
  background(360);
}

void draw(){
  changeColor();
  pushMatrix();
   translate(width/2,height/2);
    
    //int circleResolution = (int)map(mouseX+100,0,height,2,100);
    int circleResolution = (int)resolution;
    int radius = (mouseX+mouseY)/2-width/2;
    float angle = TWO_PI/circleResolution;
    strokeWeight(2);
    stroke(strokeColor);

    popMatrix();
    
    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = mouseX + cos(angle*i) * radius;
      float y = mouseY + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
}

void changeColor() {
  int rand = (int)random(3);
  switch(rand){
  case 0:
    strokeColor = color(hue, 100, 10, 10);
    break;
  case 1:
    strokeColor = color(hue, 100, 50, 10);
    break;
  case 2:
    strokeColor = color(hue, 100, 100, 10);
    break;
  }
}
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) {
    hue = random(0, 360);
    resolution = (int)random(2, 10);
    background(360);
  }
}