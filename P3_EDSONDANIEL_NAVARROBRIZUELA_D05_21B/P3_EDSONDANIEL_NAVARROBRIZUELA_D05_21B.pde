void setup(){
  size(400,300);
  background(0,0,0);
  stroke(255,255,255);
  strokeWeight(5);
  frameRate(1);
}
int decena = 0, unidad = 0;
float x = 5.7;
float tam = 40*x;

void draw(){
  clear();
  if(decena == 6){
    end();
    noLoop();
  }
  else{
    numeros(decena, 0);
    numeros(unidad, tam);
    unidad++;
    if(unidad == 10){
      unidad = 0;
      decena++;    
    }
  }
  
  
}

void numeros(int n, float pos){
  
  strokeWeight(5*x);
  if(n == 0){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+5*x, 30*x, pos+5*x, 40*x);  //e
    line(pos+5*x, 10*x, pos+5*x, 20*x);  //f
  }
  else if(n == 1){
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
  }
  else if(n == 2){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+5*x, 30*x, pos+5*x, 40*x);  //e
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }
  else if(n == 3){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }
  else if(n == 4){
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+5*x, 10*x, pos+5*x, 20*x);  //f
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }
  else if(n == 5){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+5*x, 10*x, pos+5*x, 20*x);  //f
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }
  else if(n == 6){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+5*x, 30*x, pos+5*x, 40*x);  //e
    line(pos+5*x, 10*x, pos+5*x, 20*x);  //f
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }
  else if(n == 7){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
  }
  else if(n == 8){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+5*x, 30*x, pos+5*x, 40*x);  //e
    line(pos+5*x, 10*x, pos+5*x, 20*x);  //f
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }
  else if(n == 9){
    line(pos+10*x, 5*x, pos+20*x, 5*x);  //a
    line(pos+25*x, 10*x, pos+25*x, 20*x);  //b
    line(pos+25*x, 30*x, pos+25*x, 40*x);  //c
    line(pos+10*x, 45*x, pos+20*x, 45*x);  //d
    line(pos+5*x, 10*x, pos+5*x, 20*x);  //f
    line(pos+10*x, 25*x, pos+20*x, 25*x);  //g
  }

}

void end(){
  stroke(255,0,0);
  numeros(5, 0);
  numeros(9, tam);
}
