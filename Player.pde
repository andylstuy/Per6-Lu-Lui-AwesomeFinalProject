public class Player{
  private int x, y;
  private int step;
  private PImage img;
  
  public Player(){
    x = 70;
    y = 600;
    step = 10;
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
    if(y < 600){
      y += step/2;
    }
  }
  
  void draw(){
    ellipse(x,y,20,20);
  }

}
