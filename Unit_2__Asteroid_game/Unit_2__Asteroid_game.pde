import java.util.ArrayList;
import gifAnimation.*;

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
color red = #c1121f;

//button and mouse
boolean mouseReleased;
boolean wasPressed;
button[] myButton;

//asteroids

//keyboard
boolean upkey, downkey,rightkey,leftkey,mkey;

//game object
spaceship player1;

//bullet
ArrayList<gameObject> objects;

PImage ship;
PImage background;
Gif ufo;


void setup(){
size(1920,1080);
background(black);

 ufo = new Gif(this, "ufo.gif");
 ufo.play();
mode = game;
//objects
objects = new ArrayList();

//gameobjects
player1 = new spaceship();
objects.add(player1);

for(int i =0;i<4;i++){
objects.add(new asteroids());
}

//button
  myButton = new button[1];

//spaceship
ship = loadImage("ship2.png");

background = loadImage("background2.jpg");
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
