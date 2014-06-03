public class Bullet{
  private int x, y;
  private int step, maxX, minX;
  private boolean right, dead;
  private int gun;
  
  public Bullet(int x, int y, int range, boolean right, int gun){
    this.x = x;
    this.y = y;
    this.maxX = x + range;
    this.minX = x - range;
    this.right = right;
    this.step = 5;
    this.dead = false;
    this.gun = gun;
  }
  
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  
  public boolean dead(){
    return dead;
  }
  public void setDead(boolean b){
    dead = b;
  }
  public void setGun(int i){
    gun = i;
  }

  void draw(){
    if(gun == 1){ 
      line(x,y,x+7,y);
    }else if (gun == 2){
      rect(x-5,y-5,15,10);
    }
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
