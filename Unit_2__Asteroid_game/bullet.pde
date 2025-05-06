

class bullet extends gameObject{


  //int lives;
  int timer;

  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 1000;
  }
  
  
  void show(){
fill(red);  
  stroke(white);
  strokeWeight(0.3);
  circle(loc.x,loc.y,5);
  }

void act(){
loc.add(vel);
wrapAround();
timer --;
if (timer ==0) lives = 0;
}


}
