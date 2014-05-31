public class Enemy1{
  private int health, atk;
  private int x,y;
  private int step, maxRight, maxLeft;
  private boolean right, dead;
  
  public Enemy1(int x, int y, int range){
    this.x = x;
    this.y = y;
    maxRight = this.x + range;
    maxLeft = this.x - range;
    step = 3;
    this.right = true;    
    health = 1;
    atk = 1;
    dead = false;
  }
  
  public boolean dead(){
    return dead;
  }
  public void setDead(boolean b){
    dead = b;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public int attack(){
    return atk;
  }
  void draw(){
    rect(x,y,20,20);
    if(x < maxRight && right){
      x+= step;
    }else if(x > maxLeft){
      right = false;
      x-= step;
    }else{
      right = true;
    }
    if(health <= 0){
      dead = true;
    }
  }

}
