package com.caipu.controller;

import com.caipu.entity.*;
import com.caipu.mapper.DishNameMapper;
import com.caipu.service.FavoritesService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class FavoritesController {

    @Autowired
    private FavoritesService favoritesService;

    @RequestMapping(value = "/saveFavorites")
    @ResponseBody
    public Msg savePavorites(Integer id, String name, Integer fid) {
        if (name != null) {
            Favorites favorites = new Favorites();
            favorites.setDishid(fid);
            favorites.setUsername(name);
            favorites.setUserid(id);
            favoritesService.Pavorites(favorites);
            if (favoritesService.selectFavorite(fid)) {
                FavoriteNum favoriteNum = new FavoriteNum();
                favoriteNum.setDishid(favorites.getDishid());
                favoriteNum.setNumber(1);
                favoritesService.insertFavorite(favoriteNum);
            } else {
                favoritesService.updateFavoritesNum(fid);
            }
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @RequestMapping("/selectFavorites")
    @ResponseBody
    public Msg selectFavorites(Integer userid, String username, Integer dishid) {
        Favorites favorites = new Favorites();
        favorites.setUsername(username);
        favorites.setDishid(dishid);
        favorites.setUserid(userid);
        Favorites favorites1;
        if (username == null) {
            return Msg.error();
        } else {
            favorites1 = favoritesService.selectFavor(favorites);
            if (favorites1 != null && favorites.getUsername().equals(favorites1.getUsername())) {
                return Msg.success();
            } else {
                return Msg.fail();
            }
        }
    }

    @RequestMapping("/myFavorite")
    @ResponseBody
    public Msg myFavorites(@RequestParam("pn") Integer pn, @RequestParam("user") String user) {
        System.out.println(user);
        PageHelper.startPage(pn, 9);
        List<Favorites> list = favoritesService.selectAllFavorites(user);
        PageInfo page = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping(value = "/deleteFaFood")
    @ResponseBody
    public Msg deletePeoById(Integer fid, Integer userid) {
        System.out.println(1+" "+fid+" " +userid);
        if(fid == null || userid == null)
            return Msg.fail();
        Favorites favorites = new Favorites();
        favorites.setFid(fid);
        favorites.setUserid(userid);
        favoritesService.deleteFavorites(favorites);
        return Msg.success();
    }

    @RequestMapping(value = "/voteinfo/{type}", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateDNum(@PathVariable(value = "type") String type) {
        if (favoritesService.selectDishes(type)) {
            DishesNum dishesNum = new DishesNum();
            dishesNum.setType(type);
            dishesNum.setNumber(1);
            favoritesService.insertDishes(dishesNum);
        } else {
            favoritesService.updateDidhesNum(type);
        }

//        if (!request.getSession().getAttribute("userInfo").equals("null")) {
//            User user = (User) request.getSession().getAttribute("userInfo");
//            vote.setUser(user.getName());
//        }
//        Vote vote1 = favoritesService.selectVote(vote);
//        if(vote1 == null){
//            favoritesService.insertVote(vote);
//            return Msg.success();
//        }else{
//            return Msg.fail();
//        }
        return Msg.success();
    }

    @RequestMapping(value = "/votefood")
    @ResponseBody
    public Msg updataFNum(Integer id) {
        System.out.println(id);
        if (!favoritesService.selectByDishId(id)) {
            if (favoritesService.selectVoteFood(id)) {
                FoodNum foodNum = new FoodNum();
                foodNum.setDishid(id);
                foodNum.setNumber(1);
                favoritesService.insertFoodNum(foodNum);
            } else {
                favoritesService.updataFoodNum(id);
            }
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

    @RequestMapping(value = "/selectdishes", method = RequestMethod.GET)
    @ResponseBody
    public Msg dishesRank() {
        List<DishesNum> list = favoritesService.AllDishRank();
        Collections.sort(list, new Comparator<DishesNum>() {
            @Override
            public int compare(DishesNum o1, DishesNum o2) {
                return o2.getNumber() - o1.getNumber();
            }
        });
        return Msg.success().add("pageInfo", list);
    }

    @RequestMapping(value = "/selectfavorite", method = RequestMethod.GET)
    @ResponseBody
    public Msg favoritesRank() {
        List<FavoriteNum> list = favoritesService.AllfavoriteRank();
        Collections.sort(list, new Comparator<FavoriteNum>() {
            @Override
            public int compare(FavoriteNum o1, FavoriteNum o2) {
                return o2.getNumber() - o1.getNumber();
            }
        });
        return Msg.success().add("pageInfo", list);
    }

    @RequestMapping(value = "/selectfood", method = RequestMethod.GET)
    @ResponseBody
    public Msg foodRank() {
        List<FoodNum> list = favoritesService.AllFoodRank();
        Collections.sort(list, new Comparator<FoodNum>() {
            @Override
            public int compare(FoodNum o1, FoodNum o2) {
                return o2.getNumber() - o1.getNumber();
            }
        });
        return Msg.success().add("pageInfo", list);
    }
}
