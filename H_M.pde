int scl=7,num=5;
float wt=2;
int cols,rows;
void setup(){
      size(600,600);
        cols=width/scl;
          rows=2*height/scl;
            background(255);
              for(int i = 0;i<rows;i++){
                      for(int j=0;j<cols;j++){
                                drawThing(j*scl*(num+1)+((i%2)*(num+1)*scl/2),(num+1)*i*scl/4);
                                    }
                        }
}

void draw(){

}

void drawThing(float x,float y){
      fill(255);
        stroke(150);
          strokeWeight(wt);
            for(int i=num;i>0;i--){
                    ellipse(x,y,(i+1)*scl,(i+1)*scl);
                      }
}
