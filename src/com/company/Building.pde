import java.util.List;

public class Building {
    public List<Elevator> elevatorList;
    public List<Floor> floorList;
    boolean test = false;
    public Building(int floorNum){
      elevatorList = new ArrayList<>();
      floorList = new ArrayList<>();
      for(int i = 0;i < floorNum;i++){
        floorList.add(new Floor(i));
      }
    }
    public void addElevator(Elevator elevator){
      elevatorList.add(elevator);
    }
    public void drawElevator(){
      for(Elevator e:elevatorList){
        
        if(e.nextToGo != null){
          if(e.nextToGo.arrived&&e.nextToGo.upPressed){
            //System.out.println("Building: arrive signal receved from elevator");
            floorList.get(9-e.nextToGo.floor).bs.upPressed = false;
            e.arrive();
          }
         
          else if(e.nextToGo.arrived&&e.nextToGo.downPressed){
           //System.out.println("Building: arrive signal receved from elevator");
           floorList.get(9-e.nextToGo.floor).bs.downPressed = false;
           e.arrive();
          }
          else if(e.nextToGo.arrived&&!e.nextToGo.downPressed&&!e.nextToGo.upPressed){
           //System.out.println("Building: arrive signal receved from elevator");
           e.ep.buttons.get(e.nextToGo.floor).pressed = false;
           
           e.arrive();
          }
          
        }
        else{
        }
        e.drawElevator();
        
        
      }
    }
    public void drawFloor(){
     
      for(Floor f : floorList){
         f.bs.drawButtonSet();
         rect(30,730 - (f.id) * 80,elevatorList.size() * 40,80);
         
         //for(Elevator e:elevatorList){
         //  rect(10 + e.id * 40,720 - (i.id - 1) * 70,20,20);
         //  rect(10 + e.id * 40,750 - (i.id - 1) * 70 ,20,20);
         //}
      }
      
    }
    //public void drawTest(){
    //  rect(400,100,40,40);
    //}
    
