<%-- 
    Document   : search.jsp
    Created on : May 25, 2019, 11:03:40 AM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/header.jsp"  %>
        <%@include file="AllIncludes.jsp" %>
        <title>search</title>
    </head>
<body>
        <p><b>Search Result</p>
        <div class="divider"></div>

        <%
            String category = request.getParameter("q");
            String date_free = request.getParameter("q");
            String time_free = request.getParameter("q");
          String str = request.getParameter("hid");
           String strt = request.getParameter("uid");
           
        try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = conn.createStatement();
            String query = "SELECT * FROM  rooms WHERE  category like '%"+ category +"%' OR date_free like '%"+ date_free +"%' OR time_free like '%"+ time_free +"%';";
            ResultSet rs = stat.executeQuery(query);
            while(rs.next()){
               if(rs.next()){
                %>
                
                <!--<div class="container">-->
                    <div class="card hoverable mx-1 col-sm-4"  style="width:350px; height:450px; margin-right: 15px;">
                        <div class="card-image waves-effect waves-block waves-light">
                            <a href="./room_details.jsp?uid=<%=rs.getString("id")  %>" id="add-to-card-button">
                                <div>
                            <%
                                  if(Integer.parseInt(rs.getString("id")) == 1){
                                      %>
                                      <img src="images/rooms/room1.jpg" alt=""/>
                                      <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 2){
                                    %>
                                    <img src="images/rooms/room2.jpeg" alt=""/>
                                    <%
                                  }
                                  else if(Integer.parseInt(rs.getString("id")) == 3){
                                    %>
                                    <img src="images/rooms/room3.jpeg" alt=""/>
                                    <%
                                  }
                                    else if(Integer.parseInt(rs.getString("id")) == 4){
                                    %>
                                    <img src="images/rooms/room4.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 5){
                                    %>
                                    <img src="images/rooms/room5.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 6){
                                    %>
                                    <img src="images/rooms/room6.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 7){
                                    %>
                                    <img src="images/rooms/room7.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 8){
                                    %>
                                    <img src="images/rooms/room8.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 9){
                                    %>
                                    <img src="images/rooms/room9.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 10){
                                    %>
                                    <img src="images/rooms/room10.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 11){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 12){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 13){
                                    %>
                                    <img src="images/rooms/room13.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 14){
                                    %>
                                    <img src="images/rooms/room14.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 15){
                                    %>
                                    <img src="images/rooms/room15.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 16){
                                    %>
                                    <img src="images/rooms/room16.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 17){
                                    %>
                                    <img src="images/rooms/room17.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 18){
                                    %>
                                    <img src="images/rooms/room18.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 19){
                                    %>
                                    <img src="images/rooms/room19.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 20){
                                    %>
                                    <img src="images/rooms/room20.jpeg" alt=""/>
                                    <%
                                  }
                              %>
                            </div>
                            </a>
                        </div>
                        <div class="card-content">
                            <span class="card-title dark-text darken-4"><%=rs.getString("name")  %></span>
                            <p><i class="pink-text">FCFA<%=rs.getString("price")  %></i><i class="pull-right"><i class="material-icons prefix teal-text">category</i>:<%=rs.getString("category")  %></i></p><br/>
                            <p><%=rs.getString("description")  %></p><br>
                            <p class="mt-3"><a href="./room_details.jsp?uid=<%=rs.getString("id")  %>" class="btn mr-2">Learn More</a>
                                <a href="#" class="pull-right">Add To Whishlist</a>
                            </p>
                        </div>
                    </div>
                <!--</div>-->
                <%
                }else{
                    %>
                    <h5 class="text-capitalize text-info lead text-center">sorry No Item Found</h5>
                    <%
                }
           }
        }
       catch(Exception e){
//           response.sendRedirect("./../404.jsp");
            out.println(e);
            %>
                <!--<h5 class="text-capitalize text-info lead text-center">sorry No Item Found</h5>-->
            <%

       }
       %>

     
       <%--<%@include file="includes/footer.jsp"  %>--%>

</body>
</html>
