//your code here
Particle[] array = new Particle[50];
void setup()
{
  //your code here
  size(400,400);
  for (int i = 0; i <= array.length - 1; i++){
    array[i] = new Particle();
    array[0] = new OddballParticle();
  }
}
void draw()
{
  //your code here
  background(#0CA5F5);
  noStroke();
  fill(#055A09);
  rect(0,175,400,350);
  fill(#B4492E);
  quad(75,400,325,400,210,175,190,175);
  fill(#FFFFFF);
  triangle(190,175,55,400,75,400);
  triangle(210,175,325,400,345,400);
  
  for (int i = 0; i <= array.length - 1; i++){
  array[i].move();  
  array[i].show();
  }
  array[0].move();
  array[0].show();
}
class Particle
{
  //your code here
  double myX, myY, mySpeed, myAngle,mySize;
  int myColor;
  Particle(){
    myX = (Math.random()*20)+190;
    myY = (Math.random()*20)+399;
    myColor = 200;
    mySpeed = 5;
    myAngle = (Math.random()*256);
    mySize = 20;
  }
  //void move()
  void move(){
    myX = myX + ((Math.cos(myAngle))*mySpeed);
    myY = myY + ((Math.sin(myAngle))*mySpeed);
    if (myX >= 400|| myY >= 400 || myX <= 0 || myY <= 0){
      myX = (Math.random()*20)+190;
      myY = (Math.random()*20)+399;
    }
    mySize = mySize-1;
    if (mySize == 0){
      mySize = 20;
      myX = (Math.random()*20)+190;
      myY = (Math.random()*20)+399;
  }
  }
  
  void show(){
    fill(#DED9B5);
    ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  //your code here
  OddballParticle(){
    mySpeed = 1;
    myX = 200;
    myY = 175;
    mySize = 1;
  }
  void move(){
    myY = myY + mySpeed;
    mySize = mySize + 1;
    if (myY >= 400){
      myY = 175;
      mySize = 1;
  }
  if (mySize >= 200){
    mySize = 1;
  }
  }
  void show(){
    fill(#A7A7A7);
    rect((float)(myX-25-mySize/2),(float)myY,(float)(50+mySize),(float)(10+mySize));
  }
}
