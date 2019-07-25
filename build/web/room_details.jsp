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
        
        <!--Querry to select a single room-->
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
                            <!--Form for reservation request-->
                            
                              <!--Display room information-->
                            
                            <div class="col-sm-7 col-md-7 col-xs-7 col-xl-7" style="margin-left: 30px;">
                                <div class="indigo lighten-3" style="height: 50px;" >
                                    <h5 class="text-capitalize text-wrap white-text center-align "><%=rs.getString("name")  %> </h5>
                                </div>
                                <div>
                                 <%
                                  if(Integer.parseInt(rs.getString("id")) == 1){
                                      %>
                                      <img src="images/rooms/room1.jpg" alt="" width="712px" height="400px" />
                                      <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 2){
                                    %>
                                    <img src="images/rooms/room2.jpeg" alt="" width="712px" height="400px"  />
                                    <%
                                  }
                                  else if(Integer.parseInt(rs.getString("id")) == 3){
                                    %>
                                    <img src="images/rooms/room3.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }
                                    else if(Integer.parseInt(rs.getString("id")) == 4){
                                    %>
                                    <img src="images/rooms/room4.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 5){
                                    %>
                                    <img src="images/rooms/room5.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 6){
                                    %>
                                    <img src="images/rooms/room6.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 7){
                                    %>
                                    <img src="images/rooms/room7.jpg" alt=""/>
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 8){
                                    %>
                                    <img src="images/rooms/room8.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 9){
                                    %>
                                    <img src="images/rooms/room9.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 10){
                                    %>
                                    <img src="images/rooms/room10.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 11){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 12){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 13){
                                    %>
                                    <img src="images/rooms/room13.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 14){
                                    %>
                                    <img src="images/rooms/room14.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 15){
                                    %>
                                    <img src="images/rooms/room15.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 16){
                                    %>
                                    <img src="images/rooms/room16.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 17){
                                    %>
                                    <img src="images/rooms/room17.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 18){
                                    %>
                                    <img src="images/rooms/room18.jpg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 19){
                                    %>
                                    <img src="images/rooms/room19.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }else if(Integer.parseInt(rs.getString("id")) == 20){
                                    %>
                                    <img src="images/rooms/room20.jpeg" alt="" width="712px" height="400px" />
                                    <%
                                  }
                              %>
                               </div>
                              <br>
                                <p><b>Price:</b> <i class="pink-text">FCFA<%=rs.getString("price")  %>/day </i></p>
                                <p class="right" ><b>Category:</b> <i class="material-icons prefix teal-text">category</i><%=rs.getString("category")  %> </p>
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
                                    <!--Checking if guest is logged in to display information based on the session-->
                                      <%
                                 if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
                                 %>
                                 <p>Please Create <a href="./Login.jsp" class="orange-text" >Account</a> or <a href="./Login.jsp" class="orange-text" >Login</a> to book room</p>
                                    <%
                                }else{
                                    %>
                                    <p></p>
                                    <%
                                }
                                %>
                                <!--Getting customer's detail based on email(which is used as the session)-->
                                <% 
                                try{

                                    String email = (String)session.getAttribute("email");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM customers WHERE email='"+email+"'";

                                    ResultSet rst = stm.executeQuery(sql);

                                    if(rst.next()){
//                                       
                                        %>
                                    <div class="row-fluid">
                                        <div>
                                            <h6>Fill Form Below To Complete Booking</h6>
                                            <h6> Booking room as: <b class="orange-text"><%=rst.getString("first_name")%> <%=rst.getString("last_name")%></b></h6>
                                            <div class="divider"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                                <%
                                               if(Integer.parseInt(rs.getString("booked")) == 1){
                                                   %>
                                                   <p class="text-info">Room Occupied</p>
                                                   <%
                                               }else{
                                                 %>
                                                 
                                                 <!--Form for guest to complete booking-->
                                                 <div class="row" style="margin-top:20px;">
                                                     <form method="post" action="./booking/guest_reserve.jsp">
                                                        <input type="hidden" value="<%=rs.getString("id")%>" name="room_id">
                                                        <input type="hidden" value="<%=rst.getString("id")%>" name="customer_id">
                                                        <div class="col-sm-12">
                                                            <div class="col-sm-6">
                                                                <label class="text-dark">Check In<span class="text-danger">*</span></label>
                                                                <input required 
                                                                    type="date" name="check_in" 
                                                                    id="check_in" 
                                                                >
                                                            </div> 
                                                            <div class=" col-sm-6">
                                                                <label class="text-dark">From Time<span class="text-danger">*</span></label>
                                                                <input required 
                                                                    type="time" name="from_time" 
                                                                    id="from_time" 
                                                                >
                                                            </div> 
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="col-sm-6">
                                                                <label class="text-dark">Check Out<span class="text-danger">*</span></label>
                                                                <input required 
                                                                    type="date" name="check_out" 
                                                                    id="check_out" 
                                                                >
                                                            </div> 
                                                            <div class=" col-sm-6">
                                                                <label class="text-dark">To Time<span class="text-danger">*</span></label>
                                                                <input required 
                                                                    type="time" name="to_time" 
                                                                    id="to_time" 
                                                                >
                                                            </div> 
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <div class="col-sm-6">
                                                                <label class="text-dark">Adults<span class="text-danger">*</span></label>
                                                                <input type="number" value="1" min="1" max="3" name="adults">
                                                            </div> 
                                                            <div class=" col-sm-6">
                                                                <label class="text-dark">Children<span class="text-danger">*</span></label>
                                                                <input type="number" value="0" min="0" max="2" name="children">
                                                            </div> 
                                                        </div>
                                                        
                                                        <input type="hidden" value="1" name="determinant">
                                                        <input type="submit" value="Book Now" name="reserveBut" class="btn right" />
                                                     </form>
                                                 </div>
                                                 
                                                    
                                                 <%
                                               }
                                               %>
                                            </div>
                                    </div>
                                    <%
//                                        }else{
                                          %>
                                          <!--<h1>Please make sure you are logged in to complete booking</h1>-->
                                          <%
//                                        }
                                    }
                                }catch(Exception e){
                                    out.println(e);
                                }
                                %>       
                                </div>
                             
                            </div>
                                <div class="clo-sm-1 col-md-1 col-xs-1 col-xl-1 grey lighten-4"></div>
                                <div class="col-sm-4 col-md-4 col-xs-4 col-xl-4">
                                    
                                    <h5>Facilities Added to Room Services </h5>
                                    <div class="divider"></div>
                                    <div style="margin-top: 5px;">
                                        <div class="col-sm-6">
                                        <img src="images/home/sport.jpg" alt="" width="120px" height="100px;"/>
                                        Gym/Sports
                                        </div>
                                        <div class="col-sm-6">
                                            <img src="images/home/restaurant.jpg" alt="" width="120px" height="100px;"/>
                                            Restaurant
                                            </div>
                                        <div class="col-sm-6">
                                            <img src="images/home/sport.jpg" alt="" width="120px" height="100px;"/>
                                            Gym/Sports
                                            </div>
                                        <div class="col-sm-6">
                                            <img src="images/home/sport.jpg" alt="" width="120px" height="100px;"/>
                                            Gym/Sports
                                        </div>
                                    </div>

                                </div>
                            
                        </div>
                    </div>      
                </div>
                <%
            }
            else{
            %>
            <%
//                response.sendRedirect("./404.jsp");
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
