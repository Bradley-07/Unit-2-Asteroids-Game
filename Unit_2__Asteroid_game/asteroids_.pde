
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
  pushMatrix();
  translate(loc.x, loc.y);
  rotate(frameCount * 0.002);

  // Randomize appearance (based on position for consistency)
  randomSeed((int)(loc.x + loc.y)); // so it stays the same each frame

  // 1. Color variety (grays, browns, metallics)
  float hue = random(20, 60); // earthy tones
  float brightness = random(60, 100);
  fill(hue, 50, brightness); // using HSB later

  stroke(255);
  strokeWeight(2);

  // 2. Size variation (still based on lives, but slight randomness)
  float baseSize = d * random(0.9, 1.1);
  float radius = baseSize / 2;

  // 3. Shape variety (random spikes per asteroid)
  int spikes = int(random(7, 14));

  beginShape();
  for (int i = 0; i < spikes; i++) {
    float angle = TWO_PI / spikes * i;
    float offset = random(-radius * 0.3, radius * 0.3);
    float r = radius + offset;
    float x = cos(angle) * r;
    float y = sin(angle) * r;
    vertex(x, y);
  }
  endShape(CLOSE);

  // Optional: crater holes
  noStroke();
  fill(30, 180);
  for (int i = 0; i < 2; i++) {
    float cx = random(-radius * 0.4, radius * 0.4);
    float cy = random(-radius * 0.4, radius * 0.4);
    float cd = random(5, 15);
    ellipse(cx, cy, cd, cd);
  }

  popMatrix();
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
          for (int p = 0; p < 100; p++) {
            objects.add(new Particle(loc.x, loc.y, 2));
          }
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
