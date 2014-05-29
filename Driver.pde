private Player p;
private ArrayList<Enemy1> enemies;
private ArrayList<Platform> platforms;

void setup(){
   size(1500,700);
   background(255,255,255);
   frameRate(60);
   p = new Player();
   enemies = new ArrayList<Enemy1>(); 
   enemies.add(new Enemy1(625,625,100)); 
   enemies.add(new Enemy1(500,305,100));
   enemies.add(new Enemy1(95,525,70));
   
   platforms = new ArrayList<Platform>();
   platforms.add(new Platform(400,700,600));
   platforms.add(new Platform(300,700,330));
   platforms.add(new Platform(700,1000,400));
   platforms.add(new Platform(400,1100,200));
}
  
void draw() {
  background(0,100,190);
  //line(0,650,1500,650); 
  rect(0,650,1500,10); 
   
  p.draw();
  
  for(Enemy1 e : enemies){
    e.draw();
  }
  for(int i = 0; i < platforms.size(); i++){
    Platform pl = platforms.get(i);
    pl.draw();
    if(p.getX() < pl.maxX() && p.getX() > pl.minX() && p.getY() <= pl.y()){
      p.setFloor(pl.y());
     
    }else if(i >= platforms.size()){
      p.setFloor(640);
    }
  }
  p.down();
  
  
  
}

void keyPressed() {
  if(key == 'a'){
    p.left();
  }
  if (key == 'w'){
    p.up();
  }
  if(key == 'd'){
    p.right();
  }
  if(key == 'q'){
    p.left();
    p.up();
  }
  if(key == 'e'){
    p.right();
    p.up();
  }
  if (key == 'j'){
    p.shoot();
  }
}
