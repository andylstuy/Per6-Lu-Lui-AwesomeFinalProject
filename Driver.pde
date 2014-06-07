private Player p;
private ArrayList<Enemy> enemies;
private int level, maxLevel, counter;
private boolean levEnd;

public boolean collision(Bullet bull, Enemy e){
  return abs(bull.getX() - e.getX()) < 20 && abs(bull.getY() - e.getY()) < 20;  
   
}
public boolean collision(Bullet bull, Player p){
  return abs(bull.getX() - p.getX()) < 20 && abs(bull.getY() - p.getY()) < 20;  
   
}

public boolean collision(Player p, Enemy e){
  return abs(p.getX() - e.getX()) < 20 && abs(p.getY() - e.getY()) < 20;  
}

public boolean Win(){
  return enemies.size() == 0; 
}


public void clearEnemies(){
  while(enemies.size() != 0){
    enemies.remove(0);
  }
}

public void clearPlatforms(){
  while(p.platforms().size() != 0){
    p.platforms().remove(0);
  }
}

public void clearWalls(){
  while(p.walls().size() != 0){
    p.walls().remove(0);
  }
}

public void levelCleared(){
  fill(0);
  textSize(64);
  text("Level Cleared",500,100);
  fill(255);
   /* 
  try {
     Thread.sleep(1000);
  }catch(InterruptedException ex) {
     Thread.currentThread().interrupt();
  }*/
}



void setup(){
   size(1500,700);
   background(255,255,255);
   frameRate(60);
   p = new Player();
   enemies = new ArrayList<Enemy>(); 
   enemies.add(new Enemy1(15,65,200));
   enemies.add(new Enemy1(625,625,100)); 
   enemies.add(new Enemy1(500,305,100));
   enemies.add(new Enemy1(205,125,90));
   enemies.add(new Enemy1(95,525,70));
   enemies.add(new Enemy1(355,525,70));
   
   enemies.add(new Enemy2(200,500,200));

   p.addPlatform(new Platform(300,700,330));
   p.addPlatform(new Platform(700,1000,400));
   p.addPlatform(new Platform(400,1100,200));
   p.addPlatform(new Platform(400,700,600));
   
   p.addWall(new Wall(900,550,100));
   p.addWall(new Wall(900,0,215));
   
   level = 1;
   maxLevel = 3;
   levEnd = false;
   counter = 0;
}
  
void draw() {
  if(Win()){
   
    if(level < maxLevel){
      level+=1;
      levEnd = true;
    }else{
      fill(255);
      textSize(64);
      text("You Win!", 500, 300);
   
    }
    
  }
  
  if(levEnd){
    if(level == 2){
      clearEnemies();
      clearWalls();
      clearPlatforms();
      enemies.add(new Enemy1(95,525,70));
      enemies.add(new Enemy3(100,100,100));
      enemies.add(new Enemy4(800,400,100));
      
      p.returnToStart();
      levEnd = false;
      
    }
    if(level == 3){
      clearEnemies();
      clearWalls();
      clearPlatforms();
      
      //Set up level here
      
      
      levEnd = false;
    
    }
  
  }
 
  background(0,100,190);
  //line(0,650,1500,650); 
  fill(165,42,42);
  rect(0,650,1500,10); 
  fill(255);
  textSize(30);
  text("Lives: " +p.getHealth(), 10,25);
  text("Level: " + level, 1350, 25);
  if(p.getHealth() > 0){ 
    p.draw();
  }else{
    textSize(64);
    text("You Lose!", 650, 200);
  }
  
  for(int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    if(e instanceof Enemy4){
      ((Enemy4)e).getPlayerLocation(p.getX(),p.getY());
      for(int j = 0; j < ((Enemy4)e).bullets().size(); j++){
        Bullet bull = ((Enemy4)e).bullets().get(j);
        if(collision(bull, p)){
          p.damaged(e.atk);
          p.returnToStart();
        }
      }
    }
    e.draw();
    if(collision(p, e)){
      p.damaged(e.attack());
      p.returnToStart();
    }
    for(Bullet bull : p.bullets()){
      if(collision(bull, e)){
        bull.setDead(true);
        e.damaged(p.attack());
        if(e.dead()){
          enemies.remove(i);
        }
      }
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
    p.left();
    p.left();
    p.left();
    p.up();
  }
  if(key == 'e'){
    p.right();
    p.right();
    p.right();
    p.right();
    p.up();
  }
  if (key == 'j'){
    p.shoot(1);
  }
  if (key == 'k'){
    p.shoot(2);
  }
  
  //Cheat to pass level
  if(key == 'p'){
    clearEnemies();
  }
}
