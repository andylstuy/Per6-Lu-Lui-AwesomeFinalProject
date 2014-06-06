public class Wall{
  private int x,y;
  private int w,h;
  
  public Wall(int x, int y, int h){
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = 20;
  }
  
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }

  public int getH(){
    return h;
  }  
  public int getW(){
    return w;
  }
  
  void draw(){
    fill(255,165,0);
    rect(x,y,20,h);
    fill(255);
  }

}
