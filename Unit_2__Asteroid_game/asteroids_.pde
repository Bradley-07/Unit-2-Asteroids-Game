

class gameObject{

PVector loc;//location
PVector vel; //velocity
int lives;

gameObject(float lx, float ly, float vx, float vy){
loc = new PVector(lx, ly);
vel = new PVector (vx,vy);
}

gameObject(PVector l, PVector v){
loc = l;
vel = v;
}

void show(){


}



void act(){

}


}
