package com.company;

import java.util.List;

public class Building {
    List<Elevator> elevatorList;
    List<Floor> floorList;

    public Building(List<Elevator> elevatorList, List<Floor> floorList) {
        this.elevatorList = elevatorList;
        this.floorList = floorList;
    }

    public List<Elevator> getElevatorList() {
        return elevatorList;
    }

    public List<Floor> getFloorList() {
        return floorList;
    }

    public void setElevatorList(List<Elevator> elevatorList) {
        this.elevatorList = elevatorList;
    }

    public void setFloorList(List<Floor> floorList) {
        this.floorList = floorList;
    }


}
