package com.example.edit.models;

import com.example.edit.Utils.DbUtils;
import com.example.edit.beans.Editor_manage_categories;
import org.sql2o.Connection;

import java.util.List;

public class EditorManageModel {

    public static void addBTVCate(Editor_manage_categories c)
    {
        final String query = "INSERT INTO editor_manage_categories ( editor_id, category_id) VALUES (:editor_id,:category_id)\n";
        try(Connection conn = DbUtils.getConnection())
        {
            conn.createQuery(query)
                    .addParameter("editor_id",c.getEditor_id())
                    .addParameter("category_id",c.getCategory_id())
                    .executeUpdate();
        }
    }
    public static List<Editor_manage_categories> listCateByIdUser(int editor_id)
    {
        final String query = "SELECT id,category_id,editor_id, categories.`name` FROM `editor_manage_categories`\n" +
                "INNER JOIN categories ON editor_manage_categories.category_id = categories.categories_id \n" +
                "WHERE editor_id = :editor_id GROUP BY category_id";
        try(Connection conn = DbUtils.getConnection())
        {
            return conn.createQuery(query)
                    .addParameter("editor_id",editor_id)
                    .executeAndFetch(Editor_manage_categories.class);
        }
    }
    public static void DeleteEditorManage (int id)
    {
        final String query ="DELETE FROM editor_manage_categories WHERE id = :id";
        try(Connection con = DbUtils.getConnection())
        {
                con.createQuery(query)
                    .addParameter("id",id)
                    .executeUpdate();
        }
    }
    public static void DeleteByUserId(int editor_id)
    {
        final String query = "DELETE FROM editor_manage_categories WHERE editor_id = :editor_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("editor_id",editor_id)
                    .executeUpdate();

        }
    }
    public static void DeleteByCate(int category_id)
    {
        final String query = "DELETE FROM editor_manage_categories WHERE category_id = :category_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("category_id",category_id)
                    .executeUpdate();

        }
    }
}
