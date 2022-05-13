public class FloorInfo{
  int floor;
  boolean upPressed;
  boolean downPressed;
  boolean arrived;
  public FloorInfo(int floor, boolean upPressed,boolean downPressed){
    this.floor = floor;
    this.upPressed = upPressed;
    this.downPressed = downPressed;
    this.arrived = false;
  }
  
}
