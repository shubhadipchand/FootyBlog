<%@page import="com.footy.blog.entities.Post" %>
<%@page import="java.util.List" %>
<%@page import="com.footy.blog.helper.ConnectionProvider" %>
<%@page import="com.footy.blog.dao.PostDao" %>



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
    <div class="card mb-3">
        <img class="card-img-top post-image" src="blogpics/<%= p.getpPic() %>" alt="Title image">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent().substring(0, 100) %>...</p>
        </div>
        
        <div class="card-footer">
            <a href="blogspage.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn">Read More...</a>
        </div>
    </div>
</div>

<%   
    }  
%>

</div>