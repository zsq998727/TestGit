package com.caipu.service;

import com.caipu.entity.Comment;
import com.caipu.entity.Reply;

import java.util.List;

public interface CommentService {
    void insertComment(Comment comment);

    List<Comment> selectByAll();

    Comment selectComment(Integer id);

    void insertReply(Reply reply);

    List<Reply> selectByFromUser(String name);

    void delectContent(Integer id);

    void delectReply(String name);

}
