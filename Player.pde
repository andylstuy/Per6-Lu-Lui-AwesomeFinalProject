public class Player{
  private int x, y;
  private int step, floor;
  private Bullet b;
  private boolean right;
  private PImage img;
  
  public Player(){
    x = 70;
    y = 640;
    step = 30;
    floor = 640;
  }
  
  public void right(){
    right = true;
    if(x < 1450)
    x+= step;
  }
  public void left(){
    right = false;
    if (x > 60)
    x-= step;
  }
  public void up(){
    if( y > 30)
    y-= step;
  }
  
  
  public void down(){
    if(y < floor ){
      y += step/5;
    }
  }
  
  public void setFloor(int f){
    floor = f;
  }
  
  public void shoot(){
    if(right){
      b = new Bullet(x+13,y,150,right);
    }else{
      b = new Bullet(x-16,y,150,right);
    }  
  }
  
  void draw(){
    ellipse(x,y,20,20);
    if(b != null){
      b.draw();
      if(b.dead()){
        b = null;
      }
    }
  }

}
