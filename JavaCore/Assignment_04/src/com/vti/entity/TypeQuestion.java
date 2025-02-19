package com.vti.entity;

public class TypeQuestion {
    private int typeId;
    private String typeName;

    public TypeQuestion(int typeId, String name) {
        this.typeId = typeId;
        this.typeName = name;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
