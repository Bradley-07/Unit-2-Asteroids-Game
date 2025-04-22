void intro(){
 textSize(100);
  textAlign(CENTER, CENTER);
  fill(white);
  
  text("Asteroids Game", width/2, height/2-200);
stroke(255);
myButton[0] = new button("START", width/2,height/2+100,400,200,white,black);
myButton[0].show();

click();
if(myButton[0].clicked){
mode = game;
}

}
