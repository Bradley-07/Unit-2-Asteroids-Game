


class spaceship extends gameObject{

//instant variables
//PVector loc; //location
//PVector vel;  //velocity
PVector dir;  //direction
int cooldown;

int lives;
boolean exploding = false;
int explosionTimer = 0;
boolean invincible = false;
int invincibleTimer =0;

int teleportCooldown = 0;
final int TELEPORT_COOLDOWN_MAX = 600; // 3 seconds at 60fps
boolean teleportReady = true;


//constructor
spaceship(){
super(width/2, height/2,0,0);
dir = new PVector (0.03,0);
cooldown = 0;
lives = 5;
d =50;
}




//behaviour functions 
void show(){
  
   if (exploding) {
    fill(255, 100, 0, 150);
    circle(loc.x, loc.y, 60 + random(10));
    return;
  }
  
    if (invincible && frameCount % 10 < 5) {
    return; // Flicker effect
  }
pushMatrix();
translate(loc.x,loc.y);
rotate(dir.heading());
drawShip();
popMatrix();

drawHUD();
}

void drawShip(){
  
   if (exploding){
   fill(255,0,0,127);
   } else{
  
  fill(#19214B);
   }
  stroke(255);
strokeWeight(2);
scale(1);
   
  beginShape();
  vertex(24, 0);       // Sharp nose
  vertex(10, -8);      
  vertex(5, -6);       
  vertex(-10, -20);    // Aggressive top wing
  vertex(-12, -10);    
  vertex(-18, -6);     // Rear side point
  vertex(-16, 0);      // Back middle
  vertex(-18, 6);      // Rear side point
  vertex(-12, 10);     
  vertex(-10, 20);     // Aggressive bottom wing
  vertex(5, 6);        
  vertex(10, 8);       
  endShape(CLOSE);

  // === Pyramid Cockpit ===
  fill(0, 255, 255);
  stroke(0, 200, 255);
  strokeWeight(1.5);
  beginShape();
  vertex(11, 0);     // Tip
  vertex(2, -6);     // Back top
  vertex(2, 6);      // Back bottom
  endShape(CLOSE);

  // === Side Guns ===
  fill(255);
  stroke(200);
  strokeWeight(1);

  // Top gun
 beginShape();
  vertex(-5, -18);   // back base (near wing)
  vertex(10, -18);   // front tip
  vertex(15, -14);   // front bottom
  vertex(-5, -14);   // back bottom
  endShape(CLOSE);

  // Bottom gun
  beginShape();
  vertex(-5, 18);    // back base (near wing)
  vertex(10, 18);    // front tip
  vertex(15, 14);    // front top
  vertex(-5, 14);    // back top
  endShape(CLOSE);
  
      if (upkey) {
    // Flame when thrusting
    stroke(255, 100, 0);
    fill(255, 150, 0, 180);
    triangle(-22, -4, -32, 0, -22, 4);
}
  
}



void act(){
   if (exploding) {
    explosionTimer--;
    if (explosionTimer <= 0) {
      exploding = false;
    }
    return; // Don't act while exploding
  }

  if (invincible) {
    invincibleTimer--;
    if (invincibleTimer <= 0) {
      invincible = false;
    }
  }
  
move();
shoot();
CollisionCheck();
wrapAround();
updateSurvival();
}


void move(){
 loc.add(vel);
if(upkey){
  vel.add(dir);
}

if(downkey) vel.add(dir.copy().mult(-1));  
if (leftkey) dir.rotate(-radians(1.3));
if (rightkey) dir.rotate(radians(1.3));

if(nkey) {
 teleport();
 
}
updateTeleport();
}  




void shoot(){
  cooldown--;
if(mkey && cooldown <=0){
  PVector aim = dir.copy().normalize();
      PVector start = loc.copy();
      objects.add(new bullet(start, aim, true));
  cooldown = 60;
}
}


void CollisionCheck() {
  
  if (player1.invincible || player1.exploding) return;
  // 1. Collision with asteroids
  for (int i = 0; i < objects.size(); i++) {
    gameObject obj = objects.get(i);
    if (obj instanceof asteroids) {
      asteroids a = (asteroids) obj;
      float distToAsteroid = player1.loc.dist(a.loc);
      float combinedRadius = (player1.d / 2) + (a.d / 2);
      if (distToAsteroid < combinedRadius) {
      
        player1.lives--;  // or trigger explosion, reset, etc.
        player1.explode();
        
      }
    }
  }

  // 2. Collision with UFO bullets
   if (player1.invincible) return; // Don't check if already invincible

  for (int i = objects.size() - 1; i >= 0; i--) {
    gameObject obj = objects.get(i);
    if (obj instanceof bullet) {
      bullet b = (bullet) obj;
      if (!b.fp) { // UFO bullet
        float distToBullet = player1.loc.dist(b.loc);
        float combinedRadius = (player1.d / 2) + (b.d / 2);

        if (distToBullet < combinedRadius) {
          // Take damage and activate invincibility
          player1.lives--;
          player1.explode();

          objects.remove(i); // Remove the bullet
          break; // Stop checking others
        }
      }
    }
  }
}

void updateTeleport() {
  if (!teleportReady) {
    teleportCooldown--;
    if (teleportCooldown <= 0) {
      teleportReady = true;
      teleportCooldown = 0;
    }
  }
}


void teleport() {
  if (!teleportReady || exploding || invincible) return;
  
  PVector newLoc;
  boolean safeLocation = false;
  int attempts = 0;
  final int MAX_ATTEMPTS = 100;
  
  // Keep trying until we find a safe spot or max attempts
  while (!safeLocation && attempts < MAX_ATTEMPTS) {
    attempts++;
    newLoc = new PVector(random(width), random(height));
    safeLocation = true;
    
    // Check distance to all asteroids
    for (int i = 0; i < objects.size(); i++) {
      gameObject obj = objects.get(i);
      if (obj instanceof asteroids) {
        if (newLoc.dist(obj.loc) < 200) {
          safeLocation = false;
          break;
        }
      }
    }
    
    if (safeLocation) {
      // Create teleport effect particles
      for (int i = 0; i < 30; i++) {
        objects.add(new Particle(loc.x,loc.y,3));
 
      }
      
      loc = newLoc;
      teleportReady = false;
      teleportCooldown = TELEPORT_COOLDOWN_MAX;
      
      // Create arrival particles
      for (int i = 0; i < 30; i++) {
        objects.add(new Particle(loc.x,loc.y,3));
      }
      break;
    }
  }
  
  if (attempts >= MAX_ATTEMPTS) {
    println("Couldn't find safe teleport location!");
  }
}


void updateSurvival() {
  if (!exploding) {
    survivalTime++; // Increases every frame
  }
}



void drawHUD() {
  float marginX = 20;
  float marginY = height - 50;
  float textWidth = 60;  // Width for labels
  float barWidth = 120;
  float barHeight = 12;
  float spacing = 20;

  // Health display
  drawLabeledBar("HEALTH:", 
                marginX, marginY, 
                textWidth, barWidth, barHeight, 
                (float)lives/5.0, 
                color(255, 50, 50), color(255, 200, 0), color(0, 255, 0));

  // Teleport display
  float teleportFill = 1 - (float)teleportCooldown/TELEPORT_COOLDOWN_MAX;
  color readyColor = color(100, 150, 255);  // Blue when ready
  color chargingColor = color(255, 100, 100);  // Red when charging
  
  drawLabeledBar("TELEPORT:", 
                marginX, marginY + spacing, 
                textWidth, barWidth, barHeight, 
                teleportFill, 
                chargingColor, readyColor, readyColor);
}

void drawLabeledBar(String label, float x, float y, float textW, float barW, float barH, 
                   float fillAmount, color lowColor, color midColor, color highColor) {
  // Draw label
  fill(255);
  textSize(12);
  textAlign(RIGHT);
  text(label, x + textW, y + barH - 2);  // Vertically centered
  
  // Draw bar background
  noStroke();
  fill(50);
  rect(x + textW + 5, y, barW, barH);
  
  // Calculate fill color
  color fillColor;
  if (fillAmount < 0.5) {
    fillColor = lerpColor(lowColor, midColor, fillAmount * 2);
  } else {
    fillColor = lerpColor(midColor, highColor, (fillAmount - 0.5) * 2);
  }
  
  // Draw fill
  fill(fillColor);
  rect(x + textW + 5, y, barW * fillAmount, barH);
  
  // Reset text alignment
  textAlign(LEFT);
}

void explode() {
  exploding = true;
  explosionTimer = 60; // 1 second
  invincible = true;
  invincibleTimer = 120; // 2 seconds
}



}
