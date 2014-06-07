public class Enemy2 extends Enemy1{
  private int a;
  
  public Enemy2(int x, int y, int range){
    super(x,y,range);  
    health = 3;
    a = 20;
   
  }
  
  
  
  void draw(){
    textSize(12);
    text(health+1, x-a/4+1, y-a);
    triangle(x, y-a, x-a*sqrt(3)/2, y+a/2, x+a*sqrt(3)/2, y+a/2);
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
