


class spaceship{

//instant variables
PVector loc; //location
PVector vel;  //velocity
PVector dir;  //direction






//constructor
spaceship(){
loc = new PVector (width/2, height/2);
vel = new PVector (0,0);
dir = new PVector (1,0);


}




//behaviour functions 
void show(){
pushMatrix();
translate(loc.x,loc.y);
rotate(dir.heading());
drawShip();
popMatrix();

}

void drawShip(){
fill(navy);
stroke(white);
strokeWeight(2);
triangle(-10,-10,-10,10,30,0);

}

void act(){
move();
shoot();
CollisionCheck();
}


void move(){
 loc.add(vel);
if(upkey) vel.add(dir);

if (leftkey) dir.rotate(-radians(3));
if (rightkey) dir.rotate(radians(3));
}  

void shoot(){

}


void CollisionCheck(){


}











}
