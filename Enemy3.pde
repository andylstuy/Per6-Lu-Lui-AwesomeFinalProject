public class Enemy3 extends Enemy{
  protected int maxUp, maxDown;
  protected boolean up;
  
  public Enemy3(int x, int y, int range){
    this.x = x;
    this.y = y;
    maxUp = this.y - range;
    maxDown = this.y + range;
    if(maxUp < 0){
      maxUp = 0;
    }
    if (maxDown > 640){
      maxDown = 640;
    }
    step = 3;
    this.up = true;    
    health = 1;
    atk = 1;
    dead = false;
    
  }
  
  void draw(){
    rect(x,y,20,20);
    if(y < maxDown && !up){
      y+= step;
    }else if(y > maxUp){
      up = true;
      y-= step;
    }else{
      up = false;
    }
    if(health <= 0){
      dead = true;
    }
  }
  
}
