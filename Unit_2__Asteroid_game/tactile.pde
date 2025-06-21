void win() {
  background(10, 5, 20); // Deep space color
  
  player1.show();
  player1.act(); 
  
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
  
  
//   textSize(100);
//  textAlign(CENTER, CENTER);
//  fill(white);
  
//  text("Restart", width/2, height/2-200);
//stroke(255);
//myButton[1] = new button("RESTART", width/2,height/2+100,400,200,white,black);
//myButton[1].show();

//click();
//if(myButton[1].clicked){
//mode = intro;
//rectMode(CORNER);
//}
}
