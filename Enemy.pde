public class Enemy{
  protected int health, atk;
  protected int x,y;
  protected int step;
  protected boolean dead;
  
  public void damaged(int d){
    if(health <= 0){
      dead = true;
    }else{
      health -= d; 
    }  
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
    /*rect(x,y,20,20);
    if(health <= 0){
      dead = true;
    }*/
  }
  
}
