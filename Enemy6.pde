public class Enemy6 extends Enemy4{
  public Enemy6(int x, int y, int range){
    super(x,y,range);
    health = 10;
  }
  
  public boolean spawn(){
    return a%200 == 0;
  }
  
  void draw(){
    fill(255,0,0);
    rect(x,y,30,30);
    fill(255);
    textSize(12);
    text(health+1, x+10, y-2);
    
    if(y < pY && y < 630){
      y += 1; 
    }
    else{
      y-= 1;
    } 
    if(x < pX){
      right = true;
      x+=1;
    }else{
      right = false;
      x-=1;
    }
    /*if(random(100) < 5){
        shoot();
    }*/
    for(int i = 0; i < b.size(); i++){
      if(b.get(i).dead()){
        b.remove(i);
      }else{
        b.get(i).draw();
      }
    }
    if(a%30 == 0){
      shoot();
    }
    a++;
    if(health <= 0){
      dead = true;
    }
  
  }
}
