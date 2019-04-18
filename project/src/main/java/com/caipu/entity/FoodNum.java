package com.caipu.entity;

public class FoodNum {
    private Integer fid;

    private Integer number;

    private Integer dishid;

    private DishName dishName;

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getDishid() {
        return dishid;
    }

    public void setDishid(Integer dishid) {
        this.dishid = dishid;
    }

    public DishName getDishName() {
        return dishName;
    }

    public void setDishName(DishName dishName) {
        this.dishName = dishName;
    }

    @Override
    public String toString() {
        return "FoodNum{" +
                "fid=" + fid +
                ", number=" + number +
                ", dishid=" + dishid +
                ", dishName=" + dishName +
                '}';
    }
}