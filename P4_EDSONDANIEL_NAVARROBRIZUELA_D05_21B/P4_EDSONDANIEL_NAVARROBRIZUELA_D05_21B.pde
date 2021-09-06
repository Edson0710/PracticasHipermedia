void setup(){
  size(300,500);
  background(244,180,26);
  stroke(20,61,89);
  frameRate(200);
  strokeWeight(4);
}

int x = 1;
int y = 1;
int dir = 1;
boolean start = false;
void draw(){
  point(x,y);
  if(start){
    direcciones();
    margen();
  }
  
}

void direcciones(){
  if(dir == 1)x++;
  else if(dir == 2)x--;
  else if(dir == 3)y++;
  else if(dir == 4)y--;
}

void margen(){
  if(x <= 0)
    dir = 1;
  else if(x >= width)
    dir = 2;
  else if(y <= 0)
    dir = 3;
  else if(y >= height)
    dir = 4;
}

void keyPressed(){
  start = true;
  if(keyCode == UP)
    dir = 4;
  if(keyCode == DOWN)
    dir = 3;
  if(keyCode == RIGHT)
    dir = 1;
  if(keyCode == LEFT)
    dir = 2;
}
