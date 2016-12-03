void setup(){
  size(600,600,P3D);
  background(255);
  entities= new ArrayList();
  for(int i=0;i<40;i++)entities.add(new Entity());
    follow = new PVector(0, 0, 0);

}

void follow(Entity test) {
  follow.x += (test.pos.x-follow.x)/fspeed;
  follow.y += (test.pos.y-follow.y)/fspeed;
  follow.z += (test.pos.z-follow.z)/fspeed;
}

float fspeed=1000.0;
PVector follow;
float ATT=10000.0;
float LIMIT_VEL=3.0;
float SLOW_DOWN=0.8;
int bgColor = 235;
float phi=0;
float the=0;
float RADIUS=100;
float SHAKE=2;
int TRAIL_LENGTH=20;
ArrayList entities;
void draw(){
  smooth();
  shininess(10);
  lights();
  background(bgColor);
  pushMatrix();
    translate(width/2,height/2);
    rotateY(phi);
    shake();
    pushMatrix();
      for (int i = 0 ; i < entities.size();i++) {
        Entity e = (Entity)entities.get(i);
        pushMatrix();  
          follow(e);
          translate(-follow.x, -follow.y, -follow.z);
          e.draw();
        popMatrix();
      }
    popMatrix();
    stroke(0);
    fill(0,0,0);
    beginShape();
        for(the=-2*PI;the<=2*PI;the+=0.02){
          float x= RADIUS*cos((the-PI)/2)*cos(16.4*the);
          float y= RADIUS*cos((the-PI)/2)*sin(16.4*the);
          float z = RADIUS*sin((the-PI)/2);
          vertex(x,y,z);
        }
     endShape();
     phi+=0.06;
  popMatrix();
  saveFrame("image###.png");
}

void shake() {
  float x = noise(frameCount/3.0, 0, 0)*SHAKE;
  float y = noise(0, frameCount/3.0, 0)*SHAKE;
  float z = noise(0, 0, frameCount/3.0)*SHAKE;

  translate(x, y, z);
}

class Entity{
  PVector pos,vel,acc;
  ArrayList trail;
  
  Entity(){
    pos = new PVector(0,0,0);
    acc = new PVector(0,0,0);
    vel = new PVector(0,0,0);
    
    trail= new ArrayList();
  }
  
  void move(){
    trail.add(new PVector(pos.x,pos.y,pos.z));
    
    if(trail.size()>TRAIL_LENGTH){
      trail.remove(0);
    }
    
    pos.add(vel);
    vel.add(acc);
    acc.add(new PVector(random(-.1,.1),random(-.1,.1),random(-.1,.1)));
    
    vel.limit(LIMIT_VEL);
    acc.mult(SLOW_DOWN);
  }
  
  void attract(){
    int sel = (int)random(entities.size());
    
    Entity ran = (Entity)entities.get(sel);
    
    acc.x+= (ran.pos.x - pos.x)/ATT;
    acc.y+= (ran.pos.y - pos.y)/ATT;
    acc.z+= (ran.pos.z - pos.z)/ATT;
  }
    
  void draw(){
    move();
    attract();
    fill(0);
    noStroke();
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    PVector lpos =(PVector)(trail.get(trail.size()-1));
    rotateX(atan2(pos.y-lpos.y, pos.x-lpos.x));
    rotateY(atan2(pos.x-lpos.x, pos.z-lpos.z));
    rotateZ(atan2(pos.y-lpos.y, pos.z-lpos.z));
    
    box(5);
    popMatrix();
    noFill();
    beginShape();
    for(int i=0;i<trail.size();i++){
      PVector tmp = (PVector)trail.get(i);
      stroke(0,map(i,0,trail.size(),40,255));
      stroke(map(i,0,trail.size(),0,50));
      vertex(tmp.x,tmp.y,tmp.z);
    }
    endShape();
  }
}

void mousePressed(){
  exit();
}

    
