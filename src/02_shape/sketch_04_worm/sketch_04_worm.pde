// 04_worm.pde

int tileCount = 20;
int actRandomSeed = 0;
int actStrokeCap = ROUND;


void setup() {
  size(600, 600);
}


void draw() {

  background(255);
  smooth();
  noFill();
  strokeCap(actStrokeCap);
  
  if (second() % 3 == 0) {
    changePattern();
  }
  randomSeed(actRandomSeed);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;
      
      float ratioX = (float) mouseX/width;
      float ratioY = (float) mouseY/height;
      
      int toggle = (int) random(0,2);
      
      if (toggle == 0) {
        strokeWeight(mouseX/100);
        stroke(mouseX/3,mouseY/3,100);
        line(posX, posY, posX+width/tileCount*ratioX, posY+height/tileCount*ratioY);
      }
      if (toggle == 1) { 
        strokeWeight(mouseY/100);
        line(posX, posY+width/tileCount*ratioX, posX+height/tileCount*ratioY, posY);
      }
    }
  }
}

void changePattern() {
  actRandomSeed = (int) random(100000);
}