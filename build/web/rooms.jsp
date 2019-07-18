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
                            <img style="margin:20px;" src="hotel1.png" alt=""/>
                        </a>
                    </div>
                    </div>
                    <div class="col-sm-7">
                         <h2 class="card-title mt-4 text-darken-4" style="margin-left:50px;"><%=resultSet.getString("name")  %></h2>
                        <div class="divider"></div>
                        <div class="col-sm-8 mt-2">
                            <p> 
                                FCFA<b class="orange-text"><%=resultSet.getString("price")  %></b>
                                <i class="right">Category: <b class="orange-text"><%=resultSet.getString("category")  %></b></i>
                            </p><br/>
                            <p style="text-align:justify"><%=resultSet.getString("description")  %></p><br/>
                            <a href="./room_details.jsp?uid=<%=resultSet.getString("id")  %>" class="btn btn-danger mr-2 right">Learn More<i class="material-icons prefix"></i></a>
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
