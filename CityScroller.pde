
flag f = new flag(500,200);
Circle [] c = {};
Alien ally = new Alien();
Pfont font = loadFont("FFscala.ttf");
sideWaysBear berry = new sideWaysBear();
int counter = 0;

void draw(){
    background(0,0,0);
    fill( 238, 232, 170);
    rect( 0, 500, 1000, 300);
    for ( int i = 0; i < holeList.length; i++ ){
      holeList[i].drawDunehole();
      holeList2[i].drawDunehole();
    }
    move();
    volcano.drawVolcano();
    volcano.loc++;
    if(volcano.loc == 1200)
    {
      volcano.loc = 0;
    }
    berry.drawSidewaysBear();
    berry.moveBear();
    earth.drawEarth();
    sun.drawSun();
    for(int i = 0; i < outerSpaceStuff.length; i++){
      outerSpaceStuff[i].drawStar();
    }
    for(int i = 0; i < arrHoney.length; i++){
    arrHoney[i].drawHoney();
    if(berry.centerX+37.5==arrHoney[i].locX-25)
      counter++;
    else if(berry.centerX-31.75==arrHoney[i].locX+25)
      counter++;
    }
    moveSpace();
    moveHoney();
    f.drawFlag();
    f.moveFlag();
    f.boundary();
    for(int i = 0; i<c.length; i++){
        c[i].drawCircle();
        c[i].moveCircle();
    }
    for(int i = 0; i < alienArmy.length; i++){
    alienArmy[i].drawAlien();
    }
    moveAliens();
    fill(255,255,255);
    textFont(font);
    text("Score: " + counter, 950,20,40,40); 
   
   };
  void move(){
    int speed = 1;
    for ( int i = 0; i < holeList.length; i++ ){
      if(!keyPressed){
        speed=0;
      }
      holeList[i].centerX = holeList[i].centerX - speed;
      holeList2[i].centerX = holeList2[i].centerX - speed;
      if ( holeList[i].centerX < -150 ){
        holeList[i].centerX = 1100;
      }
      if ( holeList2[i].centerX < -150 ){
        holeList2[i].centerX = 1100;
      }
    }
  }
  void moveSpace(){
    earth.centerX = earth.centerX -0.5;
    sun.centerX = sun.centerX-0.5;
     for(int i = 0; i < outerSpaceStuff.length; i++){
      outerSpaceStuff[i].centerX = outerSpaceStuff[i].centerX - 0.5;
     }
      
   if ( earth.centerX <-50){
              earth.centerX = 1050;
   }
   if ( sun.centerX < -50 ){
              sun.centerX = 1050;
   }
   for(int i = 0; i < outerSpaceStuff.length; i++){
      if(outerSpaceStuff[i].centerX< -50)
      {
        outerSpaceStuff[i].centerX = 1050;
     }
  }
}
void moveAliens(){
   for(int i = 0; i < alienArmy.length; i++){
    alienArmy[i].centerX = alienArmy[i].centerX - alienArmy[i].speed;
   }
    
   for(int i = 0; i < alienArmy.length; i++){
    if(alienArmy[i].centerX< -50)
    {
      alienArmy[i].centerX = 1050;
   }
  }
}
void moveHoney(){
   for(int i = 0; i < arrHoney.length; i++){
    arrHoney[i].locX = arrHoney[i].locX - arrHoney[i].speed;
   }
    
   for(int i = 0; i < arrHoney.length; i++){
    if(arrHoney[i].locX< -50)
    {
     arrHoney[i].locX =(int) Math.floor(Math.random()*10000)+1000;
   }
  }
}

