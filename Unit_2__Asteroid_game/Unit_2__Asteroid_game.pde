
int mode; 
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int pause = 3;


//color pallete
color black = #000000; 
color white = #FFFFFF;
color navy = #003049;
color green = #386641;

//button and mouse
boolean mouseReleased;
boolean wasPressed;
button[] myButton;

//asteroids

//keyboard
boolean upkey, downkey,rightkey,leftkey;

//game object
spaceship player1;

//bullet
ArrayList<bullet> bullets;


void setup(){
size(1920,1080);
background(black);

mode = intro;

player1 = new spaceship();

//button
  myButton = new button[1];

//bullet
bullets = new ArrayList();
}


void draw(){
if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameover) {
    gameover();
  } else if(mode == pause){
  pause();
  } else {
    println("Error: Mode = " + mode);
  }
}
