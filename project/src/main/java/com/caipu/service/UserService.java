package com.caipu.service;

import com.caipu.entity.User;

import java.util.List;

public interface UserService {

    void savePeople(User user);

    boolean verification(String var);

    void update(User user);

    User login(String name, String password);

    List<User> selectAllUser();

    void deletePeople(Integer id);

    List<User> selectLikeUser(String name);

    User userPeople(Integer id);

    void updatePeople(User user);

}
