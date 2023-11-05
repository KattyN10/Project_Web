package com.example.edit.models;
import com.example.edit.Utils.DbUtils;
import com.example.edit.beans.Comments;
import org.sql2o.Connection;

public class CommentModel {
    public static void addComment(Comments comments){
        final String query = "INSERT INTO comments (article_id,user_id,comment,create_date) " +
                "VALUES (:article_id,:user_id,:comment,:create_date)";;
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("article_id",comments.getArticle_id())
                    .addParameter("user_id",comments.getUser_id())
                    .addParameter("comment",comments.getComment())
                    .addParameter("create_date",comments.getCreate_date())
                    .executeUpdate();
        }
    }
    public static void DeleteCmtByArtId(int article_id)
    {
        final String query = "DELETE FROM comments WHERE article_id = :article_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("article_id",article_id)
                    .executeUpdate();
        }
    }
    public static void DeleteCmtByUserId(int user_id)
    {
        final String query = "DELETE FROM comments WHERE user_id = :user_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("user_id",user_id)
                    .executeUpdate();
        }
    }
}
