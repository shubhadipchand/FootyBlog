<%-- 
    Document   : blogspage
    Created on : 22-Jun-2023, 3:20:10 pm
    Author     : shubh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.footy.blog.helper.ConnectionProvider" %>
<%@page import="com.footy.blog.dao.PostDao" %>
<%@page import="com.footy.blog.entities.Category" %>
<%@page import="com.footy.blog.entities.Post" %>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));

        PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    Post p = d.getPostByPostId(postId);    

%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-image {
                max-height: 500px;
                max-width: 700px;
            }
            .post-title {
                font-weight: bold;
                font-size: 35px;
            }
            .post-content {
                font-weight: 100;
                font-size: 20px;
            }
            .post-info {
                font-weight: bold;
                font-style: italic;
                border: 1px solid #e2e2e2;
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
        
        <!-- navbar  -->
        
        <%@include file="navbar.jsp" %>
        
        
        <!-- main content of the body -->
        
        <div class="container">
            
            <div class="row my-4">
                
                <div class="col-md-8 offset-md-2">
                    
                    <div class="card">
                        
                        <div class="card-header bg-warning text-black">
                            
                            <h1 class="post-title"><%= p.getpTitle() %></h1>
                            
                        </div>
                            
                        <div class="card-body">
                            
                            <img class="card-img-top my-2 post-image" src="blogpics/<%= p.getpPic() %>" alt="Title image">
                            
                            
                            <div class="row my-2 post-info">
                                <div class="col-sm-8">
                                    <p>Posted by <%= p.getpPublisher() %></p>
                                </div>
                                
                                <div class="col-sm-4">
                                    <p class=""><%= p.getpDate().toLocaleString() %></p>
                                </div>
                            </div>
                               
                            
                            
                            <p class="post-content"><%= p.getpContent() %></p>
                                
                        </div>    
                                
                        <div class="card-footer bg-primary">
                        
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                            <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>12</span></a>
                            
                        </div>    
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
        <!-- end of main content -->
 

        <!-- include modal file -->        
        
        <%@include file="modal.jsp" %>
       
        
    </body>
</html>
