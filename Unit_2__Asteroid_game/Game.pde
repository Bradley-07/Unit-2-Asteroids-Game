

void game(){
background(black);
player1.show();
player1.act();

int i = 0;
while(i < objects.size()){
gameObject currentObject = objects.get(i);
currentObject.show();
currentObject.act();
  i++;
}



}


void gameClicks(){


}
