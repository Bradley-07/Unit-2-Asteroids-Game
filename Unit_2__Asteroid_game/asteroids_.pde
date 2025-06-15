
class asteroids extends gameObject {

  asteroids(float  x, float y, int l) {
    super(x, y, 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = l;
    d= lives * 50;
  }
  asteroids() {
    super(random(width), random(height), 1, 1);
    vel.setMag(random(1, 3));
    vel.rotate(random(TWO_PI));
    lives = 3;
    d= lives * 50;
  }



  void show() {
    fill(black);
    stroke(white);
    strokeWeight(5);
    circle(loc.x, loc.y, lives*50);
   
  }


  void act() {
    loc.add(vel);
    wrapAround();
    checkForCollisions();
  }


  void checkForCollisions() {
    int i =0;
    while (i< objects.size()) {
      gameObject object = objects.get(i);
      if (object instanceof bullet) {
        if (dist(loc.x, loc.y, object.loc.x, object.loc.y) < d/2 + object.d/2) {
          objects.add(new asteroids(loc.x, loc.y, lives-1));
          objects.add(new asteroids(loc.x, loc.y, lives-1));
          lives = 0;
          object.lives =0;
        }
      }
      i++;
    }
  }
}
