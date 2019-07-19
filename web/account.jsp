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
         <%@page import="java.sql.*"%>
        <title>account</title>
    </head>
    <body>
        
        <% 
            try{
                
                String email = (String)session.getAttribute("email");
                
               Class.forName("com.mysql.jdbc.Driver");
               Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
               Statement stm = conn.createStatement();
               String sql = "SELECT * FROM customers WHERE email='"+email+"'";

               ResultSet rst = stm.executeQuery(sql);

               while(rst.next()){
                   if ((session.getAttribute("email") != null) || (session.getAttribute("email") != "")) {
                   %>
                   <div class="container-fluid">
                       <div class="row jumbotron " style="margin-top: 20px;">
                           <div class="col-12 ">
                               <div class="col-sm-6 my-4 ">
                                   <div class="card">
                                    <h5 class="orange-text text-darken-4 text-center card z-depth-3 bg-info">Your Information</h5>
                                    <p>Full Name:<b><%=rst.getString("first_name")  %> <%=rst.getString("last_name")  %></b></p>
                                    <p>Email:<b><%=rst.getString("email")  %></b></p>
                                    <p>City:<b><%=rst.getString("city")  %></b></p>
                                    <p>State:<b><%=rst.getString("state")  %></b></p>
                                    <p>Country:<b><%=rst.getString("country")  %></b></p>
                                    <p>Address:<b><%=rst.getString("address")  %></b></p>
                                    <p>Phone:<b><%=rst.getString("phone")  %></b></p>
                                   </div>
                               </div>
                               <div class="col-sm-6">
                                   <h5 class="orange-text text-darken-4 text-center card z-depth-3">Meal Order</h5>
                                   <%
                                    if(Integer.parseInt(rst.getString("has_room")) == 1){
                                        %>
                                        
                                        <div class="card">
                                            <form action="meal_order.jsp" method="post"  id="addRoom2_form">
                                                <div class="form-group">
                                                    <label class="text-dark">Room Name<span class="text-danger">*</span></label>
                                                    <select name="room_id" required="" class="form-control">
                                                         <option value="">Select Room</option>
                                                         <% 
                                                             try{

                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                                Statement stmt = con.createStatement();
                                                                String sqll = "SELECT * FROM rooms WHERE booked='"+1+"'";

                                                                ResultSet rs = stmt.executeQuery(sqll);

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
                                                    <label class="text-dark">Guest Name<span class="text-danger">*</span></label>
                                                    <select name="guest_id" required="" class="form-control">
                                                         <option value="">Select Guest</option>
                                                         <% 
                                                             try{

                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection connm = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                                Statement sttm = connm.createStatement();
                                                                String sqlt = "SELECT * FROM reserve";

                                                                ResultSet rs = stm.executeQuery(sqlt);

                                                                while(rs.next()){
                                                                    %>
                                                                    <option value="<%=rs.getString("id")%>"><%=rs.getString("customer_name")  %></option>
                                                                    <%
                                                                }
                                                                }catch(Exception e){
                                                                    out.println(e);
                                                                }
                                                          %>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class="text-dark">Meal Type<span class="text-danger">*</span></label>
                                                    <select name="meal_type" required="" class="form-control">
                                                         <option value=" ">Select Meal Type</option>
                                                         <option value="Break Fast" >Break Fast</option>
                                                         <option value="Launch" >Launch</option>
                                                         <option value="Supper" >Supper</option>

                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <label class="text-dark">Number Of Plates<span class="text-danger">*</span></label>
                                                    <input required 
                                                        class="form-control" 
                                                        type="number" name="number_of_plates" 
                                                        id="num_plates" 
                                                        required
                                                    >
                                                </div> 
                                                <div class="form-group">
                                                    <label class="text-dark ">Amount Per Plate<span class="text-danger">*</span></label>
                                                    <input required 
                                                        class="form-control" 
                                                        type="number" name="amount_per_plate" 
                                                        id="amount_plates" 
                                                        required
                                                    >
                                                </div>
                                                 <input type="hidden" name="total_amount" value="total_amount">
                                                <div class="form-group">
                                                    <input type="submit" name="addRoomButd" value="Confirm" class="btn pull-right">
                                                </div>
                                                 <br/>
                                            </form>
                                        </div>
                                        
                                        <%
                                    }else{
                                      %>
                                      <p class="green-text"><b>Please Be Patient for A room to be assigned to you before you can see what is on the menu.</b></p>
                                      <%
                                    }
                                        
                                   %>
                               </div>
                           </div>
                           
                       </div>
                   </div>
                   <p></p>
                   <%
                   }else{
                        %>
                        You are not logged in<br/>
                        <a href="index.jsp">Please Login</a>
                        <%
                    }
               }

               }catch(Exception e){
                   out.println(e);
               }
         %>
        
        <div class="row-fluid" style="margin-top: 80px;">
         <%@include file="includes/footer.jsp"  %>
        </div>
    </body>
</html>
