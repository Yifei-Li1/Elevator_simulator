package com.company;

public class Elevator {
    class Node {
        int floorToGo;
        Node next;
    }
    int id;
    int position;
    int direction;              //1 going up, 0 stale, -1 going down
    final int speed = 1;                  //1 floor per second
    Node queue;

    public Elevator(int id, int position, int direction, Node queue) {
        this.id = id;
        this.position = position;
        this.direction = direction;
        this.queue = queue;
    }
}
