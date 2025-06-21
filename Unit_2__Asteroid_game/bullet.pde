

  class bullet extends gameObject{
    boolean fp;
  
    //int lives;
    int timer;
  
    bullet() {
      super(player1.loc.copy(), player1.dir.copy());
      vel.setMag(10);
      timer = 300;
      this.d = 5;
      fp = true;
    }
    
    
    
  bullet(PVector s, PVector d, boolean fromplayer) {
      super(s, d);
      fp = fromplayer;
      vel.setMag(10);
          this.d = 5;
      timer = 300;
    }  
    
    void show(){
 if (fp) {
    stroke(0, 255, 255); // cyan stroke
    fill(255);           // white core
  } else {
    stroke(255, 0, 0);   // red stroke
    fill(255, 50, 50);   // pink-red core
  }

  strokeWeight(0.5);
  circle(loc.x, loc.y, d);

  // glow
  noFill();
  stroke(fp ? color(0, 255, 255, 100) : color(255, 0, 0, 100));
  strokeWeight(3);
  circle(loc.x, loc.y, d + 6);

  // highlight
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
