Building bu;
void setup() {
  size(800, 1000);
  bu = new Building(10);
  Elevator el1 = new Elevator(30,730,1,1,0);
  Elevator el2 = new Elevator(70,730,2,1,0);
  Elevator el3 = new Elevator(110,730,3,1,0);
  Elevator el4 = new Elevator(150,730,4,1,0);
  bu.addElevator(el1);
  bu.addElevator(el2);
  bu.addElevator(el3);
  bu.addElevator(el4);
  
}

  
void draw(){
  
  background(255);
  bu.drawFloor();
  bu.drawElevator();
  //bu.drawTest();
  //for(Floor e:bu.floorList){
  //  e.checkButton();
  //}
  bu.update();
}
