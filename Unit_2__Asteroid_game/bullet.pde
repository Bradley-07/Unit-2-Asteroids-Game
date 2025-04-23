

class bullet extends gameObject{


  int lives;

  bullet() {
    super(player1.loc.copy(), player1.dir.copy());
    
    vel.setMag(10);
  }
  
  
  void show(){
fill(red);  
  stroke(white);
  strokeWeight(0.3);
  circle(loc.x,loc.y,5);
  }

void act(){
loc.add(vel);

}


}
