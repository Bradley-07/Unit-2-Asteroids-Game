int gameOverStartFrame = 0;
int redAlpha = 0;
button restartButton;


void gameover() {
  
 
  
  int elapsed = frameCount - gameOverStartFrame;

  // Fade in over 2 seconds
  if (elapsed < 120) {
    redAlpha = int(map(elapsed, 0, 1200, 0, 200));  // max alpha toned down
  } else {
    // Flicker between 140–180 alpha once faded in
    redAlpha = 160 + int(20 * sin(frameCount * 0.1));
  }

  // Use a dark burgundy color (deep red with a hint of purple)
  color burgundy = color(90, 0, 30, redAlpha);  // R,G,B,A
  noStroke();
  fill(burgundy);
  rect(0, 0, width, height);

  if (elapsed > 60) {
    textAlign(CENTER, CENTER);
    //textFont(titleFont);
    fill(255);
    textSize(100);
    text("GAME OVER", width / 2, height / 2 - 40);

    //textFont(scoreFont);
    textSize(48);
    text("Final Score: " + finalScore, width / 2, height / 2 + 70);



} if (elapsed > 120) {
    // Button properties
    int btnW = 300;
    int btnH = 80;
    int btnX = width/2 - btnW/2;
    int btnY = height - btnH - 40;

    // Check if mouse is hovering
    boolean isHovering = mouseX > btnX && mouseX < btnX + btnW &&
                         mouseY > btnY && mouseY < btnY + btnH;

    // Draw hover effect
    if (isHovering) {
      fill(#401017);  // Light grey when hovering
    } else {
      fill(255);  // White when not
    }

    // Draw button
    stroke(255);
    strokeWeight(5);
    rect(btnX, btnY, btnW, btnH, 20);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(36);
    text("RESTART", width/2, btnY + btnH/2);

    // On mouse release *after* hover
    if (mousePressed && isHovering) {
      mode = intro;
   
    }
  }


}
