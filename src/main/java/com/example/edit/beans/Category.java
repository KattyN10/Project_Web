package com.example.edit.beans;

public class Category {
    private int categories_id;
    private String name;
    private int parent_id;

    public Category(int categories_id, String name, int parent_id) {
        this.categories_id = categories_id;
        this.name = name;
        this.parent_id = parent_id;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public void setCategories_id(int categories_id) {
        this.categories_id = categories_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categories_id=" + categories_id +
                ", name='" + name + '\'' +
                ", parent_id=" + parent_id +
                '}';
    }
}
