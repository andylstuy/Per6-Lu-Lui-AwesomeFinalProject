public class Player{
  private int x, y;
  private int step, floor, atk, health;
  private ArrayList<Bullet> b;
  private boolean right;
  private ArrayList<Platform> platforms, possible;
  private ArrayList<Wall> walls;
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
    walls = new ArrayList<Wall>();
  }
  
  public ArrayList<Bullet> bullets(){
    return b;
  }
  
  //Walls 
  public ArrayList<Wall> walls(){
    return walls;
  }
  public void addWall(Wall w){
    walls.add(w);
  }
  
  public void Wall(){
    for(int i = 0; i < walls.size(); i++){
      if(x+10 > walls.get(i).getX() && 
         x-10 < walls.get(i).getX()+walls.get(i).getW() &&
         y < walls.get(i).getY() + walls.get(i).getH() &&
         y > walls.get(i).getY()){
           if(right == true){
             left();
           }else{
             right();
           }
      }
      walls.get(i).draw();
      for(int j = 0; j < b.size(); j++){
        Bullet bull = b.get(j);
        if(bull.getX()+10 > walls.get(i).getX() && 
         bull.getX()-10 < walls.get(i).getX()+walls.get(i).getW() &&
         bull.getY() < walls.get(i).getY() + walls.get(i).getH() &&
         bull.getY() > walls.get(i).getY()){
           b.remove(j);
        }
      }
    }
  }
  
  //Platforms
  public ArrayList<Platform> platforms(){
    return platforms;
  }
  
  public void addPlatform(Platform p){
    platforms.add(p);
  }
  
  public void fall(){
    loadPixels();
    for (int x = getX()-10; x < getX()+10; x++) {
       for (int y = getY(); y < 640; y++) { 
         if (pixels[x+y*width] == color(0,255,0))
         setFloor(640);
       }
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
    if(x < 1490)
    x+= step;
    fall();
  }
  public void left(){
    right = false;
    if (x > 10)
    x-= step;
    fall();
  }
  public void up(){
    if( y > 100)
    y-= step*9;
    fall();
  }
  
  
  public void down(){
    if(y < floor ){
      y += 5;
    }
  }
  
  public void drop(){
    if(y < 640){
      y+= 10;
    }
  }
  
  public void setFloor(int f){
    this.floor = f;
  }
  
  public int getFloor() {
    return floor; 
  }
  
  public void setHealth(int h){
    this.health= h;
  }
  
  public void shoot(int gun){
    //if (b.size() < 4) {
    if(right){
      b.add(new Bullet(x+13,y,250,right,gun,color(0,255,0)));
    }else{
      b.add(new Bullet(x-16,y,250,right,gun,color(0,255,0)));
    }  
    //}
    //else b.remove(b.size()-1);
  }
  
  
  
  
  
  void draw(){
    fill(0,255,0);
    ellipse(x,y,20,20);
    fill(255);
    for(int i = 0; i < b.size(); i++){
        b.get(i).draw();
        if(b.get(i).dead()){
          b.remove(i);
        }   
    }
    Wall();
    drawAndIdentifyPlatforms();
    
  }

}
