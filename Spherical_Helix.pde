void setup(){
    size(600,600,P3D);
    background(235);
}

int bgColor=235;
float phi=0;
float the=0;
float RADIUS=100;
float shake=2;

void draw(){
    background(bgColor);
    stroke(0);
    fill(0);
    pushMatrix();
        translate(width/2,heigth/2);
        rotateY(phi);
        shake();
        beginShape();
                for(the=-2*PI;the<=2*PI;the+=0.1){
                    float x = RADIUS*cos((the-PI)/2)*cos(16.4*the); 
                    float y = RADIUS*cos((the-PI)/2)*sin(16.4*the); 
                    float z = RADIUS*sin((the-PI)/2);
                    vertex(x,y,z);
                }
        endShape();
        phi+=0.6;
    popMatrix();
}


