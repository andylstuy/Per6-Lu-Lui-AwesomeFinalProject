private Player p;
private Enemy1 e;
void setup(){
   size(1500,700);
   background(255,255,255);
   frameRate(30);
   p = new Player();  
   e = new Enemy1(625,625,100); 
}
  
void draw() {
  background(255,255,255);
  line(0,650,1500,650);     
  p.draw();
  p.down();
  e.draw();
  
  
  
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
}

