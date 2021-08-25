void setup(){
  size(3, 700);
  background(255, 0, 0);
}

void draw(){
  //  Se declaran las coordenadas de inicio en X y Y.
  float x_origen = 0, y_origen = 0, x_destino = width, y_destino = height;
  //  Se calcula la pendiente
  float m = (y_destino - y_origen) / (x_destino - x_origen);
  //  Se declara la variable que utilizaremos en funcion con la ecuacion de la recta
  float y;
  //  Evaluaremos la ecuacion incrementando X con flotantes para mayor precision
  for(float x=0; x <= width; x+=0.001){
    //  Ecuacion de la recta
    y = m * x;
    point(x, y);
  }
  
  //delay()
  
  /*
    Calculos
    y-y1 = m(x-x1)
    y-0 = 1(x-0)
    y = mx
  */
  
  /*
  void draw(){
  float delta;
  if(width > height){
    delta = float(height) / float(width);
    for(int i=0; i<=width; i++){
      point(i, i*delta);
    }
  }
  else{
    delta = float(width) / float(height);
    for(int i=0; i<=height; i++){
      point(i*delta, i);
    }
  }
}
  */
  
}
