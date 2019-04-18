package com.caipu.controller;

import com.caipu.entity.Msg;
import com.caipu.entity.User;
import com.caipu.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    public UserService userService;

    @RequestMapping("/register")
    @ResponseBody
    public Msg savePeople(String email, String name, String type, String paw) {
        if(email != null || name != null){
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPaw(paw);
            user.setType(type);
            userService.savePeople(user);
            return Msg.success();
        }else{
            return Msg.fail();
        }

    }

    @RequestMapping("/checkUser")
    @ResponseBody
    public Msg checkUser(@RequestParam(value = "info") String var) {
        boolean b = userService.verification(var);
        if (b) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    @RequestMapping("/update_infor")
    @ResponseBody
    public Msg updateInfor(String name, String paw) {
        System.out.println(name+" "+paw);
        if(name != null && paw != null){
            User user = new User();
            user.setName(name);
            user.setPaw(paw);
            userService.update(user);
            return Msg.success();
        }
        return Msg.fail();
    }

    @RequestMapping("/login")
    @ResponseBody
    public Msg login(String name, String paw, HttpServletRequest request) {
        if(name != null && paw != null){
            User user = userService.login(name, paw);
            HttpSession session = request.getSession();
            if (user != null && user.getType().equals("user")) {
                session.setAttribute("userInfo", user);
                return Msg.success().add("user",user);
            } else if (user != null && user.getType().equals("admin")) {
                session.setAttribute("name", user.getName());
                return Msg.fail();
            } else {
                return Msg.error();
            }
        }else{
            return Msg.error();
        }

    }

    @RequestMapping("/selectUserAll")
    @ResponseBody
    public Msg selectUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 9);
        List<User> li = userService.selectAllUser();
        PageInfo page = new PageInfo(li, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping(value = "/likeName/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectLikeName(@PathVariable("name") String name) {
        List<User> li = userService.selectLikeUser(name);
        return Msg.success().add("pageInfo", li);
    }

//    @RequestMapping(value = "/peo/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Msg getPeople(@PathVariable("id") Integer id) {
//        User user = userService.userPeople(id);
//        return Msg.success().add("people", user);
//    }

    @RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deletePeoById(@PathVariable("id") Integer id) {
        userService.deletePeople(id);
        return Msg.success();
    }

    @RequestMapping("/savaUser")
    @ResponseBody
    public Msg savaPeople(String name, String email, String type) {
        if(name != null && email != null && type != null){
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setType(type);
            userService.updatePeople(user);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }
}
