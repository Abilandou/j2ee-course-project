<%-- 
    Document   : room_details.jsp
    Created on : May 25, 2019, 10:22:59 AM
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
        <title>Room detail</title>
    </head>
    <body>
        
        <%
        try{
             String strl = request.getParameter("uid");

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "SELECT * FROM rooms WHERE id="+strl;
            ResultSet rs = stat.executeQuery(query);
            if(rs.next()){
                %>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="clo-sm-3 col-md-3 col-xs-3 col-xl-3 grey lighten-4">
                                <p class="pink-text darken-2" >Why Not Show Some Love, Request to Reserve For A <a href="#" class="friendword" >Friend</a> or <a href="#" class="familyword" > Family</a></p>
                                <div class="friend" id="friend">
                                    <form method="post" action="./booking/guest_reserve.jsp">
                                        <p>Required fields are marked<b class="red-text">*</b></p>
                                        <div class="form-group">
                                            <label>Friends Name<span class="red-text">*</span></label>
                                            <input type="text" required="" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label>Email<span class="red-text">*</span></label>
                                            <input type="email" required="" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone<span class="red-text">*</span></label>
                                            <input type="text" required="" name="phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Country<span class="red-text">*</span></label>
                                            <select name="country" required="" class="form-control">
                                                 <option value="">Select Country</option>
                                                 <% 
                                                     try{

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                        Statement stm = conn.createStatement();
                                                        String sql = "SELECT * FROM countries";

                                                        ResultSet rst = stm.executeQuery(sql);

                                                        while(rst.next()){
                                                            %>
                                                            <option value="<%=rst.getString("country_name")  %>"><%=rst.getString("country_name")  %></option>
                                                            <%
                                                        }

                                                        }catch(Exception e){
                                                            out.println(e);
                                                        }
                                                  %>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Check In<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_in">
                                        </div>
                                        <div class="form-group">
                                            <label>Check_out<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_out">
                                        </div>
                                            <input type="hidden" name="determinant" value="Friend">
                                        <div class="form-group">
                                            <%
                                                if(Integer.parseInt(rs.getString("booked")) == 1 ){
                                                    %>
                                                    Cannot be Reserved, <a href="rooms.jsp" class="pink-text" >check another</a>
                                                    <%
                                                }else{
                                                    %>
                                                    For A<a href="#" class="familyword"> Family?</a>
                                                    <a href="./booking.jsp?uid=<%=rs.getString("id")  %>">
                                                        <input type="submit" 
                                                               class="btn pull-right pink " 
                                                               name="guestReserve" 
                                                               title="reserve for that special friend" 
                                                               value="Request"
                                                        >
                                                    </a>
                                                    <%
                                                }
                                            %>
                                        </div>   
                                    </form>
                                </div>
                                <div class="family" id="family">
                                    <form method="post" action="./booking/guest_reserve.jsp" >
                                        <div class="form-group">
                                            <label>Family Name<span class="red-text">*</span></label>
                                            <input type="text" required="" name="name">
                                        </div>
                                        <div class="form-group">
                                            <label>Email<span class="red-text">*</span></label>
                                            <input type="email" required="" name="email">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone<span class="red-text">*</span></label>
                                            <input type="text" required="" name="phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Country<span class="red-text">*</span></label>
                                            <select name="country" required="" class="form-control">
                                                 <option value="">Select Country</option>
                                                 <% 
                                                     try{

                                                        Class.forName("com.mysql.jdbc.Driver");
                                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                                        Statement stm = conn.createStatement();
                                                        String sql = "SELECT * FROM countries";

                                                        ResultSet rst = stm.executeQuery(sql);

                                                        while(rst.next()){
                                                            %>
                                                            <option value="<%=rst.getString("country_name")  %>"><%=rst.getString("country_name")  %></option>
                                                            <%
                                                        }

                                                        }catch(Exception e){
                                                            out.println(e);
                                                        }
                                                  %>

                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Adults<span class="red-text">*</span></label>
                                            <input type="number" required="" name="adults">
                                        </div>
                                        <div class="form-group">
                                            <label>Children</label>
                                            <input type="number" name="children">
                                        </div>
                                                  <input type="hidden" name="determinant" value="Family">
                                        <div class="form-group col-1">
                                            <label>Check In<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_in">
                                        </div>
                                        <div class="form-group col-1">
                                            <label>Check_out<span class="red-text">*</span></label>
                                            <input type="date" required="" name="check_out">
                                        </div>
                                        <div class="form-group">
                                            <%
                                                if(Integer.parseInt(rs.getString("booked")) == 1 ){
                                                    %>
                                                    Cannot be Reserved, <a href="rooms.jsp" class="pink-text" >check another</a>
                                                    <%
                                                }else{
                                                    %>
                                                    For A <a href="#" class="friendword"> Friend?</a>
                                                    <a href="./booking.jsp?uid=<%=rs.getString("id")  %>">
                                                        <input type="submit" 
                                                               class="btn pull-right pink " 
                                                               name="guestReserve" 
                                                               title="reserve for that special family" 
                                                               value="Request"
                                                        >
                                                    </a>
                                                    <%
                                                }
                                            %>
                                        </div>   
                                    </form>
                                </div>
                            </div>
                                        
                            <div class="clo-sm-1 col-md-1 col-xs-1 col-xl-1 grey lighten-4"></div>
                            <div class="col-sm-7 col-md-7 col-xs-7 col-xl-7" style="margin-left: 30px;">
                                <div class="bg-info" style="height: 50px;" >
                                    <h5 class="text-capitalize text-wrap text-dark center-align "><%=rs.getString("name")  %> </h5>
                                </div>
                                <img src="hotel1.png" alt="" height="400" width="600" style="margin-top: 5px; margin-bottom: 5px;"><br>
                                <p><b>Price:</b> <i class="pink-text">FCFA<%=rs.getString("price")  %>/day </i></p>
                                <p><b>Category:</b> <i class="material-icons prefix teal-text">category</i><%=rs.getString("category")  %> </p>
                                <b>Availability:
                                    <%
                                        if(Integer.parseInt(rs.getString("booked")) == 1 ){
                                            %>
                                              Booked Already
                                            <%
                                        }else{
                                            %>
                                                Available For Booking
                                            <%
                                        }
                                    %> 
                                </b>
                                <div>
                                    <h5 class="pink-text lighten-4"><b>Room Description</b></h5>
                                    <div style="padding-left: 20px; "><p><%=rs.getString("description")  %> </p></div>
                                </div>
                                <div class="jumbotron">
                                    <div class="row-fluid">
                                        <div>
                                            <h6>Verify Your Email and Complete Booking</h6>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class=" col-12">
                                            <%
                                               if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
                                           %>
                                               <% //response.sendRedirect("Login.jsp"); %>
                                           <%} else {
                                           %>
                                            <div class="col-sm-9"><h6> Email: <%=session.getAttribute("email")%></h6></div>
                                           <%
                                               }
                                           %>
                                            <div class="col-sm-3">
                                                <%
                                               if(Integer.parseInt(rs.getString("booked")) == 1){
                                                   %>
                                                   <p class="text-info">Room Occupied</p>
                                                   <%
                                               }else{
                                                 %>
                                                     <a href="./booking.jsp?uid=<%=rs.getString("id")  %>" class="btn btn-sm add-to-cart"><i class="fa fa-book"></i>Book Now</a>
                                                 <%
                                               }
                                               %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clo-sm-1 col-md-1 col-xs-1 col-xl-1 grey lighten-4"></div>
                        </div>
                    </div>      
                </div>
                <%
            }
            else{
            %>
            <%
                response.sendRedirect("./404.jsp");
            %>
           <% 
            }
            
            }catch(Exception e){
                out.println(e);
            }
      %>
    <%@include file="includes/footer.jsp"  %>
    </body>
</html>
