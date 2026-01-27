/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.footy.blog.dao;

import com.footy.blog.entities.Category;
import com.footy.blog.entities.Post;
import java.sql.*;
import java.util.*;

public class PostDao {
    
    private final Connection con; // Use final to ensure it's not accidentally changed

    public PostDao(Connection con) {
        this.con = con;
    }

    // Get all categories
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        String q = "select * from categories";

        // UPDATED: Use try-with-resources to automatically close Statement and ResultSet
        try (PreparedStatement pstmt = this.con.prepareStatement(q);
             ResultSet set = pstmt.executeQuery()) {

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Save a new post
    public boolean savePost(Post p) {
        boolean f = false;
        String q = "insert into posts(pTitle, pContent, pPic, catId, pPublisher) values (?,?,?,?,?)";

        // UPDATED: Use try-with-resources for PreparedStatement
        try (PreparedStatement pstmt = this.con.prepareStatement(q)) {
            
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpPic());
            pstmt.setInt(4, p.getCatId());
            pstmt.setString(5, p.getpPublisher());
            
            pstmt.executeUpdate();
            f = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    // Get all posts
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        String q = "select * from posts order by pid desc";

        try (PreparedStatement p = con.prepareStatement(q);
             ResultSet set = p.executeQuery()) {

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                String pPublisher = set.getString("pPublisher");

                Post post = new Post(pid, pTitle, pContent, pPic, date, catId, pPublisher);
                list.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get posts by Category ID
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        String q = "select * from posts where catId = ? order by pid desc";

        try (PreparedStatement p = con.prepareStatement(q)) {
            
            p.setInt(1, catId);
            
            try (ResultSet set = p.executeQuery()) {
                while (set.next()) {
                    int pid = set.getInt("pid");
                    String pTitle = set.getString("pTitle");
                    String pContent = set.getString("pContent");
                    String pPic = set.getString("pPic");
                    Timestamp date = set.getTimestamp("pDate");
                    String pPublisher = set.getString("pPublisher");

                    Post post = new Post(pid, pTitle, pContent, pPic, date, catId, pPublisher);
                    list.add(post);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get single post by Post ID
    public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";

        try (PreparedStatement p = this.con.prepareStatement(q)) {
            
            p.setInt(1, postId);
            
            try (ResultSet set = p.executeQuery()) {
                if (set.next()) {
                    int pid = set.getInt("pid");
                    String pTitle = set.getString("pTitle");
                    String pContent = set.getString("pContent");
                    String pPic = set.getString("pPic");
                    Timestamp date = set.getTimestamp("pDate");
                    int cid = set.getInt("catId");
                    String pPublisher = set.getString("pPublisher");

                    post = new Post(pid, pTitle, pContent, pPic, date, cid, pPublisher);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }
}
