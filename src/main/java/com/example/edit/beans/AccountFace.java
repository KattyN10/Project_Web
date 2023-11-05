package com.example.edit.beans;

public class AccountFace {
    private String name;
    private String id;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public AccountFace(String name, String id) {
        this.name = name;
        this.id = id;
    }

    @Override
    public String toString() {
        return "AccountFace{" +
                "name='" + name + '\'' +
                ", id='" + id + '\'' +
                '}';
    }
}
