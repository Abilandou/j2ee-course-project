<%-- 
    Document   : handleViewCustomers
    Created on : May 3, 2019, 6:53:35 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502 Hotel Admin | Guest Detail</title>
    </head>
 <body>
    <!-- All includes --> 
    <%@include file="AllAdminIncludes.jsp"  %>

    <!--top-Header-menu-->
    <div>
      <%@include file="./includes/admin_header.jsp" %>
    </div>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-1"><%@include file="./includes/admin_sidebar.jsp" %></div>
            <div class="col-md-11">
                <%
                                   try{
                                      Class.forName("com.mysql.jdbc.Driver");
                                  }catch (ClassNotFoundException e){
                                      e.printStackTrace();
                                  }

                                  Connection con = null;
                                  Statement statemnt = null;
                                  ResultSet rs = null;

                                   String gestid = request.getParameter("uid");
                                     try{
                                         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                         statemnt = con.createStatement();
                                          String querry = " SELECT * FROM customers  WHERE id='"+gestid+"'";
                                         rs = statemnt.executeQuery(querry);

                                        if(rs.next()){
                                %>
                                <h5>Detail Information for: <b class="teal-text text-darken-4"><%=rs.getString("first_name")%> <%=rs.getString("last_name")%></b></h5>
                                <%
                                    }//End if
                                    else{
                                        %>
                                        <p class="red-text">No Guest Name Make sure your server is connected</p>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }

                                %>
                <div class="divider"></div><br/>

                <div class="card z-depth-2">
                    
                <div class="card-content">
                    <div class="row">
                        <div class="col-12">
                            <div class="col-sm-4">
                                  <!--Guest information based on customer's table-->
                                  
                                 <h5 class="orange-text text-darken-4">Personal Information</h5>
                              
                                <%
                                   try{
                                      Class.forName("com.mysql.jdbc.Driver");
                                  }catch (ClassNotFoundException e){
                                      e.printStackTrace();
                                  }

                                  Connection conn = null;
                                  Statement statement = null;
                                  ResultSet rst = null;

                                   String guestid = request.getParameter("uid");
                                     try{
                                         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                         statement = conn.createStatement();
                                          String querry = " SELECT * FROM customers  WHERE id='"+guestid+"'";
                                         rst = statement.executeQuery(querry);

                                        if(rst.next()){
                                %>
                                <p>Full Name: <%=rst.getString("first_name")%> <%=rst.getString("last_name")%></p>
                                <p>Email:<%=rst.getString("email")  %></b></p>
                                <p>City:<%=rst.getString("city")  %></p>
                                <p>State:<%=rst.getString("state")  %></p>
                                <p>Country:<%=rst.getString("country")  %></p>
                                <p>Address:<%=rst.getString("address")  %></p>
                                <p>Phone:<%=rst.getString("phone")  %></p>
                                <%
                                    }//End if
                                    else{
                                        %>
                                        <p class="red-text">No Information for this Guest Make sure your server is connected</p>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }

                                %>
                            </div>
                            <div class="col-sm-4">
                                <!--Gues information based on meals table-->
                                <h5 class="orange-text text-darken-4">Meals Information</h5>
                                <%
                                  try{
                                     Class.forName("com.mysql.jdbc.Driver");
                                 }catch (ClassNotFoundException e){
                                     e.printStackTrace();
                                 }

                                  String guest_id = request.getParameter("uid");
                                        try{
                                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                            statement = conn.createStatement();
                                             String querry1 = " SELECT * FROM meals INNER JOIN rooms ON meals.room_id = rooms.id INNER JOIN customers ON meals.guest_id = customers.id WHERE guest_id='"+guest_id+"'";
                                            rst = statement.executeQuery(querry1);

                                            if(rst.next()){
                                            %>
                                            <p>Meal Type: <b><%=rst.getString("meals.meal_type")%></b></p>
                                            <p>Number Of Plates:<b> <%=rst.getString("meals.number_of_plates")%></b></p>
                                            <p>Amount Per Plate: <b><%=rst.getString("meals.amount_per_plate")%></b></p>
                                            <p>Total Amount: <b><%=rst.getString("meals.total_amount")%></b></p>
                                            <%
                                        }//End if 
                                         else{
                                        %>
                                        <p class="green-text">No Meals Information for this Guest. Assign or wait for guest to book room and and make meal order.</p>
                                        <%
                                        }   
                                        }catch(Exception e){
                                            out.println(e);
                                        }

                                    %>
                            </div>
                            <div class="col-sm-4">
                                <!--Gues information based on meals table-->
                                <h5 class="orange-text text-darken-4">Reservation Information</h5>
                                <%
                                  try{
                                     Class.forName("com.mysql.jdbc.Driver");
                                 }catch (ClassNotFoundException e){
                                     e.printStackTrace();
                                 }

                                  String gstid = request.getParameter("uid");
                                        try{
                                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                            statement = conn.createStatement();
                                             String querry1 = " SELECT * FROM reserve INNER JOIN rooms ON reserve.room_id = rooms.id INNER JOIN customers ON reserve.customer_id = customers.id WHERE customer_id='"+gstid+"'";
                                            rst = statement.executeQuery(querry1);

                                            if(rst.next()){
                                            %>
                                            <p>Room Name: <b><%=rst.getString("rooms.name")%></b></p>
                                            <p>Room Number: <b><%=rst.getString("rooms.number")%></b></p>
                                            <p>CheckIn/Time: <b><%=rst.getString("reserve.check_in")%>/<%=rst.getString("reserve.from_time")%></b></p>
                                            <p>CheckOut/Time: <b><%=rst.getString("reserve.check_out")%>/<%=rst.getString("reserve.to_time")%></b></p>
                                            <p>Adults: <b><%=rst.getString("reserve.adults")%></b></p>
                                            <p>Children: <b><%=rst.getString("reserve.children")%></b></p>
                                            <%
                                        }//End if
                                         else{
                                        %>
                                        <p class="green-text">No Reservation Information for this Guest. Assign room or wait for guest to book room to view information.</p>
                                        <%
                                        }   
                                        }catch(Exception e){
                                            out.println(e);
                                        }

                                    %>
                            </div>
                </div>
                </div>
            </div>        
        </div>
    </div>
        </div>
    </div>
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
</body>
</html>

