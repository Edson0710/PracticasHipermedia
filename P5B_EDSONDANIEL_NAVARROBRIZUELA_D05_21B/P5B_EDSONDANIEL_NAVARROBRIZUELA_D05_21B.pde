void setup(){
  size(300,300);
  background(64,210,15);
  stroke(20,61,89);
  frameRate(8);
  strokeWeight(10);
  point(10,10);
}

long time = 0, time_update = 0, time_wait = 5000, time_start = 0;
int x = 10, y = 10, dir = 5;
boolean start = false;
ArrayList<Puntos> puntos = new ArrayList<Puntos>(); 

void draw(){
  if(start){
    tiempo();
    movimiento();
    trazarSnake(); 
    //println(puntos.size());
  }
}

void movimiento(){
  puntos.add(new Puntos(x,y));   
  direcciones();
  margen();
}

void tiempo(){
  time = millis() - time_start;
  if(time >= (time_update + time_wait)){
    //println(time);
    time_update = time;
    movimiento();
  }
}

void trazarSnake(){
  if(puntos.size() > 10){
    puntos.remove(0);
  }
  background(64,210,15);
  for(int k = 0; k < puntos.size(); k++){
    puntos.get(k).dibujar();
  }
}

void direcciones(){
  if(dir == 1)x+=10;
  else if(dir == 2)x-=10;
  else if(dir == 3)y+=10;
  else if(dir == 4)y-=10;
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
  if(time_start == 0){
    time_start = millis();
  }
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
  //color point_rgb;
  Puntos(int x, int y){
    this.x = x;
    this.y = y;
    //this.point_rgb = color(random(255),random(255),random(255));
  }
  void dibujar(){
    //stroke(point_rgb);
    point(x, y);
  }
}
