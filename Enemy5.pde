public class Enemy5 extends Enemy{
  protected int pX,pY;
  
  public Enemy5(int x, int y){
    this.x = x;
    this.y = y;
  }
  public void getPlayerLocation(int pX, int pY){
    this.pY = pY;
    this.pX = pX;
  }
  
  void draw(){
    rect(x,y,20,20);
    if(x < pX){
      x+=1;
    }else if(x > pX){
      x-=1;
    }
    if(y < pY){
      y+=1;
    }else if(y > pY){
      y-=1;
    }
  }
}
