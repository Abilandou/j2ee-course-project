<%-- 
    Document   : account.jsp
    Created on : May 2, 2019, 4:40:45 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/header.jsp"  %>
         <%@include file="AllIncludes.jsp" %>       
        <title>account</title>
    </head>
    <body>
        
        <%
            if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
        %>
            You are not logged in<br/>
            <a href="index.jsp">Please Login</a>
        <%} else {
        %>
            Welcome <%=session.getAttribute("email")%>
            <a href='logout.jsp'>Log out</a>
        <%
            }
        %>
        
        
        <h1>Welcome to the account page</h1>
    </body>
    <%@include file="includes/footer.jsp"  %>
</html>
