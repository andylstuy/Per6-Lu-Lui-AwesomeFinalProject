public class Player{
  private int x, y;
  private int step, floor, atk, health;
  private ArrayList<Bullet> b;
  private boolean right;
  private ArrayList<Platform> platforms, possible, antiplats;
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
    antiplats = new ArrayList<Platform>();
  }
  public ArrayList<Bullet> bullets(){
    return b;
  }
  
  public void addPlatform(Platform p){
    platforms.add(p);
    antiplats.add(new Platform(0,p.minX(),p.y()));
    antiplats.add(new Platform(p.maxX(),1500,p.y()));
    
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
  }
  public void left(){
    right = false;
    if (x > 60)
    x-= step;    
  }
  public void up(){
    if( y > 30)
    y-= step*10;
  }
  
  
  public void down(){
    if(y < floor ){
      y += 5;
    }
  }
  
  public void setFloor(int f){
    this.floor = f;
  }
  
  public void shoot(int gun){
    if(right){
      b.add(new Bullet(x+13,y,250,right,gun));
    }else{
      b.add(new Bullet(x-16,y,250,right,gun));
    }  
  }
  
  void draw(){
    /*for(int index = 0; index < antiplats.size(); index++){
      Platform pl = antiplats.get(index);
      if(getX() < pl.maxX() && getX() > pl.minX() && getY() < pl.y()){
        setFloor(640);
      }
    }*/
    
    ellipse(x,y,20,20);
    for(int i = 0; i < b.size(); i++){
        b.get(i).draw();
        if(b.get(i).dead()){
          b.remove(i);
        }   
    }
  
    
    for(int i = 0; i < platforms.size(); i++){
    Platform pl = platforms.get(i);
    pl.draw();
    if(i >= platforms.size()){
      setFloor(640);
    }else if(getX() < pl.maxX() && getX() > pl.minX() && getY() < pl.y()){
      
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
    
    
    
  }

}
