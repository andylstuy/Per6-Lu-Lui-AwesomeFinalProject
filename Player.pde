public class Player{
  private int x, y;
  private int step, floor, atk, health;
  private ArrayList<Bullet> b;
  private boolean right;
  private ArrayList<Platform> platforms, possible;
  private PImage img;
  
  public Player(){
    x = 70;
    y = 640;
    step = 10;
    floor = 640;
    atk = 1;
    health = 3;
    b = new ArrayList<Bullet>();
    platforms = new ArrayList<Platform>();
    possible = new ArrayList<Platform>();
  }
  public ArrayList<Bullet> bullets(){
    return b;
  }
  
  public void addPlatform(Platform p){
    platforms.add(p);
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
  public void damaged(int d){
    health-= d;
  }
  public int getHealth(){
    return health;
  }
  
  public void returnToStart(){
    x = 70;
    y = 640;
  }
  
  public void right(){
    right = true;
    if(x < 1450)
    x+= step;
    fall();
  }
  public void left(){
    right = false;
    if (x > 60)
    x-= step;
    fall();
  }
  public void up(){
    if( y > 30)
    y-= step*10;
    fall();
  }
  public void fall() {
    loadPixels();
    for (int x = getX()-10; x < getX()+10; x++) {
       for (int y = getY(); y < 640; y++) { 
         if (pixels[x+y*width] == color(255,255,255))
         setFloor(640);
       }
    }
  }
  
  public void down(){
    if(y < floor ){
      y += 5;
    }
  }
  
  public void setFloor(int f){
    this.floor = f;
  }
  
    public int getFloor() {
       return floor; 
    }
  
  public void shoot(int gun){
    if(right){
      b.add(new Bullet(x+13,y,250,right,gun));
    }else{
      b.add(new Bullet(x-16,y,250,right,gun));
    }  
  }
  
  public void drawAndIdentifyPlatforms() {
    for(int i = 0; i < platforms.size(); i++){
    Platform pl = platforms.get(i);
    pl.draw();
    if(getX() < pl.maxX() && 
       getX() > pl.minX() && 
       getY() < pl.y()){
      possible.add(pl);
      }
    }
    int i = 0;
    int smallest = 640;
    while(i < possible.size()){
      if(possible.get(i).y() < smallest){
        smallest = possible.get(i).y();
      }
      i++;
    }
    setFloor(smallest);
    fall();
  }
  
  void draw(){
    ellipse(x,y,20,20);
    for(int i = 0; i < b.size(); i++){
        b.get(i).draw();
        if(b.get(i).dead()){
          b.remove(i);
        }   
    }
    drawAndIdentifyPlatforms();
  }

}
