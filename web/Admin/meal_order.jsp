<%-- 
    Document   : add_categories.jsp
    Created on : May 3, 2019, 6:42:39 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Meal Order</title>

        <!--close-Header-part--> 
        <%@include file="AllAdminIncludes.jsp"  %>
        <%@page import="java.io.*, java.util.*, javax.servlet.*" %>
        <%@page import="java.sql.*" %>
    </head>

<body>
<!--top-Header-menu-->
<div>
  <%@include file="./includes/admin_header.jsp" %>
</div>

<!--sidebar-menu-->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-1"><%@include file="./includes/admin_sidebar.jsp" %></div>
            <div class="col-md-2"></div>
            <div class="col-md-7 card hoverable">
                <h6>Required Fields are marked(<b class="text-danger">*</b>)</h6>  
                <%
                 
               try{

                Class.forName("com.mysql.jdbc.Driver");

                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("mealOrderBut") != null){
                String room_id, guest_id, meal_type;
                String number_of_plates, amount_per_plate;
                int total_amount;
                room_id=request.getParameter("room_id");
                guest_id=request.getParameter("guest_id");
                meal_type=request.getParameter("meal_type");
                number_of_plates =request.getParameter("number_of_plates");
                amount_per_plate =request.getParameter("amount_per_plate");
                total_amount = Integer.parseInt(number_of_plates) * Integer.parseInt(amount_per_plate);
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into meals( room_id, guest_id,meal_type, number_of_plates, amount_per_plate, total_amount) values(?, ?, ?, ?, ?, ?);");
                
                preparestmnt.setString(1, room_id);
                preparestmnt.setString(2, guest_id);
                preparestmnt.setString(3, meal_type);
                preparestmnt.setString(4, number_of_plates);
                preparestmnt.setString(5, amount_per_plate);
                preparestmnt.setInt(6, total_amount);
                preparestmnt.executeUpdate(); //execute query
                
                String message = "Success In Meal Odering.";
                request.setAttribute("msg", message);
                response.sendRedirect("./meals.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
              %>  
              
                <form action="meal_order.jsp" method="post"  id="addRoom2_form">
                    <div class="form-group">
                        <label class="text-dark lead">Room Name<span class="text-danger">*</span></label>
                        <select name="room_id" required="" class="form-control">
                             <option value="">Select Room</option>
                             <% 
                                 try{

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM rooms WHERE booked='"+1+"'";

                                    ResultSet rs = stm.executeQuery(sql);

                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("id")%>"><%=rs.getString("name")  %></option>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }
                              %>

                        </select>
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Guest Name<span class="text-danger">*</span></label>
                        <select name="guest_id" required="" class="form-control">
                             <option value="">Select Guest</option>
                             <% 
                                 try{

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM customers where has_room='"+1+"'";

                                    ResultSet rs = stm.executeQuery(sql);

                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("id")%>"><%=rs.getString("first_name")  %> <%=rs.getString("last_name")  %></option>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }
                              %>

                        </select>
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Meal Type<span class="text-danger">*</span></label>
                        <select name="meal_type" required="" class="form-control">
                             <option value=" ">Select Meal Type</option>
                             <option value="Break Fast" >Break Fast</option>
                             <option value="Launch" >Launch</option>
                             <option value="Supper" >Supper</option>
                             
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label class="text-dark lead">Number Of Plates<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="number" name="number_of_plates" 
                            id="num_plates" 
                            required
                        >
                    </div> 
                    <div class="form-group">
                        <label class="text-dark lead">Amount Per Plate<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="number" name="amount_per_plate" 
                            id="amount_plates" 
                            required
                        >
                    </div>
                     <input type="hidden" name="total_amount" value="total_amount">
                    <div class="form-group">
                        <input type="submit" name="mealOrderBut" value="Confirm" class="btn pull-right">
                    </div>
                     <br/>
                </form>
            </div>
        </div>
    </div>
</div>     
        
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
