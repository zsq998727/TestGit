package com.caipu.entity;

public class Vote {
    private Integer id;

    private String type;

    private String user;

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

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user == null ? null : user.trim();
    }

    @Override
    public String toString() {
        return "Vote{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", user='" + user + '\'' +
                '}';
    }
}