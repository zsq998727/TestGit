package com.caipu.entity;

import java.util.Date;

public class Reply {
    private Integer id;

    private Integer replyId;

    private String content;

    private String replyContent;

    private Date replyTime;

    private String fromUname;

    private String toUname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }

    public Date getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public String getFromUname() {
        return fromUname;
    }

    public void setFromUname(String fromUname) {
        this.fromUname = fromUname == null ? null : fromUname.trim();
    }

    public String getToUname() {
        return toUname;
    }

    public void setToUname(String toUname) {
        this.toUname = toUname == null ? null : toUname.trim();
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", replyId=" + replyId +
                ", content='" + content + '\'' +
                ", replyContent='" + replyContent + '\'' +
                ", replyTime=" + replyTime +
                ", fromUname='" + fromUname + '\'' +
                ", toUname='" + toUname + '\'' +
                '}';
    }
}