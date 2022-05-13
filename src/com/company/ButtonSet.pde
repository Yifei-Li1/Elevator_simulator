public class ButtonSet{
  int x;
  int y;
  int floor;
  boolean upPressed;
  boolean downPressed;
  color upButtonColor=255;
  color downButtonColor=255;
 
  public ButtonSet(int x,int y, int floor){
    this.x=x;
    this.y=y;
    this.floor=floor;
    upPressed=false;
    downPressed=false;
  }
  
  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
  
  void drawButtonSet(){
    if (overCircle(x, y+15, 25)&&mousePressed) {
      //add down event here!
      downPressed=true;
    }
    if (overCircle(x, y-15, 25)&&mousePressed) {
       //add up event here!
      upPressed=true;
    }
    
    if(upPressed){
      upButtonColor = color(255, 230, 0);
    }else{
      upButtonColor = 255;
    }
    
    if(downPressed){
      downButtonColor = color(255, 230, 0);
    }else{
      downButtonColor = 255;
    }
    
    fill(downButtonColor);
    circle(x, y+15, 25);
    fill(200);
    triangle(x,y+23,x+8,y+10,x-8,y+10);
    fill(upButtonColor);
    circle(x, y-15, 25);
    fill(200);
    triangle(x,y-23,x+8,y-10,x-8,y-10);
    fill(255);
  }
  //void upFloorReached(int floor){
    
  //}
  //void downFloorReached(int floor){
    
  //}
  
}
