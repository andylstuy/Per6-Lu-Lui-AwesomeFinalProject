public class Platform{
  private int minX, maxX;
  private int y, w;
  
  public Platform(int minX, int maxX, int y){
    this.minX = minX;
    this.maxX = maxX;
    this.y = y;
    this.w = 15;
  }
  
  public int minX(){
    return minX;
  }
  
  public int maxX(){
    return maxX;
  }
  
  public int y(){
    return y - w - 2;
  }
  
  
  void draw(){
    rect(minX , y, maxX-minX, w);
  }

}
