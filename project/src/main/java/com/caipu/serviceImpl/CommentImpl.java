package com.caipu.serviceImpl;

import com.caipu.entity.Comment;
import com.caipu.entity.Reply;
import com.caipu.entity.ReplyExample;
import com.caipu.mapper.CommentMapper;
import com.caipu.mapper.ReplyMapper;
import com.caipu.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private ReplyMapper replyMapper;

    public void insertComment(Comment comment) {
        commentMapper.insert(comment);
    }

    public List<Comment> selectByAll() {
        return commentMapper.selectByExample(null);
    }

    public Comment selectComment(Integer id) {
        return commentMapper.selectByPrimaryKey(id);
    }

    public void insertReply(Reply reply) {
        replyMapper.insert(reply);
    }

    public List<Reply> selectByFromUser(String name){
        ReplyExample example = new ReplyExample();
        ReplyExample.Criteria criteria = example.createCriteria();
        criteria.andToUnameEqualTo(name);
        return replyMapper.selectByExample(example);
    }

    public void delectContent(Integer id){
        commentMapper.deleteByPrimaryKey(id);
    }

    public void delectReply(String name){
        ReplyExample example = new ReplyExample();
        ReplyExample.Criteria criteria = example.createCriteria();
        criteria.andToUnameEqualTo(name);
        replyMapper.deleteByExample(example);
    }

}
