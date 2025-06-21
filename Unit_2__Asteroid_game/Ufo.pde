class ufo extends gameObject {
  PVector dir;
  float speed = 3;
  int shootTimer = 0, shootInterval = 120;

  ufo() {
    super(0,0,0,0);
    
    
    int e = int(random(4));
    int x = e;
    while (x==e){
         x = int(random(4));
    }
    
   
      PVector start = edgePos(e, 50);
    PVector end = edgePos(x, 50);
    
    loc = start.copy();
    dir = PVector.sub(end,start).normalize();
    vel = dir.copy().mult(speed);
  }

  PVector edgePos(int s, float off) {
    if (s==0) return new PVector(-off, random(height));
    if (s==1) return new PVector(width+off, random(height));
    if (s==2) return new PVector(random(width), -off);
    return new PVector(random(width), height+off);
  }

  @Override
  void act() {
    loc.add(vel);
    if (++shootTimer >= shootInterval) {
      if(player1 != null){
      PVector aim = PVector.sub(player1.loc, loc).normalize();
      objects.add(new bullet(loc.copy(), aim, false));
      }
      shootTimer = 0;
    }
    if (loc.x < -100 || loc.x > width+100 ||
        loc.y < -100 || loc.y > height+100) {
      lives = 0;
    }
    
    collisionCheck();
  }

  @Override
  void show() {
    pushMatrix();
      translate(loc.x, loc.y);
      float a = atan2(dir.y, dir.x);
      rotate(a);
      imageMode(CENTER);
      image(ufo, 0, 0, ufo.width*0.3, ufo.height*0.3);
    popMatrix();
  }
  
  
  
  void collisionCheck(){
      for (int j = ufos.size() - 1; j >= 0; j--) {
    ufo u = ufos.get(j);
  

    // Check if any player bullet hits this UFO
    for (int e = objects.size() - 1; e >= 0; e--) {
      gameObject o = objects.get(e);
      if (o instanceof bullet) {
        bullet b = (bullet) o;
        if (b.fp && u.loc.dist(b.loc) < 20) {
          for (int p = 0; p < 100; p++) {
            objects.add(new Particle(loc.x, loc.y, 1));
          }
          u.lives = 0;
          objects.remove(e); // remove bullet
          break;
        }
      }
    }
  }
  }
  
  
  }
 
