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
public boolean collision(Bullet bull, Wall w){
  return bull.getX() > w.getX() && bull.getX() < w.getX()+ w.getW() && bull.getY() > w.getY() && bull.getY() < w.getY()+w.getH();  
   
}

public boolean collision(Enemy1 e, Wall w){
  return (e.getX() > w.getX() && e.getX() < w.getX()+ w.getW() && e.getY() > w.getY() && e.getY() < w.getY()+w.getH()) ||
  (e.getX()+10 > w.getX() && e.getX()+10 < w.getX()+ w.getW() && e.getY() > w.getY() && e.getY() < w.getY()+w.getH());  
   
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
   enemies.add(new Enemy1(615,170,200));
   enemies.add(new Enemy1(625,625,110)); 
   enemies.add(new Enemy1(500,305,100));
   enemies.add(new Enemy1(1005,170,90));
   enemies.add(new Enemy1(95,525,70));
   enemies.add(new Enemy1(355,525,70));
   
   enemies.add(new Enemy2(1230,480,200));

   p.addPlatform(new Platform(300,700,330));
   p.addPlatform(new Platform(1000,1500,500));
   p.addPlatform(new Platform(400,1100,200));
   p.addPlatform(new Platform(400,700,600));
   p.addPlatform(new Platform(0,500,555));
   
   p.addWall(new Wall(900,350,300));
   p.addWall(new Wall(900,0,215));
   

   
   level = 1;
   maxLevel = 5;
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
      p.returnToStart();
      
      enemies.add(new Enemy1(150,575,220));
      enemies.add(new Enemy1(150,425,320));
      enemies.add(new Enemy1(150,225,120));
      enemies.add(new Enemy3(710,100,300));
      enemies.add(new Enemy4(800,400,100));
      enemies.add(new Enemy2(800,380,100));
      enemies.add(new Enemy3(800,400,120));
      enemies.add(new Enemy2(1200,630,200));
      
      
      p.addPlatform(new Platform(0,700,600));
      p.addPlatform(new Platform(900,1500,400));
      p.addPlatform(new Platform(300,750,500));
      p.addPlatform(new Platform(400,700,150));
      
      p.addWall(new Wall(750,450,200));
      p.addWall(new Wall(900,0,215));
      p.addWall(new Wall(100,300,255));
      
      
      levEnd = false;
      
    }
    if(level == 3){
      clearEnemies();
      clearWalls();
      clearPlatforms();
      p.returnToStart();
      
      //Set up level here
      p.addWall(new Wall(200,400,250));
      p.addWall(new Wall(900,400,250));
      p.addWall(new Wall(600,400,250));
      p.addWall(new Wall(200,0,270));
      p.addWall(new Wall(900,0,270));
      p.addWall(new Wall(600,0,270));
      
      enemies.add(new Enemy4(400,400,250));
      enemies.add(new Enemy4(750,400,250));
      enemies.add(new Enemy4(1100,400,250));
      
      enemies.add(new Enemy3(300,400,250));
      enemies.add(new Enemy3(650,400,250));
      enemies.add(new Enemy3(1000,400,250));
      
      enemies.add(new Enemy2(1200,630,200));
     
      levEnd = false;
    
    }
    if (level == 4){
      clearEnemies();
      clearWalls();
      clearPlatforms();
      p.returnToStart();
      enemies.add(new Enemy5(1400,50));
      enemies.add(new Enemy5(1300,200));
      enemies.add(new Enemy5(700,50));
      enemies.add(new Enemy5(600,600));
      
      enemies.add(new Enemy4(700,300,300));
      enemies.add(new Enemy4(800,400,300));
      enemies.add(new Enemy4(900,500,300));
      
      p.addPlatform(new Platform(0,700,580));
      p.addPlatform(new Platform(900,1500,500));
      p.addPlatform(new Platform(400,750,300));
      
      
      levEnd = false;
    }
    if(level == 5){
      clearEnemies();
      clearWalls();
      clearPlatforms();
      p.returnToStart();
      p.addPlatform(new Platform(300,700,330));
      p.addPlatform(new Platform(400,1100,200));
      p.addPlatform(new Platform(400,700,600));
      p.addPlatform(new Platform(0,500,55));
      
      p.addWall(new Wall(250,450,200));
      p.addWall(new Wall(800,0,215));
      p.addWall(new Wall(900,350,300));
      
      enemies.add(new Enemy6(1200,50,250));
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
        for(int k = 0; k < p.walls().size(); k++){
          Wall wall = p.walls().get(k);
          if(collision(bull,wall)){
            ((Enemy4)e).bullets().remove(j);
          }
        }
      }
    }
    if(e instanceof Enemy1){
      for(int k = 0; k < p.walls().size(); k++){
          Wall wall = p.walls().get(k);
          if(collision(((Enemy1)e),wall)){
            ((Enemy1)e).reverse();
          }
        }
      
    }else if(e instanceof Enemy5){
      ((Enemy5)e).getPlayerLocation(p.getX(), p.getY());
    }else if(e instanceof Enemy6){
      if(((Enemy6)e).spawn()){
        enemies.add(new Enemy1(e.getX(),e.getY(),(int)random(100) + 100));
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
