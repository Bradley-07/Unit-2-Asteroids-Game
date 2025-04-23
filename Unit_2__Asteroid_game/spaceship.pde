


class spaceship extends gameObject{

//instant variables
//PVector loc; //location
//PVector vel;  //velocity
PVector dir;  //direction






//constructor
spaceship(){
super(width/2, height/2,0,0);
dir = new PVector (0.06,0);


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

if (leftkey) dir.rotate(-radians(2));
if (rightkey) dir.rotate(radians(2));

//wrap around 
if(loc.x <0) loc.x = width;
if(loc.x > width) loc.x = 0;
if(loc.y < 0 ) loc.y = height;
if(loc.y > height) loc.y = 0;
}  




void shoot(){
if(mkey) objects.add(new bullet());
}


void CollisionCheck(){


}











}
