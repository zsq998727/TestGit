package com.caipu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PageController {

    @RequestMapping("/index_page")
    public String index() {
        return "index";
    }

    @RequestMapping("/admin_page")
    public String Adminadmin() {
        return "admin/adminIndex";
    }

    @RequestMapping("/admin_searchUser")
    public String AdminsearchUser() {
        return "admin/searchUser";
    }

    @RequestMapping("/admin_allUser")
    public String AdminallUser() {
        return "admin/allUser";
    }

    @RequestMapping("/admin_searchDN")
    public String AdminSearchDN() {
        return "admin/searchDN";
    }

    @RequestMapping("/admin_allQues")
    public String AdminAllQuestion(){
        return "admin/allQuestions";
    }

    @RequestMapping("/admin_allDN")
    public String allDN() {
        return "admin/allDN";
    }

    @RequestMapping("/login_page")
    public String loginPage() {
        return "login";
    }

    @RequestMapping("/my_favorites_page")
    public String myFavo() {
        return "myFavorites";
    }

    @RequestMapping("/my_recipe_page")
    public String myRecipe() {
        return "myRecipe";
    }

    @RequestMapping("/my_infor_page")
    public String myInfor() {
        return "myInfor";
    }

    @RequestMapping("/register_page")
    public String register() {
        return "register";
    }

    @RequestMapping("/chuancai")
    public String chuancai() {
        return "chuancai";
    }

    @RequestMapping("/xiangcai")
    public String xiangcai() {
        return "xiangcai";
    }

    @RequestMapping("/yuecai")
    public String yuecai() {
        return "yuecai";
    }

    @RequestMapping("/sucai")
    public String sucai() {
        return "sucai";
    }

    @RequestMapping("/lucai")
    public String lucai() {
        return "lucai";
    }

    @RequestMapping("/vegetables")
    public String vegetables() {
        return "vegetables";
    }

    @RequestMapping("/zhecai")
    public String zhecai() {
        return "zhecai";
    }


    @RequestMapping("/search_info")
    public String searchInfo() {
        return "searchinfo";
    }

    @RequestMapping("/vote")
    public String meat() {
        return "vote";
    }

    @RequestMapping("/ranking")
    public String menu() {
        return "ranking";
    }

    @RequestMapping("/mincai")
    public String mincai() {
        return "mincai";
    }

    @RequestMapping("/huicai")
    public String huicai() {
        return "huicai";
    }

    @RequestMapping("/question")
    public String question() {
        return "questions";
    }

    @RequestMapping("/upload")
    public String onload(HttpServletRequest request) {
        if (request.getSession().getAttribute("userInfo").equals("null")) {
            System.out.println(1);
            return "login";
        } else {
            System.out.println(3);
            return "upLoad";
        }
    }

    @RequestMapping("/allquestions_page")
    public String allquestion(){
        return "allquestions";
    }

    @RequestMapping("/exit")
    public String exit(HttpServletRequest request) {
        request.getSession().setAttribute("userInfo", "null");
        return "index";
    }

}
