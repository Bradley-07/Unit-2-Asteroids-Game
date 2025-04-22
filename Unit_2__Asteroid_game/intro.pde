void intro(){
 textSize(100);
  textAlign(CENTER, CENTER);
  fill(white);
  
  text("Asteroids Game", width/2, height/2-200);
stroke(255);
myButton[0] = new button("START", width/2,height/2+100,400,200,white,black);
myButton[0].show();


}


void introClicks(){
 if (mouseX > myButton[0].x && mouseX < myButton[0].x + myButton[0].w && mouseY > myButton[0].y && mouseY < myButton[0].y+ myButton[0].h) {
    mode = game;
  }
}
