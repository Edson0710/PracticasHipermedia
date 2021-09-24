color fondo = color(144, 187, 12), pixel = color(52, 65, 53);
int dir = 1, x = 60, y = 110, fps = 15, xA=1000, yA=1000;
boolean start = false, conteo = false, isEaten = true;
ArrayList<Puntos> puntos = new ArrayList<Puntos>(); 

void setup(){
  background(fondo);
  size(600, 500);
  frameRate(fps);
  construirEscenario();
}

void draw(){
  if(start){
    construirEscenario();
    dibujarSnake();
  }
  //println(frameCount);
}  

void construirEscenario(){
  stroke(pixel);
  strokeWeight(10);
  fill(fondo);
  rect(50, 100, 500, 350);
  if(isEaten && start){
    crearApple();
    dibujarManzana();
    isEaten = false;
  } 
  else{
    dibujarManzana();
  }
}

void dibujarSnake(){
  puntos.add(new Puntos(x,y));  
  bordes();
  direcciones();
  stroke(pixel);
  strokeWeight(10);
  //if(puntos.size() == 501)
    //noLoop(); 
  if(puntos.size() > 1400)
    puntos.remove(0);
  for(int k = 0; k < puntos.size(); k++){
     puntos.get(k).dibujar();
  }
  comerManzana();
  chocarCuerpo();
}


void direcciones(){
  if(dir == 1)x+=10;
  else if(dir == 2)x-=10;
  else if(dir == 3)y+=10;
  else if(dir == 4)y-=10;
}

void bordes(){
  if(x <= 50)
    dir = 1;
  else if(x >= width-50)
    dir = 2;
  else if(y <= 100)
    dir = 3;
  else if(y >= height-50)
    dir = 4;
}

void keyPressed(){
  start = true;
  if(!conteo && start){
    frameCount = 0;
    conteo = true;
  }
  if(keyCode == UP && dir != 3)
    dir = 4; 
  if(keyCode == DOWN && dir != 4)
    dir = 3;
  if(keyCode == RIGHT && dir != 2)
    dir = 1;
  if(keyCode == LEFT && dir != 1)
    dir = 2;
  if(key == 'p'){
    if(looping)
      noLoop();
    else
      loop();
  }
}

void crearApple(){
  boolean aceptado;
  do{
    aceptado = false;
    println("Flag");
    xA = (int)random(6, 54) * 10;
    yA = (int)random(11, 44) * 10;
    for(int k = 0; k < puntos.size()-1; k++){
      if(xA == puntos.get(k).x && yA == puntos.get(k).y){
        aceptado = true;
        println("Se creo dentro del cuerpo");
        break;
      }
    }
  }while(aceptado);
}

void dibujarManzana(){
  stroke(255,0,0);
  point(xA, yA);
}

void comerManzana(){
  Puntos punto = puntos.get(puntos.size()-1);
  if(xA == punto.x && yA == punto.y){
    println("Comio");
    isEaten = true;
    puntos.add(new Puntos(x,y));
    direcciones();
    bordes();
  }
}

void chocarCuerpo(){
  Puntos punto = puntos.get(puntos.size()-1);
  for(int k = 0; k < puntos.size()-1; k++){
    if(punto.x == puntos.get(k).x && punto.y == puntos.get(k).y)
      println("Choque contra si mismo");
  }
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
  
  
