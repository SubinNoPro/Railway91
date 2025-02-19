package com.vti.entity;

import com.vti.utils.Utils;

public class Position {
    private int positionId;
    private Utils.PositionName positionName;

    public Position(int positionId, Utils.PositionName positionName){
        this.positionId = positionId;
        this.positionName = positionName;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int id) {
        this.positionId = id;
    }

    public Utils.PositionName getPositionName() {
        return positionName;
    }

    public void setPositionName(Utils.PositionName positionName) {
        this.positionName = positionName;
    }
}
