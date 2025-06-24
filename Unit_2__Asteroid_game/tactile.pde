void win() {
  background(10, 5, 20); // Deep space color
  
  //player1.show();
  //player1.act(); 
  
  // Twinkling stars
  for (int i = 0; i < 300; i++) {
    float x = random(width);
    float y = random(height);
    float alpha = 150 + 105 * sin(frameCount * 0.05 + i);
    fill(255, alpha);
    noStroke();
    ellipse(x, y, random(1, 3), random(1, 3));
  }

  // Glowing text effect
  textAlign(CENTER, CENTER);
  textFont(survivalFont); // Optional custom font
  for (int i = 10; i >= 1; i--) {
    fill(0, 255, 0, 20);
    textSize(60 + i * 2);
    text("YOU WIN!", width / 2, height / 2 - 50);
  }

  // Main title
  fill(0, 255, 0);
  textSize(80);
  text("YOU WIN!", width / 2, height / 2 - 50);

  // Show score
  textSize(40);
  fill(255);
  text("Final Score: " + finalScore, width / 2, height / 2 + 40);
  
  
   textSize(100);
  textAlign(CENTER, CENTER);
  fill(white);
  

int btnW = 300;
int btnH = 80;
int btnX = width / 2 - btnW / 2;
int btnY = height - btnH - 40;

// Hover check
boolean isHovering = mouseX > btnX && mouseX < btnX + btnW &&
                     mouseY > btnY && mouseY < btnY + btnH;

// Draw button with hover effect
if (isHovering) {
  fill(#101540);  // Light grey on hover
} else {
  fill(255);  // Normal white
}
stroke(255);
    strokeWeight(5);
rect(btnX, btnY, btnW, btnH, 20);
fill(0);
textAlign(CENTER, CENTER);
textSize(36);
text("RESTART", width / 2, btnY + btnH / 2);

// Handle tactile click on release
if (mousePressed && isHovering) {
  mode = intro;
  
}

                         
                         
                         
}
