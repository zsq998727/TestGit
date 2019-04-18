package com.caipu.entity;

public class Favorites {
    private Integer fid;

    private Integer userid;

    private String username;

    private Integer dishid;

    private DishName dishName;

    public DishName getDishName() {
        return dishName;
    }

    public void setDishName(DishName dishName) {
        this.dishName = dishName;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getDishid() {
        return dishid;
    }

    public void setDishid(Integer dishid) {
        this.dishid = dishid;
    }

    public Favorites(Integer fid, Integer userid, String username, Integer dishid, DishName dishName) {
        this.fid = fid;
        this.userid = userid;
        this.username = username;
        this.dishid = dishid;
        this.dishName = dishName;
    }

    public Favorites() {

    }

    @Override
    public String toString() {
        return "Favorites{" +
                "fid=" + fid +
                ", userid=" + userid +
                ", username='" + username + '\'' +
                ", dishid=" + dishid +
                ", dishName=" + dishName +
                '}';
    }
}