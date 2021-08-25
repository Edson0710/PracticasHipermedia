void setup(){
  size(800, 450);
  background(0, 0, 255);
  stroke(255, 255, 255);
  strokeWeight(1);
}

boolean top=false, right=true;

void draw(){
  float m = 1, x=0, y=0;
  float pos_x = 0;
  int cont = 0;
  while(cont < 50){
    if(right){
      if(top){
        for(int k=int(pos_x); k<=width; k++){
          y=x*m;
          point(k,y);
          if(y<=0){
            x--;
            pos_x = k;
            right = true;
            top = false;
            break;
          }
          else{
            x--;
            pos_x = width;
            right = false;
            top = true;
          }
        }
        x++;
      }
      else{
        for(int k=int(pos_x); k<=width; k++){
          y=x*m;
          point(k,y);
          if(y>=height){
            x++;
            pos_x = k;
            top = true;
            right = true;
            break;
          } 
          else{
            x++;
            pos_x = width;
            right = false;
            top = false;
          }
        }
        x--;
      }
    }
    else{
      if(top){
        for(int k=int(pos_x); k>=0; k--){
          y=x*m;
          point(k,y);
          if(y<=0){
            x--;
            pos_x = k;
            right = false;
            top = false;
            break;
          } 
          else{
            x--;
            pos_x = 0;
            right = true;
            top = true;
          }
        }
        x++;
      }
      else{
        for(int k=int(pos_x); k>=0; k--){
          y=x*m;
          point(k,y);
      
          if(y>=height){
            x++;
            pos_x = k;
            right = false;
            top = true;
            break;
          } 
          else{
            pos_x = 0;
            x++;
            right = true;
            top = false;
          }
        }
        x--;
      }
    }
    print(x,pos_x,y,"-- ");
    //print(cont, ", ");
    cont++;

  }
  
  noLoop();
}
