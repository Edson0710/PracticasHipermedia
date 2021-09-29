int value = 0,x1=25,y1=25,ancho=50,alto=50;
color fondo = color(163,170,172), cuadro = color(130,226,247);
int x0 = 0, y0 = 0;
boolean seleccionado=false;

void setup(){
 size(600,400);
 background(fondo);
 frameRate(500);
}

void draw() {
  fill(cuadro);
  background(fondo);
  rect(x1, y1, ancho, alto);
  if(seleccionado){
    x1 = mouseX - x0;
    y1 = mouseY - y0;
  }
}

void mousePressed(){
  if (seleccionado == false){
    if (mouseX>=x1&&mouseX<=x1+ancho&&mouseY>=y1&&mouseY<=y1+alto){
      println("Seleccionado");
      seleccionado = true;
      cuadro = color(8,72,86);
      x0 = mouseX - x1;
      y0 = mouseY - y1;
    }
  }
}
void mouseReleased(){
  seleccionado = false;
  cuadro = color(130,226,247);
}
