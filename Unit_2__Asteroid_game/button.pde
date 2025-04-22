class button{
  
  
//intances variables
int x,y,w,h;
boolean clicked;
color highlight, normal;
String text;


//constructor
button(String t, int _x, int _y, int _w, int _h, color norm, color high){
x = _x;
y = _y;
w = _w;
h = _h;
text = t;
normal = norm;
highlight = high;
clicked = false;
 }


//behaviour functions
void show (){ 
  //rectangle
rectMode(CENTER);
if(mouseX > x-w/2 && mouseX < x+ w/2 && mouseY > y-h/2 && mouseY < y+h/2){
fill(highlight);
} else{
fill(normal);
}
strokeWeight(4);
rect(x,y,w,h,30);

//text label
textAlign(CENTER,CENTER);
if(mouseX > x-w/2 && mouseX < x+ w/2 && mouseY > y-h/2 && mouseY < y+h/2){
fill(normal);
} else {
fill(highlight);
}

textSize(w/4);
text(text,x,y);
 
 if (mouseReleased && mouseX > x-w/2 && mouseX < x+ w/2 && mouseY > y-h/2 && mouseY < y+h/2){ // add mouseRekleased
 clicked = true;
 } else {
 clicked = false;
 }



}
}
