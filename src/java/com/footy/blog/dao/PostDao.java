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
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list=new ArrayList<>();
        
        try {
            
            String q = "select * from categories";
            Statement st= this.con.createStatement();
            ResultSet set =st.executeQuery(q);
            
            while (set.next())
            {
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                Category c= new Category(cid, name, description);
                list.add(c);
            }    
        } catch(Exception e) {
            e.printStackTrace();
        }
    
        return list;
    }

    
    public boolean savePost(Post p) {
        boolean f = false;
        try {
            
            String q="insert into posts(pTitle, pContent, pPic, catId, pPublisher) values (?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpPic());
            pstmt.setInt(4, p.getCatId());
            pstmt.setString(5, p.getpPublisher());
            pstmt.executeUpdate();
            f = true; 
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return f;
    }
    
    // get all the posts
    
    public List<Post> getAllPosts() {
        // fetch all the posts
        List<Post> list = new ArrayList<>();
        
        try {
            
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            
            ResultSet set = p.executeQuery();
            
            while(set.next()) {
                
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        // fetch all post by id
        
        
        try {
            
            PreparedStatement p = con.prepareStatement("select * from posts where catId = ? order by pid desc");
            p.setInt(1, catId);
            
            ResultSet set = p.executeQuery();
            
            while(set.next()) {
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                String pPublisher = set.getString("pPublisher");
                Post post = new Post(pid, pTitle, pContent, pPic, date, catId, pPublisher);
                
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postId) {
        
        Post post =null;
        String q = "select * from posts where pid=?";
        try {
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, postId);
        
        ResultSet set = p.executeQuery();
        
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
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
