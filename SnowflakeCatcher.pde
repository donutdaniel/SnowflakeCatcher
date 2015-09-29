Snowflake[] poop = new Snowflake [100];
int h=0;
void setup()
{
  size(500,500);
  background(65,105,225);
      for(int i=0;i<100;i++) {
         poop[i]= new Snowflake();
  }
}
void draw()
{
  for(int i=0;i<100;i++) { //if reach bottom, create new snowflake
    if (poop[i].isMoving==false) {
    poop[i]= new Snowflake();
  }
    poop[i].erase();
    poop[i].lookDown();
    poop[i].move();
    poop[i].wrap();
    poop[i].show();
  }

  if (mousePressed)
    mouseDragged();

  if(keyPressed==true&&key=='e')
    background(65, 105, 225);
}
void mouseDragged()
{
  noStroke();
  fill(139,69,19);
  ellipse(mouseX,mouseY,20,20);
}

class Snowflake
{
    int x,y;
    boolean isMoving;
  Snowflake()
  {
    x=(int)(Math.random()*501);
    y=(int)(Math.random()*501)-500;
    isMoving=true;
  }
  void show()
  {
    noStroke();
    fill(225);
    ellipse(x,y,5,5);
    quad(x-7, y, x+7, y, x, y+3, x, y-3);
    quad(x, y-7, x, y+7, x+3, y, x-3, y);
  }
  void lookDown()
  {
    if((y>0&&y<500)&&(get(x,y+8)!=color(65,105,225))) {
      isMoving=false;
    } else isMoving=true;
  }
  void erase()
  {
    fill(65,105,225);
    ellipse(x,y,14,14);

  }
  void move()
  {
    if(isMoving) {
      y+=1;
    }
  }
  void wrap()
  {
    if(y==499) {
      y=0;
      x=(int)(Math.random()*501);
    }
  }
}


