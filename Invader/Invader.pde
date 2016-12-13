int cols,rows;
float scl = 2;
void setup(){
  fullScreen();
  background(255);
  noStroke();
  fill(130);
  cols = width/((int)scl*(5+2));
  rows = height/((int)scl*(5+2));
  background(255,30);
  for(int i=0;i<=cols;i++){
    for(int j=0;j<=rows;j++){
      pushMatrix();
      translate(i*(int)(scl)*(5+2),j*(int)(scl)*(5+2)); 
      drawInvader();
      popMatrix();
    }
  }
  saveFrame("image###.bmp");
}

void drawCol(int num){
  int acc=num;
  pushMatrix();
  for(int i=0;i<5;i++){
    translate(0,scl);
    if(acc%2==1)
      rect(0,0,scl,scl);
    acc/=2;
  }
  popMatrix();
}

void drawInvader(){
  int edge = (int)random(0,63);
  int mid = (int)random(0,63);
  int cen = (int)random(0,63);
  translate(scl,0);
  drawCol(edge);
  translate(scl,0);
  drawCol(mid);
  translate(scl,0);
  drawCol(cen);
  translate(scl,0);
  drawCol(mid);
  translate(scl,0); 
  drawCol(edge);
}

void draw(){

}
  