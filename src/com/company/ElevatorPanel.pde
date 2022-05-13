public class ElevatorPanel{
//  List<ButtonSet> buttonSets = new ArrayList<ButtonSet>();
  List<NumberButton> buttons = new ArrayList<NumberButton>();
  int id;
  public ElevatorPanel(int id){
    this.id = id;
  //  this.buttonSets=buttonSets;
    for(int i=0;i<10;i++){
      buttons.add(new NumberButton(i));
    }
  }
  
 public class NumberButton{
    int floor;
    boolean pressed;
    public NumberButton(int floor){
      this.floor=floor;
    }
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
  
  
  public void drawElevatorPanel(){
    
    for(int i=0;i<5;i++){
      if(overCircle(400+i*50, -120+id*200,25)&&mousePressed){
        buttons.get(i).pressed = true;
      }
      if( buttons.get(i).pressed == true){
       fill(color(255, 230, 0));
      }else{
       fill(255);
      }
      circle(400+i*50, -120+id*200, 25);
      fill(0);
      textSize(16);
      text(i+1,395+i*50,-115+id*200);
    }
    
    for(int i=5;i<9;i++){
      if(overCircle(150+i*50, -90+id*200, 25)&&mousePressed){
        buttons.get(i).pressed = true;
      }
      if( buttons.get(i).pressed == true){
       fill(color(255, 230, 0));
      }else{
       fill(255);
      }
      
      circle(150+i*50, -90+id*200, 25);
      fill(0);
      textSize(16);
      text(i+1,145+i*50,-85+id*200);
    }
    
     if(overCircle(150+9*50, -90+id*200, 25)&&mousePressed){
        buttons.get(9).pressed = true;
     }
     if( buttons.get(9).pressed == true){
       fill(color(255, 230, 0));
     }else{
       fill(255);
     }
     circle(150+9*50, -90+id*200, 25);
     fill(0);
     textSize(16);
     text(9+1,142+9*50,-85+id*200);
     
     
    
     //for(int i=0;i<10;i++){
     //  //not finish here!!!!!
     //   if (overCircle(400+i*15, 420+id*50, 25)&&mousePressed) {
     //     System.out.println("I'm here");
     //     buttons.get(i).pressed=true;
     //   }
     //}    
    
  }
}
