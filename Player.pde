public class Player{
  private int x, y;
  private int step, floor;
  private PImage img;
  
  public Player(){
    x = 70;
    y = 640;
    step = 10;
    floor = 640;
  }
  
  public void right(){
    if(x < 1450)
    x+= step;
  }
  public void left(){
    if (x > 60)
    x-= step;
  }
  public void up(){
    if( y > 30)
    y-= step;
  }
  public void down(){
    if(y < floor){
      y += step/2;
    }
  }
  public void setFloor(int f){
    floor = f;
  }
  
  void draw(){
    ellipse(x,y,20,20);
  }

}
