int x = 50;
int y = 50;
int size = 10;
int speed = 10;
int level = 1;
int objects = ((int)((Math.random()*(5*level))));
ArrayList xVals = new ArrayList();
ArrayList xValSi = new ArrayList();
ArrayList yVals = new ArrayList();
ArrayList yValSi = new ArrayList();
ArrayList oldX = new ArrayList();
ArrayList oldY = new ArrayList();
ArrayList goalX = new ArrayList();
ArrayList goalY = new ArrayList();


boolean isBlack(int x, int y) {
  color c = get(x, y);
  return (red(c) == 0 && green(c) == 0 && blue(c) == 0);
}

void setup() {
  size(400, 400);
  objects = ((int)((Math.random()*(5*level))));
  
  for (int i = 0; i < objects*2; i++){
    int ranXVal=((int)((Math.random()*40)+1)*10);
    int ranYVal=((int)((Math.random()*40)+1)*10);
    while(ranXVal==x&&ranYVal==y){
      ranXVal=((int)((Math.random()*40)+1)*10);
      ranYVal=((int)((Math.random()*40)+1)*10);
    }
    xVals.add(ranXVal);
    xValSi.add(((int)((Math.random()*(10*level))+1)*10));
    yVals.add(ranYVal);
    yValSi.add(((int)((Math.random()*(10*level))+1)*10));

  }
  
    for (int i = 0; i < objects; i++){
    rect((int)xVals.get(i), (int)yVals.get(i), (int)xValSi.get(i), (int)yValSi.get(i));
  }
  
    for (int i = 0; i < level; i++){
    int ranY = ((int)(Math.random()*90)+1)*10;
     int ranX = ((int)(Math.random()*90)+1)*10;
     while (isBlack(ranX+5,ranY+5)){
        ranY = ((int)(Math.random()*90)+1)*10;
      ranX = ((int)(Math.random()*90)+1)*10;
     }
    goalX.add(ranX);
    goalY.add(ranY);
  }
   
     while (isBlack(x+5,y+5)){
        y = ((int)(Math.random()*90)+1)*10;
      x = ((int)(Math.random()*90)+1)*10;
     }

  



}

void draw() {
  
background(255);

fill(0,255,0); 
textSize(32);
text("Level: " + level, width/2 - textWidth("Level: " + level)/2,30); 

fill(0,200,0);

rect(x,y,size,size);

fill(0);

for(int i=0;i<objects;i++){
rect((int)xVals.get(i),(int)yVals.get(i),(int)xValSi.get(i),(int)yValSi.get(i));

}

for(int i=0;i<oldX.size();i++){
rect((int)oldX.get(i),(int)oldY.get(i),10,10);

}

fill(255,255,0); 

for(int i=0;i<goalX.size();i++){
rect((int)goalX.get(i),(int)goalY.get(i),10,10);

}

}

void keyPressed(){
if(key==CODED){
if(keyCode==UP&&y>0&&(isBlack(x+5,y-5))!=true){
oldX.add(x);
oldY.add(y);
y-=10;

}else if(keyCode==DOWN&&y<height-size&&(isBlack(x+5,y+15))!=true){
oldX.add(x);
oldY.add(y);
y+=10;

}else if(keyCode==LEFT&&x>0&&(isBlack(x-5,y+5))!=true){
oldX.add(x);
oldY.add(y);
x-=10;

}else if(keyCode==RIGHT&&x<width-size&&(isBlack(x+15,y+5))!=true){
oldX.add(x);
oldY.add(y);
x+=10;

}
}

for(int i=goalX.size()-1;i>=0;i--){
if(x==((int)goalX.get(i))&&y==((int)goalY.get(i))){
goalX.remove(i);
goalY.remove(i);

}
}
if(goalX.size()==0){
setup();
level++;
}
}
