package com.example.edit.models;
import com.example.edit.Utils.DbUtils;
import com.example.edit.beans.Feedback;
import org.sql2o.Connection;

import java.util.List;

public class FeedbackModel {
    public static void addFeedback(Feedback feedback){
        final String query = "INSERT INTO feedback (editor_id,article_id,description)" +
                "VALUES (:editor_id,:article_id,:description)";;
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("editor_id",feedback.getEditor_id())
                    .addParameter("article_id",feedback.getArticle_id())
                    .addParameter("description",feedback.getDescription())
                    .executeUpdate();
        }
    }
    public static boolean checkFeedback( int writer_id) {
        String query = "SELECT feedback.*,articles.writer_id FROM feedback INNER JOIN " +
                "articles ON feedback.article_id=articles.article_id WHERE articles.writer_id = :writer_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Feedback> list = con.createQuery(query)
                    .addParameter("writer_id", writer_id)
                    .executeAndFetch(Feedback.class);
            if (list.size() == 0) {
                return false;
            } else {
                return true;
            }
        }
    }
    public static List<Feedback> findFeedback(int writer_id){
        final String query = "SELECT articles.article_id,articles.title,articles.categoryName, articles.status_id, users.second_name," +
                "feedback.description FROM feedback INNER JOIN articles ON feedback.article_id=articles.article_id " +
                "INNER JOIN users on feedback.editor_id=users.user_id WHERE articles.writer_id= :writer_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Feedback> list = con.createQuery(query)
                    .addParameter("writer_id",writer_id)
                    .executeAndFetch(Feedback.class);
            if (list.size() == 0) {
                return null;
            } else {
                return list;
            }
        }
    }
    public static void DeleteFeedByAId(int article_id)
    {
        final String query = "DELETE FROM feedback WHERE article_id = :article_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("article_id",article_id)
                    .executeUpdate();
        }
    }
}
