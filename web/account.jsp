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
        <div class="left" style="margin: 30px; border-radius: 8px;" >
            <p class="">Welcome <%=session.getAttribute("email")%></p>
        </div>
            
        <%
            }
        %>
        <br/><br/><br/><br/>
        
        <div class="jumbotron center-align">
            <h5>Welcome to the account page</h5><br/>
            <p class="bg-info" >Page Still under development</p>
        </div>
        
        <div class="row-fluid" style="margin-top: 80px;">
         <%@include file="includes/footer.jsp"  %>
        </div>
    </body>
</html>
