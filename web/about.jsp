<%-- 
    Document   : about
    Created on : 23-Jun-2023, 6:47:17 pm
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
            .banner-background {
            clip-path: polygon(0 0, 100% 0, 100% 100%, 69% 92%, 25% 100%, 0 93%);
        } 
        .about-us {
            margin: 75px;
            font-weight: 100;
            font-size: 20px;
        }
        </style>  
    </head>
    <body>
        
      
  
        <!-- navbar  -->
        <%@include file="navbar.jsp" %>
        
        <div class="container-fluid p-0 m-0">
            
            <div class="jumbotron bg-primary banner-background" style="border-radius:0rem;">
                <div class="container text-white">
                    <h3 class="display-3 font-weight-bold">About Footy Blog</h3>
                    <p>We're glad, you came here to know about our Footy Blog site.</p>
                </div>
            </div>
        </div>
        
        
        <p class="about-us">
            Welcome to our Footy Blog!

            At our Footy Blog, we are passionate about the beautiful game and dedicated to providing you with the latest news, insightful analysis, 
            
            and engaging content about football from around the world. Our goal is to create a platform where football enthusiasts like you can immerse 
            
            yourself in the exciting world of the sport. Whether you are a die-hard fan, a casual supporter, or just curious about the game, we've got 
            
            you covered. Stay up to date with the latest match reports, transfer rumors, and team updates from top leagues such as the English Premier 
            
            League, La Liga, Serie A, Bundesliga, and more. We strive to bring you comprehensive coverage, highlighting key moments, memorable goals, 
            
            and thrilling rivalries. But our Footy Blog is more than just news and updates. We delve deeper into the game with in-depth analysis, 
            
            tactical breakdowns, and thought-provoking opinion pieces. We also celebrate the rich history and culture of football, 
            
            exploring iconic moments, legendary players, and memorable tournaments. From World Cup classics to unforgettable Champions League finals, 
            
            we relive the magic and nostalgia that has shaped the sport. We encourage interaction and welcome your thoughts, opinions, and comments. Our 
            
            Footy Blog is a community where football fans from all walks of life can come together to discuss matches, share their views, and connect 
            
            with like-minded individuals who share a common love for the game.

            So, whether you're here for the latest transfer news, tactical breakdowns, or simply to relish in the excitement of football, we invite you 
            
            to join us on this incredible journey.

            Thank you for visiting our Footy Blog, and we hope you enjoy the content we have prepared for you. Let's kick off and celebrate the beautiful
            
            game together!
        </p>
        
        <!-- include modal file -->
        
        <%@include file="modal.jsp" %>
        
        <!-- include footer file -->
        
        <%@include file="footer.jsp" %>
        
    </body>
</html>


