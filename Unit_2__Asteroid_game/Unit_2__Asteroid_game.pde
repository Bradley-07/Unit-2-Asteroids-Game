import java.util.ArrayList;
import gifAnimation.*;

int mode; 
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int pause = 3;
final int win = 4;


//color pallete
color black = #000000; 
color white = #FFFFFF;
color navy = #003049;
color green = #386641;
color red = #c1121f;
color cool;
color cool1;

//button and mouse
boolean mouseReleased;
boolean wasPressed;
button[] myButton;
boolean isPaused = false;
//asteroids

//keyboard
boolean upkey, downkey,rightkey,leftkey,mkey, nkey, spacekey, bkey, rkey;



//game object
spaceship player1;

//ufo
ufo Ufo;

//bullet
ArrayList<gameObject> objects;

ArrayList<ufo> ufos;
int nextUfoFrame = 0;

//score
int survivalTime = 0;
PFont survivalFont;
int finalScore = 0;
boolean scoreLocked = false;

PImage ship;
PImage background;
PImage ufo;
PImage asteroid;



void setup(){
fullScreen(P2D);
background(black);

//intro
 survivalFont = createFont("Arial Bold", 32); // Big easy-to-read font

mode = win;
//objects
objects = new ArrayList();
ufos = new ArrayList<ufo>();
//gameobjects
player1 = new spaceship();

objects.add(player1);


for(int i =0;i<5;i++){
objects.add(new asteroids());
}

//button
  myButton = new button[3];

//spaceship
ship = loadImage("ship2.png");

background = loadImage("background2.jpg");

ufo = loadImage("ufo.png");

asteroid = loadImage("asteroid.png");



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
  } else if (mode == win) {
    win();
  } else {
    println("Error: Mode = " + mode);
  }
}
