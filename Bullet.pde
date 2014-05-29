public class Bullet{
  private int x, y;
  private int step, maxX, minX;
  private boolean right, dead;
  
  public Bullet(int x, int y, int range, boolean right){
    this.x = x;
    this.y = y;
    this.maxX = x + range;
    this.minX = x - range;
    this.right = right;
    this.step = 5;
    this.dead = false;
  }
  
  public boolean dead(){
    return dead;
  }
  

  void draw(){
    line(x,y,x+7,y);
    move();
  }
  
  public void move(){
    if(right){
      if(x < maxX){
        this.x += step;
      }else{
        dead = true;
      }
    }else{
      if(x > minX){
        this.x -= step; 
      }else{
        dead = true;
      }
    }
  }

}
