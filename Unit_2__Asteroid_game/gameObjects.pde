class gameObject{

PVector loc;//location
PVector vel; //velocity
int lives;
float d;


gameObject(float lx, float ly, float vx, float vy){
loc = new PVector(lx, ly);
vel = new PVector (vx,vy);
lives = 1;
}

gameObject(PVector l, PVector v){
loc = l;
vel = v;
lives =1;
}

gameObject(PVector l, PVector v, int lv){
loc = l;
vel = v;
lives = lv;
}

void show(){


}



void act(){

}

void wrapAround(){
if(loc.x <0) loc.x = width;
if(loc.x > width) loc.x = 0;
if(loc.y < 0 ) loc.y = height;
if(loc.y > height) loc.y = 0;

}


void update() {
    loc.add(vel);
  }


}
