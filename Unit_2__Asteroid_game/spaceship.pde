


class spaceship extends gameObject{

//instant variables
//PVector loc; //location
//PVector vel;  //velocity
PVector dir;  //direction
int cooldown;






//constructor
spaceship(){
super(width/2, height/2,0,0);
dir = new PVector (0.06,0);
cooldown = 0;

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
wrapAround();
}


void move(){
 loc.add(vel);
if(upkey) vel.add(dir);

if (leftkey) dir.rotate(-radians(2));
if (rightkey) dir.rotate(radians(2));


}  




void shoot(){
  cooldown--;
if(mkey && cooldown <=0){
  objects.add(new bullet());
  cooldown = 30;
}
}


void CollisionCheck(){


}











}
