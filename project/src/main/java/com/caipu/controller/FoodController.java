package com.caipu.controller;

import com.caipu.entity.DishName;
import com.caipu.entity.Msg;
import com.caipu.service.FoodService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

@Controller
public class FoodController {
    @Autowired
    public FoodService foodService;

    @RequestMapping("/index")
    @ResponseBody
    public Msg index() {
        List<DishName> list = foodService.selectAll();
        return Msg.success().add("pageInfo", list);
    }

    @RequestMapping("/my_page")
    @ResponseBody
    public Msg myPages(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(value = "name") String name) {
        PageHelper.startPage(pn, 8);
        List<DishName> list = foodService.myinfo(name);
        PageInfo page = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/page")
    @ResponseBody
    public Msg pages(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(value = "type") String type) {
        PageHelper.startPage(pn, 8);
        List<DishName> list = foodService.type(type);
        PageInfo page = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping("/search_list/{name}")
    @ResponseBody
    public Msg search(@RequestParam(value = "pn", defaultValue = "1") Integer pn, @PathVariable("name") String name,
                      HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("search_name", name);
        PageHelper.startPage(pn, 8);
        List<DishName> list = foodService.searchList(name);
        PageInfo page = new PageInfo(list, 5);
        return Msg.success().add("listInfo", page);
    }

    @RequestMapping("/details")
    public String details(@RequestParam(value = "id") Integer id, HttpServletRequest request) {
        DishName dishName = foodService.disPlay(id);
        request.getSession().setAttribute("infor", dishName);
        return "details";
    }

    @RequestMapping("/info")
    @ResponseBody
    public Msg s(@RequestParam(value = "id") Integer id) {
        DishName dishName = foodService.disPlay(id);
        return Msg.success().add("infor", dishName);
    }

    @RequestMapping("/selectFoodAll")
    @ResponseBody
    public Msg selectFood(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 9);
        List<DishName> li = foodService.selectAllFood();
        PageInfo page = new PageInfo(li, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping(value = "/deleteFood/{foodId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteFoodById(@PathVariable("foodId") Integer foodId) {
        foodService.deleteFood(foodId);
        return Msg.success();
    }

    @RequestMapping(value = "/likeFood/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getFood(@PathVariable("name") String name) {
        List<DishName> li = foodService.selectLikeFood(name);
        return Msg.success().add("pageInfo", li);
    }

    @RequestMapping(value = "/selectId/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectById(@PathVariable("id") Integer id) {
        DishName dishName = foodService.selectByFood(id);
        return Msg.success().add("pageInfo", dishName);
    }

    @RequestMapping("/updateDish")
    @ResponseBody
    public Msg updateFood(String type, String introduction, String practices, Integer id) {
        if (type != null && introduction != null && practices != null) {
            DishName dishName = new DishName();
            dishName.setId(id);
            dishName.setIntroduction(introduction);
            dishName.setPractices(practices);
            dishName.setType(type);
            foodService.update(dishName);
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @RequestMapping(value = "/deleteById/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteFoodByDishId(@PathVariable("id") Integer id) {
        foodService.deleteFood(id);
        return Msg.success();
    }

    //文件上传
    @RequestMapping("/onefile")
    public String oneFileUpload2(HttpServletRequest request,
                                String user, String name, String type, String introduction, String practices,
                                 String ingredients, String img) throws Exception {
        DishName dishName = new DishName();
        dishName.setType(type);
        dishName.setPractices(practices);
        dishName.setUser(user);
        dishName.setIngredients(ingredients);
        dishName.setName(name);
        dishName.setImg(img);
        dishName.setIntroduction(introduction);
        CommonsMultipartResolver cmr = new CommonsMultipartResolver(request.getSession().getServletContext());
        if (cmr.isMultipart(request)) {
            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) (request);
            Iterator<String> files = mRequest.getFileNames();
            while (files.hasNext()) {
                MultipartFile mFile = mRequest.getFile(files.next());
                if (mFile != null) {
                    String fileName = "img" + UUID.randomUUID()
                            + mFile.getOriginalFilename();
                    String str = "img\\";
                    String path = "" + request.getSession().getServletContext().getRealPath("/") + str;
                    System.out.println(path);
                    path = path + fileName;
                    File localFile = new File(path);
                    mFile.transferTo(localFile);
                    dishName.setImg("img/" + fileName);
                }
            }
        }
        System.out.println(dishName);
        foodService.insertDishName(dishName);
        return "index";
    }

}
