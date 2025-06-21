
void game() {
    if (isPaused) {
    pause();
  } 
  drawSpaceBackground();
  fill(50,200,255, 255);
  

  player1.show();
  player1.act();
  
drawSurvivalCounter();
  // Update all regular game objects
  int i = 0;
  while (i < objects.size()) {
    gameObject currentObject = objects.get(i);
    currentObject.show();
    currentObject.act();
    if (currentObject.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }

  // Spawn UFO periodically
  if (frameCount >= nextUfoFrame) {
    ufos.add(new ufo());
    nextUfoFrame = frameCount + int(random(300, 600));
  }

  // Update UFOs
  for (int j = ufos.size() - 1; j >= 0; j--) {
    ufo u = ufos.get(j);
    u.act();
    u.show();

    // Check if any player bullet hits this UFO
   

    // Remove dead UFOs
    if (u.lives <= 0) {
      ufos.remove(j);
    }
  }
  
  if (player1.lives == 0){
  mode = gameover;
  }
  
  //pause button
  
  stroke(cool);
  fill(0,0,0,100);
 rect(width-70,30,50,50);
 fill(255);
 textAlign(CENTER, CENTER); // Center text in button
textSize(12); // Set appropriate size
text("Pause", width-45, 55);
 if(mouseX> width-70&& mouseX< width-30 && mouseY >30 && mouseY < 80){
  cool = white;
  } else {
  cool = black;
  }
  if(mousePressed&& mouseX> width-70&& mouseX< width-30 && mouseY >30 && mouseY < 80){
  mode = pause;
  isPaused = true;
  } 
  
  boolean noAsteroids = true;
for (gameObject obj : objects) {
  if (obj instanceof asteroids) {
    noAsteroids = false;
    break;
  }
}

if (!scoreLocked && (player1.lives == 0 || noAsteroids)) {
  finalScore = survivalTime;
  scoreLocked = true;
  mode = win;
}
  
  
}



void drawSpaceBackground() {
  // Deep space gradient (dark purple to black)
  for (int y = 0; y < height; y++) {
    float n = map(y, 0, height, 0, 1);
    stroke(lerpColor(color(10, 5, 20), color(0), n));
    line(0, y, width, y);
  }

  // Draw distant sun (left side)
  drawSun(width * 0.15, height * 0.3, 120);

  // Draw planets
  drawPlanet(width * 0.7, height * 0.25, 50, color(200, 150, 100), 0.3); // Desert planet
  drawPlanet(width * 0.8, height * 0.7, 70, color(70, 120, 200), 0.5);  // Ice planet
  drawPlanet(width * 0.3, height * 0.8, 40, color(180, 80, 60), 0.2);   // Mars-like

  // Asteroid belt between planets
  drawAsteroidBelt(width * 0.4, height * 0.5, 250, 180, 30);

  // Draw stars (twinkling effect)
  drawStars(400);
  drawDistantAsteroids(12);
}

void drawSun(float x, float y, float size) {
  // Sun glow
  for (int i = 1; i <= 3; i++) {
    float glowSize = size * (1 + i * 0.3);
    float alpha = 30 - i * 10;
    fill(255, 200, 100, alpha);
    noStroke();
    circle(x, y, glowSize);
  }
  
  // Sun core
  fill(255, 220, 150);
  circle(x, y, size);
  
  // Sun surface details
  noStroke();
  for (int i = 0; i < 20; i++) {
    float r = random(size * 0.4, size * 0.5);
    float a = random(TWO_PI);
    float flareSize = random(5, 15);
    fill(255, 180 + random(50), 50 + random(50), 150);
    circle(x + cos(a) * r, y + sin(a) * r, flareSize);
  }
}

void drawPlanet(float x, float y, float size, color baseColor, float detailScale) {
  // Planet glow
  fill(red(baseColor), green(baseColor), blue(baseColor), 50);
  circle(x, y, size * 1.2);
  
  // Planet main body
  fill(baseColor);
  circle(x, y, size);
  
  // Planet details (craters/clouds)
  noStroke();
  randomSeed((int)(x + y)); // Consistent details
  for (int i = 0; i < size * detailScale; i++) {
    float a = random(TWO_PI);
    float r = random(size * 0.3, size * 0.5);
    float craterSize = random(3, size * 0.2);
    color detailColor = color(
      red(baseColor) * random(0.7, 1.3),
      green(baseColor) * random(0.7, 1.3),
      blue(baseColor) * random(0.7, 1.3)
    );
    fill(detailColor);
    circle(x + cos(a) * r, y + sin(a) * r, craterSize);
  }
  
  // Ring for some planets (random chance)
  if (random(1) > 0.6) {
    pushMatrix();
    translate(x, y);
    rotate(QUARTER_PI);
    noFill();
    stroke(150, 120, 100, 150);
    strokeWeight(2);
    ellipse(0, 0, size * 1.8, size * 0.6);
    popMatrix();
  }
}

void drawAsteroidBelt(float x, float y, float width, float height, int count) {
  noStroke();
  randomSeed(123); // Consistent belt
  for (int i = 0; i < count; i++) {
    float px = x + random(-width/2, width/2);
    float py = y + random(-height/2, height/2);
    float size = random(3, 8);
    fill(120 + random(50), 100 + random(40), 80 + random(30));
    pushMatrix();
    translate(px, py);
    rotate(random(TWO_PI));
    beginShape();
    for (int j = 0; j < 6; j++) {
      float angle = TWO_PI * j/6;
      float r = size * (0.7 + random(0.3));
      vertex(r * cos(angle), r * sin(angle));
    }
    endShape(CLOSE);
    popMatrix();
  }
}

void drawStars(int count) {
  randomSeed(456); // Consistent stars
  noStroke();
  for (int i = 0; i < count; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(0.5, 1.5);
    float twinkle = 150 + 105 * sin(frameCount * 0.05 + i);
    fill(255, twinkle);
    circle(x, y, size);
  }
}

void drawDistantAsteroids(int count) {
  randomSeed(13579); // Consistent asteroids
  for (int i = 0; i < count; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(15, 45);
    float rotation = random(TWO_PI);
    float speed = random(0.1, 0.3);
    
    pushMatrix();
    translate(x, y);
    rotate(rotation + frameCount * speed * 0.01);
    
    // Main asteroid body
    noStroke();
    fill(90, 80, 70);
    beginShape();
    for (int j = 0; j < 12; j++) {
      float angle = TWO_PI * j/12;
      float r = size * 0.5 * (0.8 + random(0.4));
      vertex(r * cos(angle), r * sin(angle));
    }
    endShape(CLOSE);
    
    // Surface craters
    fill(70, 60, 50);
    for (int k = 0; k < 5; k++) {
      float a = random(TWO_PI);
      float r = random(size * 0.2, size * 0.4);
      circle(cos(a)*r, sin(a)*r, random(3, size*0.15));
    }
   popMatrix();
  }
}

void drawSurvivalCounter() {
  textFont(survivalFont); // Use our big font
  textAlign(LEFT, TOP);
  fill(255, 255, 255, 100);
  text("Score: " + (scoreLocked ? finalScore : survivalTime), 20, 20);
}








void gameClicks(){
}
