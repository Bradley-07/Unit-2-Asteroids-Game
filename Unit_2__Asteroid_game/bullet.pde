class bullet {

  PVector loc;
  PVector velocity;
  int lives;

  bullet() {
    loc = new PVector(player1.loc.x, player1.loc.y);
    velocity = player1.dir.copy();
    velocity.setMag(10);
  }
  
  
  void show(){
fill(black);  
  stroke(white);
  strokeWeight(2);
  circle(loc.x,loc.y,5);
  }

void act(){
loc.add(velocity);

}


}
