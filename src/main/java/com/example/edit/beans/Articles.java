package com.example.edit.beans;

import java.util.Date;

public class Articles {
    private int article_id;
    private String title;
    private  Date create_date;
    private Date publish_date;
    private int views;
    private String abstracts;
    private String content;
    private int categories_id;
    private boolean premium;
    private int writer_id;
    private int status_id;
    private String avatar;
    private String categoryName;
    private String second_name;
    private String value;
    private int editor_id;

    public Articles(int article_id, String title, Date create_date,Date publish_date, int views, String abstracts, String content,
                    int categories_id, boolean premium, int writer_id, int status_id, String avatar, String categoryName) {
        this.article_id = article_id;
        this.title = title;
        this.create_date = create_date;
        this.publish_date = publish_date;
        this.views = views;
        this.abstracts = abstracts;
        this.content = content;
        this.categories_id = categories_id;
        this.premium = premium;
        this.writer_id = writer_id;
        this.status_id = status_id;
        this.avatar = avatar;
        this.categoryName = categoryName;
    }

    public Articles(int article_id, String title,Date publish_date, int views, String abstracts,
                    String content, int categories_id, boolean premium, int writer_id, int status_id, String avatar,
                    String categoryName, String value) {
        this.article_id = article_id;
        this.title = title;
        this.publish_date = publish_date;
        this.views = views;
        this.abstracts = abstracts;
        this.content = content;
        this.categories_id = categories_id;
        this.premium = premium;
        this.writer_id = writer_id;
        this.status_id = status_id;
        this.avatar = avatar;
        this.categoryName = categoryName;
        this.value = value;
    }
    public Articles(int article_id, String title, Date create_date,Date publish_date, int views, String abstracts,
                    String content, int categories_id, boolean premium, int writer_id, int status_id, String avatar,
                    String categoryName, String second_name) {
        this.article_id = article_id;
        this.title = title;
        this.create_date = create_date;
        this.publish_date = publish_date;
        this.views = views;
        this.abstracts = abstracts;
        this.content = content;
        this.categories_id = categories_id;
        this.premium = premium;
        this.writer_id = writer_id;
        this.status_id = status_id;
        this.avatar = avatar;
        this.categoryName = categoryName;
        this.second_name = second_name;
    }
    public Articles(int article_id, String title, Date create_date,Date publish_date, int views, String abstracts,
                    String content, int categories_id, boolean premium, int writer_id, int status_id, String avatar,
                    String categoryName, String second_name, int editor_id) {
        this.article_id = article_id;
        this.title = title;
        this.create_date = create_date;
        this.publish_date = publish_date;
        this.views = views;
        this.abstracts = abstracts;
        this.content = content;
        this.categories_id = categories_id;
        this.premium = premium;
        this.writer_id = writer_id;
        this.status_id = status_id;
        this.avatar = avatar;
        this.categoryName = categoryName;
        this.second_name = second_name;
        this.editor_id = editor_id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getPublish_date() {
        return publish_date;
    }

    public void setPublish_date(Date publish_date) {
        this.publish_date = publish_date;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCategories_id() {
        return categories_id;
    }

    public void setCategories_id(int categories_id) {
        this.categories_id = categories_id;
    }

    public boolean isPremium() {
        return premium;
    }

    public void setPremium(boolean premium) {
        this.premium = premium;
    }

    public int getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(int writer_id) {
        this.writer_id = writer_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getEditor_id() {
        return editor_id;
    }

    public void setEditor_id(int editor_id) {
        this.editor_id = editor_id;
    }

    @Override
    public String toString() {
        return "Articles{" +
                "article_id=" + article_id +
                ", title='" + title + '\'' +
                ", publish_date=" + publish_date +
                ", views=" + views +
                ", abstracts='" + abstracts + '\'' +
                ", content='" + content + '\'' +
                ", categories_id=" + categories_id +
                ", premium=" + premium +
                ", writer_id=" + writer_id +
                ", status_id=" + status_id +
                ", avatar='" + avatar + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", second_name='" + second_name + '\'' +
                '}';
    }
}
