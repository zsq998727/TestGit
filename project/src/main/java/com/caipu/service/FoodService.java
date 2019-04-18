package com.caipu.service;

import com.caipu.entity.DishName;

import java.util.List;

public interface FoodService {

    List<DishName> selectAll();

    DishName disPlay(Integer pn);

    List<DishName> type(String type);

    List<DishName> searchList(String name);

    void insertDishName(DishName dishName);

    List<DishName> myinfo(String name);

    void deleteFood(Integer id);

    List<DishName> selectAllFood();

    List<DishName> selectLikeFood(String name);


    DishName selectByFood(Integer id);

    void update(DishName dishName);
}