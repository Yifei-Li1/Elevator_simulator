public class Floor {
    int id;
    int positionY;              //building height is from 810 - 10, each floor is 80  
    ButtonSet bs;
    public Floor(int id){
      this.id = 9 - id;
      bs= new ButtonSet(220,id*80 + 50,9 - id);
      positionY = 80 * id + 10;
    }
    
    

}
