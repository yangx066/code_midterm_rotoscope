
class Tree {
  color col;
  int x; 
  int y;
  int speed;
 

  Tree () {
    col = color(random(100,255), random(150,255), 255, random(50,200));
    speed = 5;
    
    
    x = int(random(width));
    y = int(random(height));
  }
 

  void drawTree() { 
    
    noStroke();
    fill(col);
    
    ellipse(x/3, y, x/8, x/8);
    ellipse(x/3+640, y, x/8, x/8);
    
    fill(255,random(150));
    ellipse(x/3+10, y+10, x/30, x/30);
    ellipse(x/3+650, y, x/40, x/40);
    


    
  }
 
  void moveTree() { 
    y+= speed;
    if (y>height && speed>0) {
      y = 20;
      y+= speed;
    }
    
    
  }
}