package com.caipu.serviceImpl;

import com.caipu.entity.*;
import com.caipu.mapper.*;
import com.caipu.service.FavoritesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FavoritesImpl implements FavoritesService {
    @Autowired
    private FavoritesMapper favoritesMapper;

    @Autowired
    private DishesNumMapper dishesNumMapper;

    @Autowired
    private FavoriteNumMapper favoriteNumMapper;

    @Autowired
    private DishNameMapper dishNameMapper;

    @Autowired
    private FoodNumMapper foodNumMapper;


    public void Pavorites(Favorites favorites) {
        favoritesMapper.insertSelective(favorites);
    }

    public Favorites selectFavor(Favorites favorites){
        return favoritesMapper.selectByDishId(favorites);
    }

    public List<Favorites> selectAllFavorites(String user){
        FavoritesExample example = new FavoritesExample();
        FavoritesExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(user);
        return favoritesMapper.selectByExampleWithDish(example);
    }

    public void deleteFavorites(Favorites favorites){
        System.out.println(favorites.getFid()+" "+favorites.getUserid());
        favoritesMapper.deleteByPrimaryKey(favorites);
    }

    public void insertDishes(DishesNum dishesNum){
        dishesNumMapper.insertSelective(dishesNum);
    }
//
//    public Vote selectVote(Vote vote){
//        return voteMapper.select(vote);
//    }

    public boolean selectDishes(String type){
        DishesNumExample example = new DishesNumExample();
        DishesNumExample.Criteria criteria = example.createCriteria();
        criteria.andTypeEqualTo(type);
        long count = dishesNumMapper.countByExample(example);
        return count == 0;
    }

    public void updateDidhesNum(String type){
        dishesNumMapper.updateNum(type);
    }

    public List<DishesNum> AllDishRank(){
        return dishesNumMapper.selectByExample(null);
    }

    //修改收藏数量
    public void updateFavoritesNum(Integer id){
        favoriteNumMapper.updateNum(id);
    }

    //收藏累计
    public boolean selectFavorite(Integer id){
        FavoriteNumExample example = new FavoriteNumExample();
        FavoriteNumExample.Criteria criteria = example.createCriteria();
        criteria.andDishidEqualTo(id);
        long count = favoriteNumMapper.countByExample(example);
        return count == 0;
    }

    //添加收藏累计数据
    public void insertFavorite(FavoriteNum favoriteNum){
        favoriteNumMapper.insertSelective(favoriteNum);
    }

    public List<FavoriteNum> AllfavoriteRank(){
        return favoriteNumMapper.selectByExampleWithDish(null);
    }

    public boolean selectByDishId(Integer id){
        DishNameExample example = new DishNameExample();
        DishNameExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(id);
        long count = dishNameMapper.countByExample(example);
        return count == 0;
    }

    public boolean selectVoteFood(Integer id){
        FoodNumExample example = new FoodNumExample();
        FoodNumExample.Criteria criteria = example.createCriteria();
        criteria.andDishidEqualTo(id);
        long count = foodNumMapper.countByExample(example);
        return count == 0;
    }

    public void insertFoodNum(FoodNum foodNum){
        foodNumMapper.insertSelective(foodNum);
    }

    public void updataFoodNum(Integer id){
        foodNumMapper.updateNum(id);
    }

    public List<FoodNum> AllFoodRank(){
        return foodNumMapper.selectByExampleWithDish(null);
    }
}
