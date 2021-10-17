color fondo = color(144, 187, 12), pixel = color(52, 65, 53);
int dir = 1, x = 100, y = 120, fps = 12, xA=1000, yA=1000, iteraciones = 0, iteraciones1= 0;
int segundos=5, segundos1 = 1, score = 0, errors = 0, time = 60, tam = 10;
boolean start = false, conteo = false, isEaten = true, game =true;
ArrayList<Puntos> puntos = new ArrayList<Puntos>(); 
PImage foto; 

void setup(){
  background(fondo);
  size(700, 500);
  frameRate(fps);
  foto = loadImage("/marco.png"); 
  construirEscenario();
  stroke(pixel);
  point(x,y);
}

void draw(){
  if(start && game){
    println(puntos.size());
    construirEscenario();
    dibujarSnake();
    tiempo();
  }
  //println(frameCount);
}  

void construirEscenario(){
  background(fondo);
  fill(pixel);
  textSize(32);
  text("Score: " + score +"          Errors: " + errors + "          Time: " + time , 95, 75);
  stroke(pixel);
  strokeWeight(10);
  fill(fondo);
  rect(90, 110, 530, 340);
  line(90, 90, width-80,90);
  if(isEaten && start){
    crearApple();
    dibujarManzana();
    isEaten = false;
  } 
  else{
    dibujarManzana();
  }
  image(foto, 0,0,width,height); 
  
}

void dibujarSnake(){
  puntos.add(new Puntos(x,y));
  bordes();
  direcciones();
  stroke(pixel);
  strokeWeight(10);
  if(puntos.size() > tam)
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
  if(x <= 90)
    dir = 1;
  else if(x >= width-80)
    dir = 2;
  else if(y <= 110)
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
    xA = (int)random(10, 61) * 10;
    yA = (int)random(12, 44) * 10;
    
    for(int k = 0; k < puntos.size()-1; k++){
      if(xA == puntos.get(k).x && yA == puntos.get(k).y){
        aceptado = true;
        //println("Se creo dentro del cuerpo");
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
    score++;
    tam++;
  }
}

void chocarCuerpo(){
  Puntos punto = puntos.get(puntos.size()-1);
  for(int k = 0; k < puntos.size()-1; k++){
    if(punto.x == puntos.get(k).x && punto.y == puntos.get(k).y){
      //println("Choque contra si mismo");
      //fill(pixel);
      //textSize(32);
      //text("GAME OVER", 280, 300);
      error();
    }
  }
}

void error(){
  start = false;
  errors++;
  construirEscenario();
  stroke(pixel);
  puntos.clear();
  x=350;
  y=270;
  point(x,y);
}

void construirGameOver(){
  game = false;
  background(fondo);
  fill(pixel);
  textSize(54);
  text("GAME OVER", 220, 150);
  textSize(32);
  text("Score: " + score, 300, 250);
  text("Errors: " + errors, 300, 300);
  image(foto, 0,0,width,height); 
  
}

void tiempo(){
  
  if(iteraciones1 < (fps*segundos1)){
    iteraciones1++;
  }
  else{
    time--;
    iteraciones1=0;
  }
  if(iteraciones < (fps*segundos)){
    iteraciones++;
  }
  else{
    println("aument");
    iteraciones = 0;
    tam++;
    puntos.add(new Puntos(x,y));  
    bordes();
    direcciones();
    
  }
  if(time == 0) construirGameOver();
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
  
  
