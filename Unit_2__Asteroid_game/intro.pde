void intro() {
  background(5, 5, 15); // dark space base

  // --------- Stars -----------
  noStroke();
  fill(255);
  for (int i = 0; i < 100; i++) {
    // twinkle stars by varying alpha with noise & frameCount
    float x = random(width);
    float y = random(height);
    float alpha = 150 + 105 * sin(frameCount * 0.05 + x + y);
    fill(255, alpha);
    ellipse(x, y, 2, 2);
  }

  // --------- Planets -----------
  drawPlanet(width * 0.25 + 30 * sin(frameCount * 0.01), height * 0.3, 70, color(200, 100, 150));
  drawPlanet(width * 0.75 + 20 * cos(frameCount * 0.008), height * 0.6, 100, color(100, 150, 220));

  // --------- Rockets flying -----------
  drawRocket((frameCount * 6) % (width + 100) - 100, height * 0.4);
  drawRocket((frameCount * 4 + 300) % (width + 100) - 100, height * 0.7);

  // --------- Floating asteroids -----------
  noStroke();
  fill(180, 160, 140, 180);
  for (int i = 0; i < 20; i++) {
    float x = (width / 20) * i + 50 * cos(frameCount * 0.01 + i);
    float y = (height / 20) * i + 30 * sin(frameCount * 0.015 + i * 1.2);
    ellipse(x, y, 20, 15);
  }

  // --------- Title text -----------
  textSize(96);
  textAlign(CENTER, CENTER);
  fill(255, 215, 100);
  stroke(255, 180, 50);
  strokeWeight(3);
  text("ASTEROIDS GAME", width / 2, height / 2 - 180);
  noStroke();

  // --------- START Button -----------
  int btnWidth = 400;
  int btnHeight = 150;
  int btnX = width / 2 - btnWidth / 2;
  int btnY = height / 2 + 40;

  boolean hover = mouseX > btnX && mouseX < btnX + btnWidth &&
                  mouseY > btnY && mouseY < btnY + btnHeight;

  if (hover) {
    fill(255, 220, 100, 200);
  } else {
    fill(#D3BE77,150);
  }
  stroke(255, 140, 30);
  strokeWeight(3);
  rect(btnX, btnY, btnWidth, btnHeight, 20);

  fill(10, 5, 20);
  noStroke();
  textSize(64);
  text("START", width / 2, btnY + btnHeight / 2);

  rectMode(CORNER);

  // Start game on mouse press inside button
  if (mousePressed && hover) {
    mode = game;
  }
}

// Draw a simple colored planet with a subtle gradient
void drawPlanet(float x, float y, float diameter, color c) {
  noStroke();
  for (int i = 0; i < diameter/2; i++) {
    float inter = map(i, 0, diameter/2, 1, 0);
    fill(
      red(c) * inter, 
      green(c) * inter, 
      blue(c) * inter, 
      200 * inter
    );
    ellipse(x, y, diameter - i*2, diameter - i*2);
  }
}

// Draw a rocket with flame trailing behind
void drawRocket(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(0.7);
  
  // Rocket body
  fill(180);
  stroke(120);
  strokeWeight(2);
  ellipse(0, 0, 40, 20);
  triangle(-20, 0, -10, -10, -10, 10); // nose cone
  
  // Flames flicker
  noStroke();
  fill(255, random(150, 255), 0);
  beginShape();
  vertex(-20, 0);
  vertex(-30 - random(5), -5);
  vertex(-30 - random(5), 5);
  endShape(CLOSE);
  
  popMatrix();
}
