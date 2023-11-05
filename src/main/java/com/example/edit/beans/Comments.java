package com.example.edit.beans;

import java.time.LocalDateTime;

public class Comments {
    private int comment_id;
    private int article_id;
    private int user_id;
    private String comment;
    private LocalDateTime create_date;
    private String second_name;

    public Comments(int comment_id, int article_id, int user_id, String comment, LocalDateTime create_date, String second_name) {
        this.comment_id = comment_id;
        this.article_id = article_id;
        this.user_id = user_id;
        this.comment = comment;
        this.create_date = create_date;
        this.second_name = second_name;
    }
    public Comments(int comment_id, int article_id, int user_id, String comment, LocalDateTime create_date){
        this.comment_id = comment_id;
        this.article_id = article_id;
        this.user_id = user_id;
        this.comment = comment;
        this.create_date = create_date;
    }
    public Comments(){}

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreate_date() {
        return create_date;
    }

    public void setCreate_date(LocalDateTime create_date) {
        this.create_date = create_date;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }
}
