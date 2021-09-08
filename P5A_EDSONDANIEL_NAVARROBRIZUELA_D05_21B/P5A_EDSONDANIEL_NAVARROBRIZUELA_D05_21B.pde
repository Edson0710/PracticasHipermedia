void setup(){
  size(200,300);
  background(64,210,15);
  stroke(20,61,89);
  frameRate(150);
  strokeWeight(6);
  point(1,1);
}

int x = 1;
int y = 1;
int dir = 1;
boolean start = false;
ArrayList<Puntos> puntos = new ArrayList<Puntos>(); 

void draw(){
  if(start){
    puntos.add(new Puntos(x,y));
    if(puntos.size() > 10){
      puntos.remove(0);
    }
    background(64,210,15);
    for(int k = 0; k < puntos.size(); k++){
      puntos.get(k).dibujar();
    }
    
    direcciones();
    margen();
    //println(puntos.size());
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

class Puntos{
  int x, y;
  Puntos(int x, int y){
    this.x = x;
    this.y = y;
  }
  void dibujar(){
    point(x, y);
  }
}
