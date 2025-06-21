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

  textSize(100);
  textAlign(CENTER, CENTER);
  fill(white);
  
//  text("Restart", width/2, height/2-200);
//stroke(255);
//myButton[2] = new button("RESTART", width/2,height/2+100,400,200,white,black);
//myButton[2].show();

//click();
//if(myButton[2].clicked){
//mode = intro;
//rectMode(CORNER);
//}

 }  
    
}
