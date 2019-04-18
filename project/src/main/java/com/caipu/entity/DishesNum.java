package com.caipu.entity;

public class DishesNum {
    private Integer id;

    private String type;

    private Integer number;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "DishesNum{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", number=" + number +
                '}';
    }
}