class Particle extends gameObject {

  float transparency;
  float size;
  color colour;

  float r, g, b;



  Particle(float x, float y, int situation) { 
    super(x, y, 1, 1);

    vel.rotate(random(TWO_PI));
    vel.setMag(random(0.5, 3));
    transparency = 255;
    d = random(2, 10);

    if (situation == 1) {
      r = 250;
      g = 0;
      b = 0;
      colour = color(r, g, b, transparency);
    } else if (situation == 2) {
      r = 66;
      g = 145;
      b = 203;
      colour = color(r, g, b, transparency);
    } else if (situation == 3) {
      r = 255;
      g = 255;
      b = 255;
      colour = color(r, g, b, transparency);
    } else if (situation == 4) {  
      r = 0;
      g = random(138, 227);
      b = random(141, 227);
      colour = color(r, g, b, transparency);
    } 
  }

  void show() {
    noStroke();
    fill(colour);
    circle(loc.x, loc.y, d);
  }

  void act() {
    loc.add(vel);

    // fade
    transparency -= 5;
    if (transparency <= 0) {
      lives = 0;
    }

    // update
    colour = color(r, g, b, transparency);
  }
}
