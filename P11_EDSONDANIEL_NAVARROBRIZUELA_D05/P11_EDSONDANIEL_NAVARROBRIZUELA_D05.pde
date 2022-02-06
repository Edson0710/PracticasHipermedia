/*
  @  Desarrollado por: Edson Daniel Navarro Brizuela
  @  Inspirado en: https://openprocessing.org/sketch/186877/
*/


import ddf.minim.*;
Minim minim;
AudioPlayer audio_lanzar, audio_atinar, audio_fallar;
int imagenX, movimientoX = 2, score = 0;
PImage fondo, basura;
ArrayList<Avion> aviones;
float fuerza = 60;
Proyectil proyectil;
PVector gravity = new PVector(0, 10);
boolean lanzado = false, colision = false, cambio = false;

void setup(){
  size(800, 600);
  fondo = loadImage("fondo.png");
  fondo.resize(800,600);
  basura = loadImage("trash_empty.png");
  basura.resize(100,100);
  image(fondo,0,0);
  proyectil = new Proyectil();
  aviones = new ArrayList<Avion>();
  frameRate(40);
  minim = new Minim(this);
  audio_lanzar = minim.loadFile("lanzar.wav");
  audio_atinar = minim.loadFile("colision.wav");
  audio_fallar = minim.loadFile("fallar.wav");
}

void draw(){
  if(score >=5 && !cambio)
    cambiarBasura();
  image(fondo,0,0);
  fuerzaLanzamiento();
  moverBasura();  
  trayectoriaAvion();
  eliminarAvion();
  if(!lanzado)
    proyectil.render();
  textSize(32);
  text("Score: "+score,350,30);
}

void cambiarBasura(){
  basura = loadImage("trash_full.png");
  basura.resize(100,100);
  cambio = true;
}

void moverBasura(){
  image(basura,(imagenX + 100) + 10, height - 100);
  imagenX = imagenX + movimientoX;
  
  if(imagenX > width/2 + 180) {
    movimientoX = -2;
  }
  if(imagenX < 0) {
    movimientoX = 2;
  }
}

void fuerzaLanzamiento(){
  strokeWeight(5);
  fill(16, 150, 179);
  rect(20, 580, 40, -fuerza / 4);
  noFill();
  rect(20, 580, 40, -149);
  if (fuerza > 59){
    fuerza = fuerza + 5;
  }
  if (fuerza > 600){
    fuerza = 60;
  }
}

void trayectoriaAvion(){
  for (int i = 0; i < aviones.size(); i++) {
    Avion s = aviones.get(i);
    s.applyForce(gravity);
    s.update(0.016);
    if(!colision)
      s.render();
    if(s.pos.x >= (imagenX+150) && s.pos.x <= (imagenX+230) && s.pos.y >= (height-100) && !colision){ 
      println("Colision");
      colision = true;
      audio_atinar = minim.loadFile("colision.wav");
      audio_atinar.play();
      score++;
    }
  }
}



void eliminarAvion(){
  for (int i = aviones.size()-1; i >= 0; i--) {
    Avion s = aviones.get(i);
    if (s.pos.y > height) {
      aviones.remove(s);
      lanzado = false;
      if(!colision){
        audio_fallar = minim.loadFile("fallar.wav");
        audio_fallar.play();
      }
      colision = false;
    }
  }
}

void mousePressed() {
  if(!lanzado){
    audio_lanzar = minim.loadFile("lanzar.wav");
    audio_lanzar.play();
    proyectil.lanzar();
    lanzado = true;
  }
}

public class Proyectil {
  PImage shaft;

  public Proyectil() {
    shaft = loadImage("avion.gif");
    shaft.resize(50,50);
  }

  public void render() {
    pushMatrix();
    translate(0, 100);
    rotate(getDir());
    image(shaft, 0, 0);
    popMatrix();
  }

  public void lanzar() {
    Avion s = new Avion();
    s.pos.x = 0;
    s.pos.y =  100;

    float dir = getDir();
    float rot = dir + PI/2;
    
    float x = sin(rot) * fuerza;
    float y = -cos(rot) * fuerza;

    s.applyForce(new PVector(x, y));

    aviones.add(s);
  }
  
  float getDir() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector cannon = new PVector(0, 100);
    PVector dir = PVector.sub(mouse, cannon);    
    return atan2(dir.y, dir.x);
  }
}

class Avion {

  PVector pos;
  PVector acc;
  PVector vel;

  PImage img;

  Avion() {
    pos = new PVector();
    vel = new PVector();
    acc = new PVector();

    img = loadImage("avion.gif");
    img.resize(50,50);
  }

  void update(float delta) {
    vel.add(acc);

    pos.x += vel.x * delta;
    pos.y += vel.y * delta;

    acc.mult(0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(atan2(vel.y, vel.x));
    image(img, 0, 0);
    popMatrix();
  }
}
