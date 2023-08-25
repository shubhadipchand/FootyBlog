<%-- 
    Document   : home
    Created on : 24-Jun-2023, 9:05:36 am
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="com.footy.blog.helper.ConnectionProvider" %>
<%@page import="com.footy.blog.dao.PostDao" %>
<%@page import="com.footy.blog.entities.Category" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footy Blog</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .card img {
                max-height: 300px;
                max-width: 1200px;
            }
            .container-fluid {
                position: relative;
            }

            .container-fluid img {
                transition: opacity 0.3s ease-in-out;
            }

            .container-fluid:hover img {
                opacity: 0.7; /* Adjust the opacity value as desired */
            }
            .footer-background {
                clip-path: polygon(26% 15%, 73% 8%, 100% 15%, 100% 100%, 0 100%, 0 9%);
            }
            #footer {
                text-align: center;
                padding: 7% 15%;
            }
        </style>
    </head>
    <body>
        
        <!-- include navbar file-->
        
        <%@include file="navbar.jsp" %>
        
        
        <!-- main content of the body-->
        
            <!-- main body of the page -->

    <main>
        <div class="container">
            <div class="row mt-5">
                <!-- first col -->
                
                <!-- second col-->
                    
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
                    url: "homeposts.jsp",
                    data: {cid: catId},
                    success: function(data) {
                        console.log(data);
                        $('#post-container').show();
                        $('#post-container').html(data);
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
