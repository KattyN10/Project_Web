package com.example.edit.beans;

public class Tags_articles {
    private int tags_id;
    private int article_id;
    private int index_id;

    public int getTags_id() {
        return tags_id;
    }

    public void setTags_id(int tags_id) {
        this.tags_id = tags_id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public int getIndex_id() {
        return index_id;
    }

    public void setIndex_id(int index_id) {
        this.index_id = index_id;
    }

    public Tags_articles(int tags_id, int article_id) {
        this.tags_id = tags_id;
        this.article_id = article_id;
    }
    public Tags_articles(int tags_id, int article_id, int index_id) {
        this.tags_id = tags_id;
        this.article_id = article_id;
        this.index_id = index_id;
    }

    @Override
    public String toString() {
        return "Tags_articles{" +
                "tags_id=" + tags_id +
                ", article_id=" + article_id +
                ", index_id=" + index_id +
                '}';
    }
}
