package com.example.edit.models;

import com.example.edit.Utils.DbUtils;
import com.example.edit.beans.Tag;
import com.example.edit.beans.Tags_articles;
import org.sql2o.Connection;

import java.util.List;

public class TagArticleModel {

    public static void addTagArticle(Tags_articles tagsArt) {
        final String query = "INSERT INTO tags_articles (tags_id,article_id,index_id) VALUES (:tags_id,:article_id,:index_id)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("tags_id", tagsArt.getTags_id())
                    .addParameter("article_id", tagsArt.getArticle_id())
                    .addParameter("index_id", tagsArt.getIndex_id())
                    .executeUpdate();

        }
    }

    public static Tag findTagByTagName(String value) {
        final String query = "SELECT * FROM tags WHERE value = :value";
        try (Connection con = DbUtils.getConnection()) {
            List<Tag> listTag = con.createQuery(query)
                    .addParameter("value", value)
                    .executeAndFetch(Tag.class);

            if (listTag.size() == 0) {
                return null;
            }
            return listTag.get(0);
        }
    }

    public static Tags_articles findTagArtById(int tags_id) {
        final String query = "SELECT * from tags_articles WHERE tags_id = :tags_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Tags_articles> list = con.createQuery(query)
                    .addParameter("tags_id", tags_id)
                    .executeAndFetch(Tags_articles.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }

    }
    public static void deleteTagArt(int tags_id)
    {
        final String query = "DELETE FROM tags_articles WHERE tags_id = :tags_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("tags_id",tags_id)
                    .executeUpdate();

        }
    }
    public static void DeleteTagByArt(int article_id)
    {
        final String query = "DELETE FROM tags_articles WHERE article_id = :article_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("article_id",article_id)
                    .executeUpdate();

        }
    }
}