class flag{
  int speed =1;
  //ints for flag pole
  int lposX1;
  int lposY1;
  int lposX2;
  int lposY2;
  //ints for flag
  int fposX;
  int fposY;
  int width=200;
  int height=100;
  //int for stripes
  int stripeHeight=16;
  //constructor
  flag(int flagX, int flagY){
    fposX=flagX;
    lposX1=flagX;
    lposX2=flagX;
    fposY=flagY;
    lposY1=flagY+100;
    lposY2=500;
    
  }
  void drawFlag(){
    stroke(131,121,121);
    line(lposX1,lposY1,lposX2,500);
    //flag base
    fill(255,255,255);
    rect(fposX,fposY,width, height);
    //blue rectangle
    fill(4,25,216);
    rect(fposX,fposY,width/2.5,height/2);
    //red stripes
    for(int i = 0; i<5; i+=2){
      fill(226,1,1);
      rect(fposX+width/2.5,fposY+(stripeHeight*i),width-width/2.5,stripeHeight);
      if(i==4){
      fill(226,1,1);
      rect(fposX,fposY+(stripeHeight*i),width,stripeHeight);
      }
    }
    
    
  };
  void moveFlag(){
    if(!keyPressed){
      speed=0;
    }
    else if(keyPressed){
      speed=1;
    }
    lposX1-=speed;
    lposX2-=speed;
    fposX-=speed;
  }
  void boundary(){
    if((fposX+width)<=1){
      fposX=1000;
      lposX1=1000;
      lposX2=1000;
    }
  };
    
}


int heightScreen = 750;
int widthScreen = 1000;
Dunehole hole0 = new Dunehole( 0, 700 );
Dunehole hole1 = new Dunehole( 250, 700 );
Dunehole hole2 = new Dunehole( 500, 700 );
Dunehole hole3 = new Dunehole( 750, 700 );
Dunehole hole4 = new Dunehole( 1000, 700 );
var holeList = { hole0, hole1, hole2, hole3, hole4 };

Dunehole hole5 = new Dunehole( 125, 625 );
Dunehole hole6 = new Dunehole( 375, 625 );
Dunehole hole7 = new Dunehole( 625, 625 );
Dunehole hole8 = new Dunehole( 875, 625 );
Dunehole hole9 = new Dunehole( 1125, 625 );
var holeList2 = { hole5, hole6, hole7, hole8, hole9 };


class Dunehole{
    int centerX;
    int centerY;
    
    Dunehole( int x, int y ){
      centerX = x;
      centerY = y;
    }

    void drawDunehole(){
      noStroke();
      fill( 189, 183, 107 );
      int temp = centerY;
      while ( temp > 500 ){
        ellipse( centerX, temp, 100, 50 );
        temp = temp - 150;
      }
      
    }
}

var volcano = new Volcano(1);
class Volcano
{
  int loc;
  int ellX = 1100;
  int ellY = 500;
  int ellW = 150;
  int ellH = 75;
  Volcano()
  {
    size = s;
    loc = 0;
  }
   void drawVolcano()
  {
 
    fill(252, 13, 29);
    ellipse(ellX-loc, ellY, ellW, ellH);
    fill(171, 114, 15);
    triangle(ellX-50-loc,ellY, 1150-loc, ellY,1100-loc,ellY-125);
    fill(0,0,0);
    triangle(ellX-loc,ellY-125, ellX-50-loc, ellY-95, ellX+50-loc, ellY-95);
    fill(252, 13, 29);
    ellipse(ellX-loc, ellY-125, ellW-135,ellH-60);
    ellipse(ellX-25-loc, ellY-155, ellW-125,ellH-50);
    ellipse(ellX+20-loc, ellY-185, ellW-115,ellH-40);
    noStroke();

  }
}

class OuterSpace{
  int centerX =  Math.floor(Math.random()*2000)+1000;
  int centerY = Math.floor(Math.random()*250);
  int diameter = Math.floor(Math.random()*30)+10;
 
  void drawStar(){
    fill(255, 255, 0);
    ellipse(centerX, centerY, diameter, diameter);
  }
 
  void drawSun(){
    fill(255, 140, 0);
    ellipse(centerX, centerY, 70, 70);
  }
 
  void drawEarth(){
    fill(30, 144, 255);
    ellipse(centerX, centerY, 40, 40);
  }
}

