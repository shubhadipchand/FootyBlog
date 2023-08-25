/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.footy.blog.entities;

import java.sql.*;


public class Post {
    private int pid;
    private String pTitle;
    private String pContent;
    private String pPic;
    private Timestamp pDate;
    private int catId;
    private String pPublisher;

    public Post() {
    }

    public Post(int pid, String pTitle, String pContent, String pPic, Timestamp pDate, int catId, String pPublisher) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.pPublisher = pPublisher;
    }

    public Post(String pTitle, String pContent, String pPic, Timestamp pDate, int catId, String pPublisher) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pPic = pPic;
        this.pDate = pDate;
        this.catId = catId;
        this.pPublisher = pPublisher;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    
    public String getpPublisher() {
        return pPublisher;
    }
    
    public void setpPublisher() {
        this.pPublisher = pPublisher;
    }
     
}
