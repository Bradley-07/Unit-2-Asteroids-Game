
class asteroids extends gameObject{

asteroids(){
super(random(width), random(height),1,1);
vel.setMag(random(1,3));
vel.rotate(random(TWO_PI));
lives = 3;

}


void show(){
fill(black);
stroke(white);
circle(loc.x,loc.y,lives*50);
line(loc.x,loc.y,loc.x+lives*50/2,loc.y);
}


void act(){
loc.add(vel);
wrapAround();
}







}
