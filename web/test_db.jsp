<%@page import="java.sql.*"%>
<%@page import="com.footy.blog.helper.ConnectionProvider"%>
<html>
<body>
    <h2>Database Connection Test</h2>
    <%
        try {
            Connection con = ConnectionProvider.getConnection();
            if (con != null) {
                out.println("<h3 style='color:green'>Success! Connected to: " + con.getMetaData().getURL() + "</h3>");
            } else {
                out.println("<h3 style='color:red'>Failed! Connection is null. Check Logs.</h3>");
            }
        } catch (Exception e) {
            out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(new java.io.PrintWriter(out));
        }
    %>
</body>
</html>
