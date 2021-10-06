void setup(){
  size(600,480);
  frameRate(120);
}
int x_centro=20, y_centro=20, dir_x=1, dir_y = 1, diametro = 40, radio = diametro/2;
void draw(){
  background(145,16,54);
  if(x_centro + dir_x < 0 + radio || x_centro + dir_x > width - radio) dir_x+=1;
  if(y_centro + dir_y < 0 + radio || y_centro + dir_y > width - radio) dir_y+=1;
  fill(1,145,18);
  ellipse(x_centro+=dir_x, y_centro+=dir_y, diametro, diametro);
  if(y_centro+radio >= height)dir_y = -1;
  if(x_centro+radio >= width)dir_x = -1;
  if(y_centro-radio <= 0)dir_y = 1;
  if(x_centro-radio <= 0)dir_x = 1;
}
void mouseClicked(){
  dir_x = (random(2) < 1) ? -1 : 1;
  dir_y = (random(2) < 1) ? -1 : 1;
}
