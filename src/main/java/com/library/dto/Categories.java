package com.library.dto;

public class Categories {
    
	private int categoryId;
    private String cName;
    private String description;

    public Categories() {
    }

    public Categories(int categoryId, String cName, String description) {
        this.categoryId = categoryId;
        this.cName = cName;
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
