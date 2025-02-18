package com.vti.entity;

import com.vti.utils.Utils;

public class Position {
    private int id;
    public Utils.PositionName name;

    public Position(int id, Utils.PositionName positionName){
        this.id = id;
        this.name = positionName;
    }
}
