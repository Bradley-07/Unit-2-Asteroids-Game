//void mouseReleased() {
//  if (mode == intro) {
//    introClicks();
//  } else if (mode == game) {
//    gameClicks(); // add the if unmatch then its gameover
//  }else if (mode==pause){
//  pauseClicks();
//  } else if (mode == gameover) {
//    gameoverClicks();
//  } 
//}



void keyPressed(){
if (keyCode == UP) upkey = true;
if (keyCode == DOWN) downkey = true;
if (keyCode == RIGHT) rightkey = true;
if (keyCode == LEFT) leftkey = true;

//if (keyCode == 'W') upkey = true;
//if (keyCode == 'S') downkey = true;
//if (keyCode == 'D') rightkey = true;
//if (keyCode == 'A') leftkey = true;
}

void keyReleased(){
if (keyCode == UP) upkey = false;
if (keyCode == DOWN) downkey = false;
if (keyCode == RIGHT) rightkey = false;
if (keyCode == LEFT) leftkey = false;

//if (keyCode == 'W') upkey = false;
//if (keyCode == 'S') downkey = false;
//if (keyCode == 'D') rightkey = false;
//if (keyCode == 'A') leftkey = false;

}
