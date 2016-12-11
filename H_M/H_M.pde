int scl=9,num=5;
float wt=2,radius=300;
int lines=100;
int cols,rows;
float t=0;

void setup(){
  size(600,600);
  cols=width/scl;
  rows=2*height/scl;
}

void draw(){
  background(255);
  fill(255);
  stroke(150);
  strokeWeight(wt);
  for(int i = 0;i<rows;i++){
    for(int j=0;j<cols;j++){
        drawThing(j*scl*(num+1)+((i%2)*(num+1)*scl/2),(num+1)*i*scl/4);
    }
  } 
  translate(width/2,height/2);
  stroke(0);
  for(float th=0;th<TWO_PI;th+=(TWO_PI/lines)){
    float r = radius*noise(th,t);
    float x = cos(th)*r;
    float y = sin(th)*r;
    line(0,0,x,y);
  }
  t+=0.01;
  saveFrame("image####.png");
  if(frameCount>400){exit();}
}

void drawThing(float x,float y){
  for(int i=num;i>0;i--){
    ellipse(x,y,(i+1)*scl,(i+1)*scl);
  }
}