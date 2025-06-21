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
if (key == 'm' || key == 'M') mkey = true;
if (key == 'n' || key == 'n') nkey = true;
if (key == 'B' || key == 'b') bkey = true;
if (keyCode == BACKSPACE) spacekey = true;

if (keyCode == 'W' || key == 'w') upkey = true;
if (keyCode == 'S' || key == 's') downkey = true;
if (keyCode == 'D' || key == 'd') rightkey = true;
if (keyCode == 'A' || key == 'a') leftkey = true;
if (keyCode == 'R' || key == 'r') rkey = true;
}

void keyReleased(){
if (keyCode == UP) upkey = false;
if (keyCode == DOWN) downkey = false;
if (keyCode == RIGHT) rightkey = false;
if (keyCode == LEFT) leftkey = false;
//if (keyCode == DOWN) downkey = false;
if (key == 'm' || key == 'M') mkey = false;
if (key == 'B' || key == 'b') bkey = false;
if (keyCode == BACKSPACE) spacekey = false;

if (keyCode == 'W' || key == 'w') upkey = false;
if (keyCode == 'S' || key == 's') downkey = false;
if (keyCode == 'D' || key == 'd') rightkey = false;
if (keyCode == 'A' || key == 'a') leftkey = false;
if (key == 'n' || key == 'n') nkey = false;
if (keyCode == 'R' || key == 'r') rkey = false;

}
