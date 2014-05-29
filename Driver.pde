private Player p;
private ArrayList<Enemy1> enemies;

void setup(){
   size(1500,700);
   background(255,255,255);
   frameRate(60);
   p = new Player();
   enemies = new ArrayList<Enemy1>(); 
   enemies.add(new Enemy1(625,625,100)); 
   enemies.add(new Enemy1(500,305,100));
   enemies.add(new Enemy1(95,525,70));
}
  
void draw() {
  background(255,255,255);
  line(0,650,1500,650);     
  p.draw();
  p.down();
  for(Enemy1 e : enemies){
    e.draw();
  }
  
  
  
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
