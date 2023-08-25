<%-- 
    Document   : home
    Created on : 27-May-2023, 6:04:32 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.footy.blog.helper.ConnectionProvider" %>
<%@page import="com.footy.blog.dao.PostDao" %>
<%@page import="com.footy.blog.entities.Category" %>
<%@page import="com.footy.blog.entities.Post" %>

<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footy Blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
        <style>
            .post-image {
                max-height: 180px;
                max-width: 350px;
            }
            #sidebar {
                position: fixed;
            }
            .display-3 {
                margin-bottom: 15rem;
            }
        </style>
    </head>
    <body>
               
    <!-- navbar  -->
    <%@include file="navbar.jsp" %>
        
    <!-- main body of the page -->

    <main>
        <div class="container">
            <div class="row mt-5">
                <!-- first col -->
                <div class="col-md-4">
                <!-- categories-->
                    <div class="list-group" id="sidebar">
                        <a onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
                          All posts
                        </a>
                        <!-- Categories -->
                        
                        <%
                            PostDao d = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list1 =d.getAllCategories();
                            for (Category cc :list1 ) {
                                                      
                        %>
                        
                        <a onclick="getPosts(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                              
                        <% } %>        
                        
                    </div>
                </div>
                
                <!-- second col-->
                <div class="col-md-8">
                    <div class="container text-center" id="loader">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>
                    
                    <div class="container-fluid" id="post-container">
                        
                    </div>
                    
                </div>
            </div>            
        </div>
    </main>    
 
        <!-- include modal file -->
        
        <%@include file="modal.jsp" %>
                                
        <!-- loading post using ajax -->
        <script>
            
            function getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();     
                
                $(".c-link").removeClass('active')
                
                
                $.ajax({
                    url: "loadposts.jsp",
                    data: {cid: catId},
                    success: function(data) {
                        console.log(data);
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active')
                    }
                })               
            }
            
            $(document).ready(function (e) {
                
                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)               
            })
            
        </script>

        <!-- include footer file -->
        
        <%@include file="footer.jsp" %>
        
    </body>    
 </html>        
  
    
    

