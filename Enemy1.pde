public class Enemy1{
  private int health, attack;
  private int x,y;
  private int step, maxRight, maxLeft;
  private boolean right;
  
  public Enemy1(int x, int y, int range){
    this.x = x;
    this.y = y;
    maxRight = this.x + range;
    maxLeft = this.x - range;
    step = 3;
    this.right = true;    
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
  }

}
