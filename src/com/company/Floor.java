package com.company;

public class Floor {
    int id;
    boolean upPressed;

    public Floor(int id, boolean upPressed, boolean downPressed) {
        this.id = id;
        this.upPressed = upPressed;
        this.downPressed = downPressed;
    }

    boolean downPressed;

    public void setId(int id){
        this.id = id;
    }

    public void setUpPressed(boolean upPressed) {
        this.upPressed = upPressed;
    }
    public void setDownPressed(boolean downPressed){
        this.downPressed = downPressed;
    }

    public int getId() {
        return id;
    }

    public boolean isUpPressed() {
        return upPressed;
    }

    public boolean isDownPressed() {
        return downPressed;
    }



}
