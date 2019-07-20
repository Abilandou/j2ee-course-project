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
        <div class="container-fluid">
            <div class="row jumbotron " style="margin-top: 20px;">
                <div class="col-12 ">
                    <% 
                    try{

                        String email = (String)session.getAttribute("email");

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                        Statement stm = conn.createStatement();
                        String sql = "SELECT * FROM customers WHERE email='"+email+"'";

                        ResultSet rst = stm.executeQuery(sql);

                        if(rst.next()){
                            if ((session.getAttribute("email") != null) || (session.getAttribute("email") != "")) {
                            %>
                              <div class="col-sm-6 my-4 ">
                                  <div class="card container-fluid">
                                   <h5 class="orange-text text-darken-4 text-center card z-depth-3 bg-info">Personal Information</h5>
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
                                  
                                  <%
                                    if(Integer.parseInt(rst.getString("has_room")) == 1){
                                       %>
                                       <div class="card">
                                           <div class="container-fluid">
                                           <form action="./meals/HandleGuestOrder.jsp" method="post"  id="addRoom2_form">
                                               <div class="form-group">
                                                      <% 
                                                         try{
                                                             
                                                            int gstid = Integer.parseInt(rst.getString("id"));
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection connm = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                            Statement sttm = connm.createStatement();
                                                            String sqlt = "SELECT * FROM reserve INNER JOIN rooms ON reserve.room_id = rooms.id INNER JOIN customers ON reserve.customer_id = customers.id WHERE customer_id='"+gstid+"'";

                                                            ResultSet rs = sttm.executeQuery(sqlt);

                                                            while(rs.next()){
                                                                %>
                                                                <h5 class="orange-text text-darken-4 text-center card z-depth-3">Room Information</h5>
                                                                <p>Room Name:<b><%=rs.getString("rooms.name")  %></b> </p>
                                                                <p>Room Number:<b><%=rs.getString("rooms.number")  %></b> </p>
                                                                <p>Cost Per Day(FCFA):<b><%=rs.getString("rooms.price")  %></b> </p>
                                                                <input type="hidden" value="<%=rs.getString("reserve.room_id")%>" name="room_id" />
                                                                <%
                                                            }
                                                            }catch(Exception e){
                                                                out.println(e);
                                                            }
                                                       %>
                                                
                                              </div>
                                                  <div class="form-group">
                                                      <% 
                                                         try{
                                                             
                                                            int gestid = Integer.parseInt(rst.getString("id"));
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection connm = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                            Statement sttm = connm.createStatement();
                                                            String sqlt = "SELECT * FROM reserve INNER JOIN rooms ON reserve.room_id = rooms.id INNER JOIN customers ON reserve.customer_id = customers.id WHERE customer_id='"+gestid+"'";

                                                            ResultSet rs = sttm.executeQuery(sqlt);

                                                            if(rs.next()){
                                                                %>
                                                                <input type="hidden" value="<%=rs.getString("reserve.customer_id")%>" name="guest_id" />
                                                                <%
                                                            }else{
                                                            }
                                                            }catch(Exception e){
                                                                out.println(e);
                                                            }
                                                       %>
                                              </div>
                                              <h5 class="orange-text text-darken-4 text-center card z-depth-3">Meal Order</h5>
                                              
                                              <!--Updating has_order to 1 in customers table after customer makes meal order-->
                                                 <%   
                                                    int customer_id = Integer.parseInt(rst.getString("id"));

                                                     try{
//                                                         Class.forName("com.mysql.jdbc.Driver");
//                                                         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                     Statement statement = conn.createStatement();
                                                     String query = "UPDATE customers SET has_order='"+1+"' WHERE id='"+customer_id+"'";
                                                     int i = statement.executeUpdate(query);

                                                     if(i == 1){
                                                       
                                                     }
                                                     }catch (Exception e){
                                                         e.printStackTrace();
                                                     }
                                                 %>

                                              <%
                                                  int has_order =Integer.parseInt(rst.getString("has_order"));
                                                  int seen =Integer.parseInt(rst.getString("seen"));
                                              if((seen == 0) && (has_order == 1) ){
                                                  %>
                                                  <p class="green-text text-darken-4">Success Your Order has been received</p>
                                                  <%
                                              }else if(has_order == 2){
                                                %>
                                                <p class="green-text text-darken-4">Order Has Been Accepted And it is in Process, Please Be Patient</p>
                                                <%
                                                }else if (seen == 1){
                                                    %>
                                                    <p class="green-text text-darken-4">You just confirmed That you received your meal, enjoy your meal.</p>
                                                    <%
                                                }
                                                  %>
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
                                                  <input 
                                                      class="form-control" 
                                                      type="number" name="number_of_plates" 
                                                      id="num_plates" 
                                                      min="1"
                                                      required
                                                  >
                                              </div> 
                                              <div class="form-group">
                                                  <input
                                                      class="form-control" 
                                                      type="hidden" name="amount_per_plate" 
                                                      id="amount_plates" 
                                                      value="1000"
                                                      required
                                                  >
                                              </div>
                                              <input type="hidden" name="total_amount" value="total_amount">
                                             <div class="form-group">
                                                 <input type="submit" name="mealOrderBut" value="Confirm Order" class="btn pull-right">
                                             </div>
                                              <br/>
                                           </form>
                                       </div>
                                        <div class="container-fluid">
                                            <h5 class="orange-text text-darken-4 text-center card z-depth-3">Confirmation</h5>
                                            <p>Please Click The Button below to confirm that the meal you requested has been delivered.</p>
                                            <a href="./meals/meal_confirm.jsp?uid=<%=rst.getString("id")%>" class="btn right">Confirm</a>
                                        </div>
                                       </div>
                                       <%
                                   }else {
                                     %>
                                     <p class="green-text"><b>Please Be Patient for A room to be assigned to you to see other information.</b></p>
                                     <%
                                   }
                                  %>
                              </div>
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
             </div>
            </div>
        </div>
    <div class="row-fluid" style="margin-top: 80px;">
     <%@include file="includes/footer.jsp"  %>
    </div>
   </body>
</html>
