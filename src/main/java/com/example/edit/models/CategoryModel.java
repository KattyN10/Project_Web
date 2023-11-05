package com.example.edit.models;

import com.example.edit.Utils.DbUtils;
import com.example.edit.beans.Category;
import org.sql2o.Connection;

import java.util.List;

public class CategoryModel {
    //Tìm tất cả danh mục không có parentId
    public static List<Category> findAll() {
        final String query = "SELECT * FROM categories WHERE parent_id  is  null";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static List<Category> findAllIn() {
        final String query = "SELECT * FROM categories";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    // Tìm danh mục con của một danh mục
    public static List<Category> findByParentId(int parent_id) {
        final String query = "SELECT * FROM categories WHERE parent_id= :parent_id ";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("parent_id",parent_id)
                    .executeAndFetch(Category.class);
        }
    }

    public static List<Category> find5Cate() {
        final String query = "SELECT * FROM categories ORDER BY categories_id  LIMIT 0,4";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static List<Category> find4Cate() {
        final String query = "SELECT * FROM categories ORDER BY categories_id  LIMIT 0,4";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    // Tìm danh mục con của một danh mục
    public static List<Category> getCateChilds(int categories_id) {
        final String query = "SELECT * FROM categories WHERE parent_id = :categories_id";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("categories_id",categories_id)
                    .executeAndFetch(Category.class);
        }
    }
    //Check xem có Category con ko
    public static boolean checkCate(int cateId) {
        String query = "SELECT * FROM categories WHERE parent_id = :cateId";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("cateId", cateId)
                    .executeAndFetch(Category.class);
            if (list.size() == 0) {
                return false;
            }
            return true;
        }
    }
    //Lấy danh mục theo category Id
    public static List<Category> getCateByID(int cateId) {
        final String query = "SELECT * FROM categories WHERE categories_id = :cateId LIMIT 1";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("cateId",cateId)
                    .executeAndFetch(Category.class);
        }
    }
    public static Category findCateById(int categories_id) {
        final String query = "SELECT * FROM categories WHERE categories_id = :categories_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("categories_id", categories_id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static void addCate(Category category)
    {
        final String query = "INSERT INTO categories (name) VALUES (:name)";
        try(Connection con = DbUtils.getConnection()){
                        con.createQuery(query)
                    .addParameter("name", category.getName())
                    .executeUpdate();

        }
    }
    public static void addCateCon(Category category)
    {
        final String query = "INSERT INTO categories (name,parent_id) VALUES (:name,:parent_id)";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("name", category.getName())
                    .addParameter("parent_id",category.getParent_id())
                    .executeUpdate();

        }
    }

    public static void updateCate(Category category)
    {
        final String query = "UPDATE categories SET  name = :name WHERE categories_id = :categories_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("categories_id",category.getCategories_id())
                    .addParameter("name", category.getName())
                    .executeUpdate();

        }
    }
    public static void deleteCate(int categories_id)
    {
        final String query = "DELETE FROM categories WHERE categories_id = :categories_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("categories_id",categories_id)
                    .executeUpdate();

        }
    }
    public static void deleteCateCon(int parent_id)
    {
        final String query = "DELETE FROM categories WHERE parent_id = :parent_id";
        try(Connection con = DbUtils.getConnection()){
            con.createQuery(query)
                    .addParameter("parent_id",parent_id)
                    .executeUpdate();

        }
    }
    public static Category findCatByName(String name) {
        final String query = "SELECT * FROM categories WHERE name = :name";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("name", name)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static List<Category> findAllCat() {
        final String query = "SELECT * FROM categories ";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .executeAndFetch(Category.class);
        }
    }
    public static List<Category> findCatCon(int parent_id) {
        final String query = "SELECT * FROM categories WHERE parent_id = :parent_id";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query)
                    .addParameter("parent_id",parent_id)
                    .executeAndFetch(Category.class);
        }
    }

}
