import java.util.*;
import java.util.stream.Collectors;

public class Elevator {
  int positionX;
  int positionY;
  int id;
  int floor;
  int direction;              //1 going up, 0 stale, -1 going down
  int elevatorPressed;
  FloorInfo nextToGo;
  boolean pickupUp;
  boolean pickupDown;
  List<FloorInfo> floorTogo;
  ElevatorPanel ep;
  final int speed = 1;                  //1 floor per second
  int wait = 150;
  int up =  0;
  
  public Elevator(int positionX,int positionY,int id,int floor,int direction){
    this.positionX = positionX;
    this.positionY = positionY;
    this.id = id;
    this.floor = floor;
    this.direction = direction;
    floorTogo=new ArrayList<FloorInfo>();
    ep = new ElevatorPanel(id);
  }
  
  public void setDirection(int d){
    direction = d;
  }
  class SortByFloor implements Comparator<FloorInfo> {  
    public int compare(FloorInfo a, FloorInfo b)  
    {  
       if(a.floor > b.floor) return 1;
       else{
         return -1;
       }
       
    }  
  }  
  public int totalTask(){
    int sum = 0;
    
    for(int i = floorTogo.size() - 1;i > 0; i--){
      sum += Math.abs(floorTogo.get(i).floor - floorTogo.get(i - 1).floor);
    }
    if(nextToGo != null){
      if(floorTogo.size()>0){
        sum += Math.abs(nextToGo.floor - floorTogo.get(0).floor);
      }
      sum += Math.abs(floor - nextToGo.floor);
      
    }
    
    
    
    return sum;
  }
  
  //public int nextTogo(List<Integer> floorTogo){//select the nearest elevator in togolist
    //return Collections.min(floorTogo.stream().map(i->Math.abs(i-floor)).collect(Collectors.toList()));
    
  //}
  //public void findNext(){
  //  if(floorTogo.isEmpty()){
  //    nextToGo = 0;
  //    return;
  //  }
  //  if(nextToGo != 0){
  //   return;
  //  }
  //  else{
  //    nextToGo = floorTogo.get(0);
  //    floorTogo.remove(0);
  //    //for(int i : floorTogo){
  //    //  if(direction > 0){
          
  //    //  }
  //    //  else if(direction < 0){
  //    //  }
  //    //  else{
          
  //    //  }
        
  //    }
      
  //  }
  void taskManage(){
    List<FloorInfo> lesstemp = new ArrayList<>(); 
    List<FloorInfo> overtemp = new ArrayList<>();
    //boolean temp = false;
    if(nextToGo.upPressed) up = 1;
    else if(nextToGo.downPressed) up = -1;
    
    
    System.out.println("taskManage called: up = " +up);
      for(int i = 0;i < elevatorPressed;i++){
        if(floorTogo.get(i).floor < floor){
          lesstemp.add(floorTogo.get(i));
        }
        else{
          overtemp.add(floorTogo.get(i));
        }
        
      }
      Collections.sort(lesstemp, new SortByFloor());
      Collections.sort(overtemp, new SortByFloor()); 
    if(up==-1){
      System.out.println("going down first");
      for(int i = 0;i < lesstemp.size();i++){
        floorTogo.set(lesstemp.size() - i - 1,lesstemp.get(i));
      }
      for(int i = lesstemp.size();i < elevatorPressed;i++){
        floorTogo.set(i,overtemp.get(overtemp.size()-(i - lesstemp.size()) - 1));
      }
    }
    else if(up==1){
      System.out.println("going up first");
      for(int i = 0;i < overtemp.size();i++){
        floorTogo.set(i,overtemp.get(i));
      }
      for(int i = overtemp.size();i < elevatorPressed;i++){
        floorTogo.set(i,lesstemp.get(lesstemp.size() - (i-overtemp.size()) - 1));
      }
    }
    
    
    
      
    
  }
  void arrive(){
    if(wait == 0){
      if(!nextToGo.upPressed &&!nextToGo.downPressed) 
          elevatorPressed --;
      if(floorTogo.size() != 0){
        System.out.println("id: "+id +"task queue is not empty");
        if(elevatorPressed > 0){
          taskManage();
          
        }
        
        nextToGo = floorTogo.get(0);
        floorTogo.remove(0);
      
      }
      else{
        
        System.out.println("no other task");
        nextToGo = null;
        //task queue is empty
      }
      wait = 150;
    }
    
    
  }
  
  void drawElevator(){
    ep.drawElevatorPanel();
    //check if need to change direction
    
    
    //findNext();
    if(nextToGo != null){
      //print("elevatorId: "+ id+"  current floor:" + floor + "  ");
      //println("floor to go " + nextToGo.floor);
      //for(int i = 0;i < floorTogo.size();i++){
      //  System.out.print(floorTogo.get(i).floor+ "  ");
      //}
      //System.out.println("next to go: "+nextToGo.floor);
     if(nextToGo.floor > floor){
       pickupDown = false;
       pickupUp = true;
       setDirection(1);
     }else if(nextToGo.floor < floor){
       pickupDown = true;
       pickupUp = false;
       setDirection(-1);
     }else{
       //reach target floor, stop elevator
       nextToGo.arrived=true;
       //System.out.println("elevator: "+ id +" arrived" + " wait: "+ wait);
       if(wait > 0){
         
         setDirection(0);
         wait --;
       }
       else{
         
         //nextToGo.arrived=true;
         //if(nextToGo.upPressed){
         //  Building.floorList.get(nextToGo.floor - 1).bs.upPressed = false;
         //}
         //if(nextToGo.downPressed){
         //  Building.floorList.get(nextToGo.floor - 1).bs.downPressed = false;
         //}
         //nextToGo = floorTogo.get(0);
         //floorTogo.remove(0);
         //wait = 150;
       }
       
     }
    }
    else{
      //nextToGo = null
      if(floorTogo.size() > 0){
        nextToGo = floorTogo.get(0);
        floorTogo.remove(0);
      }
    }
    positionY = positionY - direction * speed;
    if(positionY == 10 + 0 * 80) floor = 9;
    if(positionY == 10 + 1 * 80) floor = 8;
    if(positionY == 10 + 2 * 80) floor = 7;
    if(positionY == 10 + 3 * 80) floor = 6;
    if(positionY == 10 + 4 * 80) floor = 5;
    if(positionY == 10 + 5 * 80) floor = 4;
    if(positionY == 10 + 6 * 80) floor = 3;
    if(positionY == 10 + 7 * 80) floor = 2;
    if(positionY == 10 + 8 * 80) floor = 1;
    if(positionY == 10 + 9 * 80) floor = 0;
    if(wait != 150){
      fill(0);
    }
    else{
      fill(255);
    }
    rect(positionX, positionY, 20, 45);
    
    
    
  }
  
}
