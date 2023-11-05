package com.example.edit.beans;

public class Feedback {
    private int feedback_id;
    private int editor_id;
    private int article_id;
    private String description;

    private String title;
    private String categoryName;
    private int status_id;
    private String second_name;

    private int writer_id;

    public Feedback(int feedback_id, int editor_id, int article_id, String description) {
        this.feedback_id = feedback_id;
        this.editor_id = editor_id;
        this.article_id = article_id;
        this.description = description;
    }
    public Feedback(int feedback_id, int editor_id, int article_id, String description, String title, String categoryName,
                    int status_id, String second_name, int writer_id) {
        this.feedback_id = feedback_id;
        this.editor_id = editor_id;
        this.article_id = article_id;
        this.description = description;
        this.title = title;
        this.categoryName = categoryName;
        this.status_id = status_id;
        this.second_name = second_name;
        this.writer_id = writer_id;
    }

    public Feedback() {
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public int getEditor_id() {
        return editor_id;
    }

    public void setEditor_id(int editor_id) {
        this.editor_id = editor_id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public String getSecond_name() {
        return second_name;
    }

    public void setSecond_name(String second_name) {
        this.second_name = second_name;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(int writer_id) {
        this.writer_id = writer_id;
    }
}