class Circle{
  int centerCX;
  int centerCY;
  int diameter = 20;
  int speed = 3;
  Circle(int x, int y){
    centerCX=x;
    centerCY=y;
  }
  void drawCircle(){
   fill(255,255,255);
   ellipse(centerCX+=speed,centerCY,diameter,diameter); // bear pos 2
  }
  void moveCircle(){
     if((centerCX-diameter/2)>=1000){
       centerCX=10;
    }
  }
 }
 
 class Alien{
  int centerX = Math.floor(Math.random()*10000)+1000;
  int centerY =Math.floor(Math.random()*600)+100;
  int sizeRatio= 1;
  int headWidth = 70* sizeRatio;
  int headHeight = 30*sizeRatio;
  int bodyHeight = 50*sizeRatio;
  int speed = Math.floor(Math.random()*5)+5;
 
  void drawAlien(){
    
    fill(144, 172, 0);
    ellipse(centerX-headWidth/3, centerY+bodyHeight, 10*sizeRatio, 25*sizeRatio);
    ellipse(centerX+headWidth/3, centerY+bodyHeight, 10*sizeRatio, 25*sizeRatio);
    ellipse(centerX+headWidth/2, centerY+headHeight, 25*sizeRatio, 10*sizeRatio);
    ellipse(centerX-headWidth/2, centerY+headHeight, 25*sizeRatio, 10*sizeRatio);
    
    fill(144, 192, 0);
    ellipse(centerX, centerY+headHeight, 60*sizeRatio, 50*sizeRatio);
    ellipse(centerX, centerY, 70*sizeRatio, 30*sizeRatio);
    
    fill(255, 255, 255);
    ellipse(centerX, centerY, 10*sizeRatio, 10*sizeRatio);
    ellipse(centerX-headWidth/3, centerY, 10*sizeRatio, 10*sizeRatio);
    ellipse(centerX+headWidth/3, centerY, 10*sizeRatio, 10*sizeRatio);
    
    fill(0, 0, 0);
    ellipse(centerX, centerY+headHeight/10, 5*sizeRatio, 5*sizeRatio);
    ellipse(centerX-headWidth/3, centerY+headHeight/10, 5*sizeRatio, 5*sizeRatio);
    ellipse(centerX+headWidth/3, centerY+headHeight/10, 5*sizeRatio, 5*sizeRatio);
  } 
}
class Honey
{
  int loc;
  int locX;
  int locY;
  int speed;
  
  Honey()
  {
  speed=Math.floor(Math.random()*5)+5;
  loc = 0;
  locX = Math.floor(Math.random()*20000)+1000;
  locY = Math.floor(Math.random()*400) + 300;
  
  }
 
