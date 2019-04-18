package com.caipu.controller;

import com.caipu.entity.Comment;
import com.caipu.entity.Msg;
import com.caipu.entity.Reply;
import com.caipu.entity.User;
import com.caipu.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;


@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/infor")
    @ResponseBody
    public Msg insertComment(String content, String usern) {
        System.out.println(content+" "+usern);

        if(content != null && usern != null){
            Date date = new Date();
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setFromUname(usern);
            comment.setCreateTime(date);
//            commentService.insertComment(comment);
            return Msg.success();
        }else {
            return Msg.fail();
        }






    }

    @RequestMapping(value = "/selectquestion")
    @ResponseBody
    public Msg selectAllQuestion() {
        List<Comment> list = commentService.selectByAll();
        Collections.sort(list, new Comparator<Comment>() {
            @Override
            public int compare(Comment o1, Comment o2) {
                return o2.getId() - o1.getId();
            }
        });
        return Msg.success().add("pageInfo", list);
    }

    @RequestMapping(value = "/selectcomment/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectComment(@PathVariable(value = "id") Integer id) {
        Comment comment = commentService.selectComment(id);
        return Msg.success().add("problem", comment);
    }

    @RequestMapping("/insertreply")
    @ResponseBody
    public Msg insertReplyComment(Integer replyid, String content, String reply_cont,String toUname, String formuser, HttpServletRequest request) {
        System.out.println(replyid+" "+content+" "+reply_cont+" "+toUname+" "+formuser);
        Date date = new Date();
        if (replyid != null && content != null && toUname != null && formuser != null) {
            Reply reply = new Reply();
            reply.setReplyContent(reply_cont);
            reply.setReplyId(replyid);
            reply.setContent(content);
            reply.setToUname(toUname);
            reply.setFromUname(formuser);
            reply.setReplyTime(date);
            if (!request.getSession().getAttribute("userInfo").equals("null")) {
                User user = (User) request.getSession().getAttribute("userInfo");
                reply.setFromUname(user.getName());
            }
            commentService.insertReply(reply);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping("/ab")
    @ResponseBody
    public Msg b(@RequestParam(value = "name") String name) {
        List<Reply> list = commentService.selectByFromUser(name);
        return Msg.success().add("reply", list);
    }

    @RequestMapping(value = "/selectAllQues", method = RequestMethod.GET)
    @ResponseBody
    public Msg selectAllQuestions(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        System.out.println(pn);
        PageHelper.startPage(pn, 9);
        List<Comment> list = commentService.selectByAll();
        PageInfo page = new PageInfo(list, 5);
        return Msg.success().add("pageInfo", page);
    }

    @RequestMapping(value = "/deleteContent/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg delectContent(@PathVariable(value = "id") Integer id) {
        Comment comment = commentService.selectComment(id);
        System.out.println(comment);
        commentService.delectContent(id);
        commentService.delectReply(comment.getFromUname());
        return Msg.success();
    }
}
