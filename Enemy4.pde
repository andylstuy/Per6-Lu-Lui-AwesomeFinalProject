public class Enemy4 extends Enemy3{
 
  protected ArrayList<Bullet> b;
  protected int a;
  protected boolean right;
  protected int pX,pY;
  
  public Enemy4(int x, int y, int range){
    super(x,y,range);  
    b = new ArrayList<Bullet>();
    a = 0;
    right = false;
   
  }
  public ArrayList<Bullet> bullets(){
    return b;
  }
  
 public void getPlayerLocation(int pX,int pY){
    this.pY = pY;
    this.pX = pX;
  }
  
  public void shoot(){
    b.add(new Bullet(x,y+10,250,right,2));
    
  }
  
  void draw(){
    rect(x,y,20,20);
    
    if(y < pY && y < 630){
      y += 1; 
    }
    else{
      y-= 1;
    } 
    if(x < pX){
      right = true;
    }else{
      right = false;
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
  }
} 
