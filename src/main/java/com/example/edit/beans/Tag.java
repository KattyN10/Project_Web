package com.example.edit.beans;

public class Tag {
        private int tags_id;
        private String value;

        private int article_id;

    public int getTags_id() {
        return tags_id;
    }

    public void setTags_id(int tags_id) {
        this.tags_id = tags_id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Tag(int tags_id, String value, int article_id) {
        this.tags_id = tags_id;
        this.value = value;
        this.article_id = article_id;
    }

    public Tag(int tags_id, String value) {
        this.tags_id = tags_id;
        this.value = value;
    }
    public Tag( String value) {
        this.tags_id = -1;
        this.value = value;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "tags_id=" + tags_id +
                ", value='" + value + '\'' +
                ", article_id=" + article_id +
                '}';
    }
}
