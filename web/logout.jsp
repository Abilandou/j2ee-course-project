<%-- 
    Document   : logout
    Created on : Jun 11, 2019, 5:25:46 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% 
            session.invalidate();
            response.sendRedirect("./index.jsp");
        %> 
    </body>
</html>
