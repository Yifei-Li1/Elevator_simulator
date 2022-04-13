package com.company;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Elevator> elevatorList = new ArrayList<>();
        List<Floor> floorList = new ArrayList<>();
        for(int i = 0; i < 4;i++){
            elevatorList.add(new Elevator(i,1,0, null));
        }
        for(int i = 0; i < 10;i++){
            floorList.add(new Floor(i + 1, false,false ));
        }

        Building building = new Building(elevatorList,floorList);


    }
}