   public void upDispatch(int floorId){   //return the id of the elevator that suit for this task
      int distance = 100;
      int elevatorToAssign = 1;
      int idleElevator = -1;
      int idleDistance = 100;
      for(Elevator e: elevatorList){
        System.out.println("id:  "+e.id);
        if(e.floor < floorId && e.nextToGo != null){ 
          if(e.nextToGo.floor > floorId && e.nextToGo.upPressed){
            System.out.println("**********************************************passing by target**************************************************************");
            e.floorTogo.add(0,e.nextToGo);
            e.nextToGo = new FloorInfo(floorId,true,false);
          
            return;
          }
          
        }
        if(e.nextToGo == null){
          System.out.println("**********************************************idle elevator**************************************************************");
          System.out.println("temp:" + Math.abs(e.floor - floorId));
          if(Math.abs(e.floor - floorId) < idleDistance || idleDistance == -1) {
            idleDistance = Math.abs(e.floor - floorId);
            idleElevator = e.id;
          }
        }
        else{
          System.out.println("**********************************************compara distance**************************************************************");
          int temp = e.totalTask();
          System.out.println("temp:" + temp);
          if(temp < distance){
            
            distance = temp;
            elevatorToAssign = e.id;
          }
          
        }
      }
      if(idleElevator != -1){
        System.out.println("idle elevator Assign:" + idleElevator);
        elevatorList.get(idleElevator - 1).floorTogo.add(new FloorInfo(floorId,true,false));
        return;
      }
      System.out.println("elevatorToAssign:" + elevatorToAssign);
      elevatorList.get(elevatorToAssign - 1).floorTogo.add(new FloorInfo(floorId,true,false));
      
    }
    public void downDispatch(int floorId){
      int distance = 100;
      int idleDistance = 100;
      int elevatorToAssign = 1;
      int idleElevator = -1;
      for(Elevator e: elevatorList){
        System.out.println("id: "+e.id);
        if(e.floor > floorId && e.nextToGo != null){ 
          if(e.nextToGo.floor < floorId && e.nextToGo.downPressed){
            System.out.println("**********************************************passing by target**************************************************************");
            e.floorTogo.add(0,e.nextToGo);
            e.nextToGo = new FloorInfo(floorId,false,true);
          
            return;
          }
          
        }
        if(e.nextToGo == null){
          System.out.println("**********************************************idle elevator**************************************************************");
          System.out.println("temp:" + Math.abs(e.floor - floorId));
          if(Math.abs(e.floor - floorId) < idleDistance || idleDistance == -1) {
            idleDistance = Math.abs(e.floor - floorId);
            idleElevator = e.id;
          }
         
          
        }
        else{
          System.out.println("**********************************************compara distance**************************************************************");
          int temp = e.totalTask();
          System.out.println("temp:" + temp);
          if(temp < distance){
            distance = temp;
            elevatorToAssign = e.id;
          }
          
        }
      }
      if(idleElevator != -1){
        System.out.println("idle elevator Assign:" + idleElevator);
        elevatorList.get(idleElevator - 1).floorTogo.add(new FloorInfo(floorId,false,true));
        return;
      }
      System.out.println("elevatorToAssign:" + elevatorToAssign);
      elevatorList.get(elevatorToAssign - 1).floorTogo.add(new FloorInfo(floorId,false,true));
      
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
    
    void update(){
      
     //drawElevator();
     
     
     textSize(16);
     fill(0);
     for(Elevator e: elevatorList){
       StringBuilder sb = new StringBuilder();
       sb.append("No."+e.id+"Elevator:");
       sb.append(e.floor+"  ");
       sb.append("elevatorPressed  "+e.elevatorPressed);
       sb.append("  floorTogo: ");
       if(e.direction==1){
         //sb.append("up");
       }else if(e.direction==-1){
         //sb.append("down");
       }
       
       if(e.nextToGo != null) sb.append(e.nextToGo.floor+" ");
       
       for(FloorInfo i:e.floorTogo){
            sb.append(i.floor+" ");
             
       }
       text(sb.toString(),400,-150+e.id*200);
       //System.out.println(e.elevatorPressed);
       for(int i = 0;i < e.ep.buttons.size();i++){
         if(e.ep.buttons.get(i).pressed == true){
           boolean needAdd = true;
           if(e.nextToGo != null){
             if(e.nextToGo.floor == i){
               needAdd = false;
             }
           }
           if(e.elevatorPressed > 0  && needAdd){
             int temp;
             if(!e.nextToGo.upPressed && !e.nextToGo.downPressed){
                temp = e.elevatorPressed - 1;
             }
             else{
               temp = e.elevatorPressed;
             }
             for(int j = 0;j < temp;j++){
               if(e.floorTogo.get(j).floor == i){
                 needAdd = false;
               }
             }
           }
           
           
           
           
           if(needAdd){
             boolean nextIs = false;
             System.out.println("needAdd");
             
             if(e.nextToGo != null){
               if(!e.nextToGo.upPressed && !e.nextToGo.downPressed){
                  e.elevatorPressed += 1;
                 e.floorTogo.add(0,new FloorInfo(i,false,false));
                 //e.taskManage();
                 e.floorTogo.add(0,e.nextToGo);
                 
                 List<FloorInfo> lesstemp = new ArrayList<>(); 
    List<FloorInfo> overtemp = new ArrayList<>();
    //boolean temp = false;
    if(e.pickupUp) e.up = 1;
    else if(e.pickupDown) e.up = -1;
    
    
    System.out.println("taskManage called: up = " +e.up);
      for(int j = 0;j < e.elevatorPressed;j++){
        if(e.floorTogo.get(j).floor < e.floor){
          lesstemp.add(e.floorTogo.get(j));
        }
        else{
          overtemp.add(e.floorTogo.get(j));
        }
        
      }
      Collections.sort(lesstemp, new SortByFloor());
      Collections.sort(overtemp, new SortByFloor()); 
    if(e.up==-1){
      System.out.println("going down first");
      for(int j = 0;j < lesstemp.size();j++){
        e.floorTogo.set(lesstemp.size() - j - 1,lesstemp.get(j));
      }
      for(int j = lesstemp.size();j < e.elevatorPressed;j++){
       e.floorTogo.set(j,overtemp.get(overtemp.size()-(j - lesstemp.size()) - 1));
      }
    }
    else if(e.up==1){
      System.out.println("going up first");
      for(int j = 0;j < overtemp.size();j++){
        e.floorTogo.set(j,overtemp.get(j));
      }
      for(int j = overtemp.size();j < e.elevatorPressed;j++){
        e.floorTogo.set(j,lesstemp.get(lesstemp.size() - (j-overtemp.size()) - 1));
      }
    }
    e.nextToGo = e.floorTogo.get(0);
    e.floorTogo.remove(0);
                 
                 nextIs = true;
               }
             }
             if(!nextIs){
               e.floorTogo.add(0,new FloorInfo(i,false,false));
               e.elevatorPressed += 1;
             }
             
            
             
           }
          
         }
         
       }
     }
     for(Floor f : floorList){
       if(f.bs.upPressed==true){      
         //up button is pressed for that floor,check if that floor is already in some elevator's togo list
         boolean needToAdd = true;
         for(Elevator e: elevatorList){
           if(e.nextToGo != null){
             if(e.nextToGo.floor == f.id && e.nextToGo.upPressed) needToAdd = false;
           }
           
           for(FloorInfo i:e.floorTogo){
             if(i.floor == f.id && i.upPressed){
               needToAdd = false;
             }
             
             
             
           }
         }
         if(needToAdd){
           upDispatch(f.id);   //
         }
         
       }
       if(f.bs.downPressed == true){
         boolean needToAdd = true;
         for(Elevator e: elevatorList){
           if(e.nextToGo != null){
             if(e.nextToGo.floor == f.id && e.nextToGo.downPressed) needToAdd = false;
           }
           for(FloorInfo i:e.floorTogo){
             if(i.floor == f.id && i.downPressed){
               needToAdd = false;
             }
           }
         }
         if(needToAdd){
           System.out.println("I'm here");
           downDispatch(f.id);    
         }
         
       }
      
     }
      
    }
    
}
