package com.caipu.entity;

public class User {
    private Integer id;

    private String email;

    private String name;

    private String paw;

    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPaw() {
        return paw;
    }

    public void setPaw(String paw) {
        this.paw = paw == null ? null : paw.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public User(Integer id, String email, String name, String paw, String type) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.paw = paw;
        this.type = type;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", paw='" + paw + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}