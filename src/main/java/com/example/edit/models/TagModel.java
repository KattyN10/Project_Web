package com.example.edit.models;

import com.example.edit.Utils.DbUtils;
import com.example.edit.beans.Tag;
import org.sql2o.Connection;

import java.util.List;

public class TagModel {
    //Tìm tất cả các Tag
    public static List<Tag> findAll() {
        final String query = "SELECT * FROM tags";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Tag.class);
        }
    }
    //Tìm Tag theo index
    public  static List<Tag> findByindex() {
        final String query = "SELECT  tags.tags_id, tags.`value`FROM tags LEFT JOIN tags_articles " +
                "ON tags.tags_id = tags_articles.tags_id WHERE index_id =1 LIMIT 4;";
        try(Connection con =DbUtils.getConnection())
        {
            return con.createQuery(query)
                    .executeAndFetch(Tag.class);
        }

    }
    public static boolean checkTagById(int tags_id) {
        String query = "select * from tags where tags_id = :tags_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Tag> list = con.createQuery(query)
                    .addParameter("tags_id",tags_id)
                    .executeAndFetch(Tag.class);
            if (list.size() == 0) {
                return false;
            }
            return true;
        }

    }
    public static Tag findTagById(int tags_id) {
        final String query = "SELECT * FROM tags WHERE tags_id = :tags_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Tag> list = con.createQuery(query)
                    .addParameter("tags_id", tags_id)
                    .executeAndFetch(Tag.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static void addTag(Tag tag)
    {
        final String query = "INSERT INTO tags (value) VALUES (:value)";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("value", tag.getValue())
                    .executeUpdate();

        }
    }
    public static void updateTage(Tag tag)
    {
        final String query = "UPDATE tags SET  value = :value WHERE tags_id = :tags_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("tags_id",tag.getTags_id())
                    .addParameter("value", tag.getValue())
                    .executeUpdate();

        }
    }
    public static void deleteTag(int tags_id)
    {
        final String query = "DELETE FROM tags WHERE tags_id = :tags_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("tags_id",tags_id)
                    .executeUpdate();

        }
    }



}
