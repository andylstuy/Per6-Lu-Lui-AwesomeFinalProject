public class Enemy1 extends Enemy{
  protected int maxRight, maxLeft;
  protected boolean right;
  
  public Enemy1(int x, int y, int range){
    this.x = x;
    this.y = y;
    maxRight = this.x + range;
    maxLeft = this.x - range;
    if(maxLeft < 0){
      maxLeft = 0;
    }
    if (maxRight > 1500){
      maxRight = 1500;
    }
    step = 3;
    this.right = true;    
    health = 1;
    atk = 1;
    dead = false;
  }
  
  public void reverse(){
    right = !right;
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
