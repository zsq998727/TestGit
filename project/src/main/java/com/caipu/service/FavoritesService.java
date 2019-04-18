package com.caipu.service;

import com.caipu.entity.*;

import java.util.List;

public interface FavoritesService {
    void Pavorites(Favorites favorites);

    Favorites selectFavor(Favorites favorites);

    List<Favorites> selectAllFavorites(String user);

    void deleteFavorites(Favorites favorites);

    void insertDishes(DishesNum dishesNum);
//
//    Vote selectVote(Vote vote);

    boolean selectDishes(String type);

    void updateDidhesNum(String type);

    List<DishesNum> AllDishRank();

    void updateFavoritesNum(Integer id);

    boolean selectFavorite(Integer id);

    void insertFavorite(FavoriteNum favoriteNum);

    List<FavoriteNum> AllfavoriteRank();

    boolean selectByDishId(Integer id);

    void insertFoodNum(FoodNum foodNum);

    boolean selectVoteFood(Integer id);

    void updataFoodNum(Integer id);

    List<FoodNum> AllFoodRank();
}
