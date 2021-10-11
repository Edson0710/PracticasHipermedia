PImage cancha, pelota;
int x_centro=20, y_centro=20, dir_x=1, dir_y = 1, diametro = 40, radio = diametro/2;

void setup(){
  size(800,600);
  frameRate(120);
  cancha = loadImage("cancha.jpg");
  cancha.resize(800,600);
  pelota = loadImage("pelota.png");
  pelota.resize(50,50);
  image(cancha, 0, 0);
}

void draw(){
  background(145,16,54);
  image(cancha, 0, 0);
  image(pelota, x_centro+dir_x, y_centro+=dir_y);
  if(x_centro + dir_x < 0 || x_centro + dir_x > width) dir_x+=1;
  if(y_centro + dir_y < 0 || y_centro + dir_y > width) dir_y+=1;
  
  //fill(1,145,18);
  //ellipse(x_centro+=dir_x, y_centro+=dir_y, diametro, diametro);
  rebotes();
}
void mouseClicked(){
  dir_x = (random(2) < 1) ? -1 : 1;
  dir_y = (random(2) < 1) ? -1 : 1;
}

void rebotes(){
  if(y_centro >= height)dir_y = -1;
  if(x_centro >= width)dir_x = -1;
  if(y_centro <= 0)dir_y = 1;
  if(x_centro <= 0)dir_x = 1;
}
