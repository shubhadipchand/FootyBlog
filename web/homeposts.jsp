<%-- 
    Document   : homeposts
    Created on : 24-Jun-2023, 10:54:17 am
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.footy.blog.entities.Post" %>
<%@page import="java.util.*" %>
<%@page import="com.footy.blog.helper.ConnectionProvider" %>
<%@page import="com.footy.blog.dao.PostDao" %>
<%@page import="java.text.SimpleDateFormat" %>



<div class="row">

<% 
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if (cid == 0) {
        posts = d.getAllPosts();
    } else {
        posts = d.getPostByCatId(cid); 
    }    
    
    if (posts.size() == 0) {
        out.println("<h3 class='display-3 text-center'>No Posts in this Category</h3>");
        return;
    }

    for(Post p : posts) 
    {
%>

    <div class="col-md-6 mt-2">
        <div class="card bg-dark text-white mb-3">
            <a href="blogspage.jsp?post_id=<%= p.getPid() %>">
                <img class="card-img" src="blogpics/<%= p.getpPic() %>" alt="Title image">
            <div class="card-img-overlay text-white bold">
                <h1 class="card-title"><%= p.getpTitle() %></h1>
                <p class="card-text">Posted on <%= p.getpDate().toLocaleString() %> </p>
            </div> </a>    
        </div>
    </div>
        
        
            
            
<%   
    }  
%>

</div>