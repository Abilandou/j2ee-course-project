<%-- 
    Document   : index
    Created on : Apr 26, 2019, 4:43:45 AM
    Author     : godlove/christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="AllIncludes.jsp" %>
    <%@include file="includes/header.jsp"  %>
    <%@page import="java.sql.*" %>
    
    <title>Home</title>
</head>
<body style="border: 0;">
    
    <div class="container-fluid" style="backgroud-color:blue; margin-top:-15px; margin-right: 0px;">
    <div class="row ">
        <div class="col-md-2 col-sm-2 col-xm-2 col-lg-2 pull-left">
        
                <div class="image">
                    <img class="card" style="opacity: 0.3" src="hotel1.png" height="500" width="1230" alt="imag-loading">
                </div>
        </div>
       
        <div class="col-md-10 col-sm-10 col-xm-10 col-lg-10" style="color:black;">
            <div style="margin-top:35px; font-size:20px;">
                <p id="fbeauty"><b><i><marquee> Awesome And Beautiful Rooms For You.</marquee></i></b></p>
                <p id="sbeauty"><b><i><marquee> Awesome And Beautiful Rooms For You.</marquee></i></b></p>
            </div>
            <div class="container" style="margin-top: 80px; margin-left: 180px;">
                
                <h3 class="pink-text darken-4" >Welcome To CEF502 Hotel</h3>
                <a href="./rooms.jsp" class="btn" style="margin-left: 200px;">get started</a>
            </div>
        </div>
    </div> 
</div>
    
    <script>
        $(document).ready(function(){
            $("#sbeauty").hide();
           $("#fbeauty").fadeIn(now);
        });
    </script>
    
    <%@include file="includes/footer.jsp"  %>
</body>
        

</html>
