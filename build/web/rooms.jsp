<%-- 
    Document   : rooms
    Created on : May 3, 2019, 4:37:28 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/header.jsp"  %>
        <%@include file="AllIncludes.jsp" %>
        <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        
        <title>rooms</title>

    </head>
<body>
<div class="container-fluid" style="margin-left: 70px;">
    <div class="row">
        <div class="col-sm-12">
            <div>
                <h4 class="center-align">REST ASSURED</h4>
                <div class="divider"></div>
                <br><br>
                
                <span style="font-family: Times New Roman; font-size: 17px; padding-bottom: 10px; text-align:justify" class="text-justify">
                    Our Hotel is found in a city that never sleeps, but surely you will 
                    want to catch a few winks between activities. The Beautiful hotel 
                    rooms and suites at <b title="Home page" ><a href="./index.jsp" class="pink-text">CEF502 Hotel</a></b> are comfortable, neat, 
                    and updated in a contemporary style. Guests rave about our 
                    sumptuous pillow-top mattresses, down comforters and pillows,
                    and Egyptian cotton sheets. (Hypoallergenic bedding is 
                    available on request.) Modern luxuries surround you, 
                    including a high-definition flat-screen TV, iPod docking 
                    station, and high-speed Internet access (surcharge may apply).
                    You will be sure to sleep soundly, as our <b title="Home page" ><a href="./index.jsp" class="pink-text">CEF502 Hotel</a></b> is 
                    amazingly quiet despite the fact that it is found in a busy city.
                    And before you head out in the morning, the weather status 
                    display on your floor will tell you if it’s an umbrella, 
                    gloves, or flip-flops kind of day before you even step outside.
                    <br><br>
                    
                    Please note that our rooms are Well secured and are compliant under the 
                    Department of Justice and Law. So, we invite you to freely book a room
                    in this hotel and be rest assured that your security is guaranteed.
                </span>
            </div><br>
            <div class="divider"></div>
            <br>
            
          <div class="col-12>
            <%   
               String id = request.getParameter("id");

                try{
                    Class.forName("com.mysql.jdbc.Driver");
                }catch (ClassNotFoundException e){
                    e.printStackTrace();
                }

                Connection conn = null;
                Statement statement = null;
                ResultSet resultSet = null;
            %>
            <%

                try{
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                    statement = conn.createStatement();
                    String sql = "SELECT * FROM rooms";

                    resultSet = statement.executeQuery(sql);

                    while(resultSet.next()){

            %>
            <div class="">
            <div class="row card">
                <div class="col-12">
                    <div class="col-sm-5">
                    <div class="card-image waves-effect waves-block waves-light">
                        <a href="./room_details.jsp?uid=<%=resultSet.getString("id")  %>" id="add-to-card-button">
                            <div>
                            <%
                                  if(Integer.parseInt(resultSet.getString("id")) == 1){
                                      %>
                                      <img src="images/rooms/room1.jpg" alt=""/>
                                      <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 2){
                                    %>
                                    <img src="images/rooms/room2.jpeg" alt=""/>
                                    <%
                                  }
                                  else if(Integer.parseInt(resultSet.getString("id")) == 3){
                                    %>
                                    <img src="images/rooms/room3.jpeg" alt=""/>
                                    <%
                                  }
                                    else if(Integer.parseInt(resultSet.getString("id")) == 4){
                                    %>
                                    <img src="images/rooms/room4.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 5){
                                    %>
                                    <img src="images/rooms/room5.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 6){
                                    %>
                                    <img src="images/rooms/room6.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 7){
                                    %>
                                    <img src="images/rooms/room7.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 8){
                                    %>
                                    <img src="images/rooms/room8.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 9){
                                    %>
                                    <img src="images/rooms/room9.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 10){
                                    %>
                                    <img src="images/rooms/room10.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 11){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 12){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 13){
                                    %>
                                    <img src="images/rooms/room13.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 14){
                                    %>
                                    <img src="images/rooms/room14.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 15){
                                    %>
                                    <img src="images/rooms/room15.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 16){
                                    %>
                                    <img src="images/rooms/room16.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 17){
                                    %>
                                    <img src="images/rooms/room17.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 18){
                                    %>
                                    <img src="images/rooms/room18.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 19){
                                    %>
                                    <img src="images/rooms/room19.jpeg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 20){
                                    %>
                                    <img src="images/rooms/room20.jpeg" alt=""/>
                                    <%
                                  }
                              %>
                            </div>
                        </a>
                    </div>
                    </div>
                    <div class="col-sm-7">
                        <p class="right" style="margin-top:50px;"><b class="indigo-text">Reviews...</b></p>
                        <img src="Admin/images/rooms/star.png" style="margin-top:55px;" class="right" alt=""/>
                         <h2 class="card-title mt-4 text-darken-4" style="margin-left:50px;"><%=resultSet.getString("name")  %><img src="Admin/images/rooms/star.png" alt=""/><img src="Admin/images/rooms/star.png" alt=""/></h2>
                         
                         
                        <div class="divider"></div>
                        <div>
                            <p> 
                                 <b class="orange-text">FCFA<%=resultSet.getString("price")  %></b>
                                <i class="right">Category: <b class="orange-text"><%=resultSet.getString("category")  %></b></i>
                            </p><br/>
                            <p style="text-align:justify"><%=resultSet.getString("description")  %></p><br/>
                            <a href="./room_details.jsp?uid=<%=resultSet.getString("id")  %>" class="btn indigo mr-2 right">Learn More<i class="material-icons prefix"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <%
                    }//End while loop
                }catch(Exception e){
                    e.printStackTrace();
                }

            %>  
    </div>
   </div>
 </div>
<div class="row-fluid">
  <%@include file="includes/footer.jsp"  %>
</div>

</body>
</html>
