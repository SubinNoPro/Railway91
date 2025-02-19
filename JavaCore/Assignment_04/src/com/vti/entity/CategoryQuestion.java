package com.vti.entity;

public class CategoryQuestion {
    private int CategoryId;
    private String CategoryName;

    public CategoryQuestion(int id, String name) {
        this.CategoryId = id;
        this.CategoryName = name;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int categoryId) {
        this.CategoryId = categoryId;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String categoryName) {
        this.CategoryName = categoryName;
    }
}
