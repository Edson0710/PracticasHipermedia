PImage cancha, pelota;
float x=-200, y=pow(x,2);

void setup(){
  size(800,600);
  frameRate(100);
  cancha = loadImage("cancha.jpg");
  cancha.resize(800,600);
  pelota = loadImage("pelota.png");
  pelota.resize(50,50);
  image(cancha, 0, 0);
}

void draw(){
  image(cancha, 0, 0);
  image(pelota, x+200, y);
  movimiento();
  detener();
}

void mousePressed(){
  noLoop();
}

void mouseReleased(){
  loop();
}

void movimiento(){
  x = x + 2;
  y = pow(x,2)/250;
}

void detener(){
  println(y);
  if(y >= height-50) noLoop();
}
