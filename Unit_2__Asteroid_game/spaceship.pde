


class spaceship extends gameObject{

//instant variables
//PVector loc; //location
//PVector vel;  //velocity
PVector dir;  //direction
int cooldown;






//constructor
spaceship(){
super(width/2, height/2,0,0);
dir = new PVector (0.025,0);
cooldown = 0;

}




//behaviour functions 
void show(){
pushMatrix();
translate(loc.x,loc.y);
rotate(dir.heading());
drawShip();
popMatrix();

}

void drawShip(){
  fill(#19214B);
  stroke(255);
strokeWeight(2);
scale(1);
   
  beginShape();
  vertex(24, 0);       // Sharp nose
  vertex(10, -8);      
  vertex(5, -6);       
  vertex(-10, -20);    // Aggressive top wing
  vertex(-12, -10);    
  vertex(-18, -6);     // Rear side point
  vertex(-16, 0);      // Back middle
  vertex(-18, 6);      // Rear side point
  vertex(-12, 10);     
  vertex(-10, 20);     // Aggressive bottom wing
  vertex(5, 6);        
  vertex(10, 8);       
  endShape(CLOSE);

  // === Pyramid Cockpit ===
  fill(0, 255, 255);
  stroke(0, 200, 255);
  strokeWeight(1.5);
  beginShape();
  vertex(11, 0);     // Tip
  vertex(2, -6);     // Back top
  vertex(2, 6);      // Back bottom
  endShape(CLOSE);

  // === Side Guns ===
  fill(255);
  stroke(200);
  strokeWeight(1);

  // Top gun
 beginShape();
  vertex(-5, -18);   // back base (near wing)
  vertex(10, -18);   // front tip
  vertex(15, -14);   // front bottom
  vertex(-5, -14);   // back bottom
  endShape(CLOSE);

  // Bottom gun
  beginShape();
  vertex(-5, 18);    // back base (near wing)
  vertex(10, 18);    // front tip
  vertex(15, 14);    // front top
  vertex(-5, 14);    // back top
  endShape(CLOSE);
  
      if (upkey) {
    // Flame when thrusting
    stroke(255, 100, 0);
    fill(255, 150, 0, 180);
    triangle(-22, -4, -32, 0, -22, 4);
}
  
}



void act(){
move();
shoot();
CollisionCheck();
wrapAround();
}


void move(){
 loc.add(vel);
if(upkey) vel.add(dir);
if(downkey) vel.add(dir.copy().mult(-1));  
if (leftkey) dir.rotate(-radians(1.5));
if (rightkey) dir.rotate(radians(1.5));


}  




void shoot(){
  cooldown--;
if(mkey && cooldown <=0){
  objects.add(new bullet());
  cooldown = 30;
}
}


void CollisionCheck(){


}





}
