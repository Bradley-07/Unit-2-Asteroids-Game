void pause(){
  
   // Semi-transparent dark overlay
  fill(0, 180);
  rect(0, 0, width, height);
  
  // Draw big white play triangle (pointing right)
  float triangleSize = min(width, height) * 0.2;
  float centerX = width/2;
  float centerY = height/2 - 50; // Moved up to make space for button
  
  fill(255);
  noStroke();
  triangle(
    centerX - triangleSize/2, centerY - triangleSize,
    centerX - triangleSize/2, centerY + triangleSize, 
    centerX + triangleSize, centerY
  );

  // Continue button (below triangle)
  float buttonWidth = 200;
  float buttonHeight = 50;
  float buttonX = centerX - buttonWidth/2;
  float buttonY = centerY + triangleSize + 30;
  
  // Button styling
  boolean overButton = mouseX > buttonX && mouseX < buttonX + buttonWidth &&
                      mouseY > buttonY && mouseY < buttonY + buttonHeight;
  
  fill(overButton ? color(100, 255, 100) : color(black)); // Green button
  stroke(255);
  strokeWeight(2);
  rect(buttonX, buttonY, buttonWidth, buttonHeight, 10); // Rounded corners
  
  // Button text
  textAlign(CENTER, CENTER);
  fill(white); // Black text
  textSize(24);
  text("CONTINUE", centerX, buttonY + buttonHeight/2);
  
  // Handle button click
  if (overButton && mousePressed) {
    mode = game; // Change mode back to game
    loop(); // Ensure animation resumes
    delay(100); // Prevent instant re-pause
  }
}
  