  void drawHoney()
  {
  fill(250, 195, 17);
  ellipse(locX-loc,locY, 50,50);
  stroke(0,0,0);
  ellipse(locX-loc,locY-20, 50, 15);
  }
 
}
 
 class sideWaysBear{
  var centerX = 500;
  var centerY = 350;
  var sizeRatio = .5; //change me for resizing!!
  var widthHead = 90 * sizeRatio;
  var heightHead = widthHead/9 * 8;
  var earOffset = (widthHead / 9) * 5;
  var widthBody = widthHead/1.1;
  var heightBody = widthHead/9 * 11;
  var speed = 2;
  void drawSidewaysBear(){
    noStroke();
    
    //ear base
    fill( 201, 130, 59 );
    ellipse( centerX - widthHead/4, centerY - widthHead/3, widthHead/3, widthHead/3 );
    
    //darker part of ear
    fill( 155, 102, 49 );
    ellipse( centerX - widthHead/4, centerY - widthHead/3, widthHead/5, widthHead/5 );
    
    //backpack
    fill( 175, 168, 153 );
    ellipse( centerX - widthHead/2, centerY + heightHead/2 + heightBody/4, widthBody/2, heightBody/1.3 );
    
   //Left leg
    fill( 255, 145, 0 );
    triangle( centerX - widthBody/2, centerY + heightHead/3 + ( ( heightBody/ 6 ) * 5 ), centerX - heightHead/15,
      centerY + heightHead/3 + ( ( heightBody / 10 ) * 9 ), centerX - widthHead/1.4, centerY +
      heightBody * 2 - heightBody/20);
    triangle( centerX - widthBody/2.8, centerY + heightBody * 2, centerX - heightHead/15,
      centerY + heightHead/3 + ( ( heightBody / 10 ) * 9 ), centerX - widthHead/1.4, centerY +
      heightBody * 2 - heightBody/20);
      
    //Right leg
    fill( 255, 164, 44 );
    triangle( centerX + widthBody/2 - widthBody/10, centerY + heightHead/3 + ( ( heightBody/ 6 ) * 5 ), centerX
      + heightHead/15 - widthBody/10, centerY + heightHead/3 + ( ( heightBody / 10 ) * 9 ),
      centerX + widthHead/1.4 - widthBody/10, centerY + heightBody * 2 - heightBody/20);
    triangle( centerX + widthBody/2.8 - widthBody/10, centerY + heightBody * 2, centerX + heightHead/15 - widthBody/10,
      centerY + heightHead/3 + ( ( heightBody / 10 ) * 9 ), centerX + widthHead/1.4 - widthBody/10, centerY +
      heightBody * 2 - heightBody/20);
    
    //body
    fill( 255, 164, 44 );
    rect( centerX - widthHead/2, centerY + heightHead/2 - heightHead/4, widthBody, heightBody );
    
    //arm
    fill( 255, 145, 0 );
    ellipse( centerX, centerY + heightBody/1.5, heightBody/3, heightBody/2 );
    
    //hand
    fill( 201, 130, 59 );
    stroke( 155, 102, 49 );
    ellipse( centerX, centerY + heightBody/1.5 + heightBody/4, heightBody/5, heightBody/5 );
    noStroke();
    
    //helmet
    fill( 255, 255, 255 );
    ellipse( centerX, centerY, widthHead, heightHead );
    
    //snout
    fill( 202, 169, 126 );
    ellipse( centerX + widthHead * 3 / 7, centerY + widthHead/20, widthHead/3, widthHead/2.5);
    
    //face
    fill( 201, 130, 59 );
    ellipse( centerX + widthHead/8, centerY, widthHead * 3 /4, heightHead/ 8 * 7 );
    
    //nose
    fill( 0, 0, 0 );
    triangle( centerX + widthHead/2 - widthHead/20, centerY - widthHead/15, centerX + widthHead/2 + widthHead/20,
      centerY + widthHead/20, centerX + widthHead/2 + widthHead/14, centerY - widthHead/15);
    
    //eyes
    fill( 0, 0, 0 );
    ellipse( centerX + widthHead/4, centerY - widthHead/15, widthHead/9, widthHead/9);
  }
  void moveBear(){
    if(keyPressed){
      if(keyCode==UP){
        centerY-=speed;
      }
      else if(keyCode==DOWN){
        centerY+=speed;
      }
      else if(keyCode==RIGHT){
        centerX+=speed;
      }
      else if(keyCode==LEFT){
        centerX-=speed;
      }
    }
  }
}







int alienCount = Math.floor(Math.random()*2)+5;
var alienArmy = new Alien[alienCount];



var sun = new OuterSpace();
var earth = new OuterSpace();

int starNums = Math.floor(Math.random()*30)+20;
var outerSpaceStuff = new OuterSpace[starNums];

var holeList = new Dunehole[5];
var holeList2 = new Dunehole[5];
var spacing = 250;
var firstRowHeight = 700;
var secondRowHeight = 625;
var offSet = 125;


int randHoney = Math.floor(Math.random()*2) + 2;
var arrHoney = new Honey[randHoney];



void setup(){
  background(0,0,0);
  size(1000,750);  
    for(int m = 0; m < randHoney; m++)
  {
    var hon = new Honey();
    arrHoney[m]=hon;
  }


  for(int m = 0; m < starNums; m++)
  {
    var star = new OuterSpace();
    outerSpaceStuff[m]=star;
  }
  int randy = (int)(Math.random()*5)+1;
    for(int i = 0; i<randy; i++){
    c[i] = new Circle(random(10,400), 490);
}
  for(int t = 0; t < alienCount; t++)
  {
    var dave = new Alien();
    alienArmy[t]= dave;
  }

  for(int i = 0; i < holeList.length; i++ ){
    holeList[i]= new Dunehole( i * spacing, firstRowHeight );
    holeList2[i] = new Dunehole( (i * spacing) + 125, secondRowHeight );
  }


}

  
  



