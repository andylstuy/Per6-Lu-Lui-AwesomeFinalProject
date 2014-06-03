private Player p;
private ArrayList<Enemy1> enemies;

public boolean collision(Bullet bull, Enemy1 e){
  return abs(bull.getX() - e.getX()) < 20 && abs(bull.getY() - e.getY()) < 20;  
   
}
public boolean collision(Player p, Enemy1 e){
  return abs(p.getX() - e.getX()) < 20 && abs(p.getY() - e.getY()) < 20;  
}

void setup(){
   size(1500,700);
   background(255,255,255);
   frameRate(60);
   p = new Player();
   enemies = new ArrayList<Enemy1>(); 
   enemies.add(new Enemy1(625,625,100)); 
   enemies.add(new Enemy1(500,305,100));
   enemies.add(new Enemy1(95,525,70));
   enemies.add(new Enemy1(355,525,70));
   enemies.add(new Enemy1(205,125,90));
   enemies.add(new Enemy1(15,65,200));
   
   
   
   p.addPlatform(new Platform(300,700,330));
   p.addPlatform(new Platform(700,1000,400));
   p.addPlatform(new Platform(400,1100,200));
   p.addPlatform(new Platform(400,700,600));
}
  
void draw() {
  background(0,100,190);
  //line(0,650,1500,650); 
  rect(0,650,1500,10); 
  textSize(30);
  text("Lives: " +p.getHealth(), 10,25);
  if(p.getHealth() > 0){ 
    p.draw();
  }else{
    textSize(64);
    text("You Lose!", 650, 200);
  }
  for(int i = 0; i < enemies.size(); i++){
    Enemy1 e = enemies.get(i);
    e.draw();
    if(collision(p, e)){
      p.damaged(e.atk);
      p.returnToStart();
    }
    for(Bullet bull : p.bullets()){
      if(collision(bull, e)){
        bull.setDead(true);
        enemies.remove(i);
       
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
}
