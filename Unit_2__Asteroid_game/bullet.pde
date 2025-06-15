

class bullet extends gameObject{


  //int lives;
  int timer;

  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    vel.setMag(10);
    timer = 1000;
    d = 5;
  }
  
  
  void show(){
stroke(255);      // white stroke
strokeWeight(0.5);
fill(255, 0, 0);  // bright red fill
circle(loc.x, loc.y, d);

// subtle outer glow
noFill();
stroke(255, 0, 0, 100);
strokeWeight(2);
circle(loc.x, loc.y, d + 6);

// small white highlight spot
noStroke();
fill(255, 150);
circle(loc.x - d*0.15, loc.y - d*0.15, d*0.3);
  }

void act(){
loc.add(vel);
wrapAround();
timer --;
if (timer ==0) lives = 0;
}


}
