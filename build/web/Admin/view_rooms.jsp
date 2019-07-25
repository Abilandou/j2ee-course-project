<%-- 
    Document   : handleViewCustomers
    Created on : May 3, 2019, 6:53:35 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502 Hotel Admin | view Rooms</title>
    </head>
 <body background="/images/rooms/hotel1.png">
   
    <!--Header-part-->
    <div id="header">

    </div>
    <!--close-Header-part--> 
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
                <h3 class="flow-text"><i class="material-icons"></i> Rooms
                    <a class="grey-text text-lighten-4 right" href="add_rooms.jsp"><button  class="btn"><i class="material-icons prefix">add</i>Add Room</button></a>
                 </h3>
                <div class="divider"></div><br/>

                <div class="card z-depth-2">
                    <div class="card-content">
                        <%
                            String message = (String)request.getAttribute("msg");
                            if(message != null){
                                %>
                                <h5 class="text-success">Room Added Successfully.</h5>
                                <%
                            }else{
                            }

                        %>
                        <%   
                           String id = request.getParameter("id");
                //           int id = Integer.parseInt(strId);

                //           String strId =request.getParameter("id");
                //           int id = Integer.parseInt(strId);

                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                            }catch (ClassNotFoundException e){
                                e.printStackTrace();
                            }

                            Connection conn = null;
                            Statement statement = null;
                            ResultSet resultSet = null;

                        %>
                        <!--handle delete logic-->
                        <%

                         try{

                            Class.forName("com.mysql.jdbc.Driver");

                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");

                            if(request.getParameter("delete") != null){

                            PreparedStatement preparestmnt = null; //Create statement

                                preparestmnt = con.prepareStatement("DELETE FROM  rooms WHERE id='"+id+"'");
                                preparestmnt.executeUpdate(); //execute query

                                request.setAttribute("successMsg", "Room successfully deleted");
                                response.sendRedirect("./view_rooms.jsp");

                                con.close();
                            }
                        }catch(Exception e){
                                out.println(e);
                            }

                        %>
                        <table class="table-bordered  table-responsive table-hover" id="myDataTable">
                            <tr>
                                <th width="2%" class=" text-center">id</th>
                                <th width="10%" class=" text-center">Room Name</th>
                                <th width="5%" class=" text-center">Room Number</th>
                                <th width="8%" class=" text-center">Category</th>
                                <th width="2%" class=" text-center">status</th>
                                <th width="20%" class=" text-center">Description</th>
                                <th width="5%" class=" text-center">Price</th>
                                <th width="8%" class=" text-center">Date Free</th>
                                <th width="8%" class=" text-center">Time Free</th>
                                <th width="10%" class=" text-center">Image</th>
                                <th width="12%" class=" text-center">Action</th>
                            </tr>

                        <%

                            try{
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                statement = conn.createStatement();
                                String select_query = "SELECT * FROM rooms";

                                resultSet = statement.executeQuery(select_query);

                                while(resultSet.next()){



                        %>
                            <tr>
                              <td><%=resultSet.getString("id")  %></td>
                              <td><%=resultSet.getString("name")  %></td>
                              <td><%=resultSet.getString("number")  %></td>
                              <td><%=resultSet.getString("category")  %></td>
                              <td>
                              <%
                                  if(Integer.parseInt(resultSet.getString("booked")) == 1){
                                      %>
                                      <p class="red-text"><b>Reserved</b></p>
                                      <%
                                  }else{
                                    %>
                                    <p class="green-text"><b>Free</b></p>
                                    <%
                                  }
                              %>
                              </td>


                              <td><%=resultSet.getString("description")  %></td>
                              <td><%=resultSet.getString("price")  %></td>
                              <td><%=resultSet.getString("date_free")  %></td>
                              <td><%=resultSet.getString("time_free")  %></td>
                              <td>
                                  
                                  <%
                                  if(Integer.parseInt(resultSet.getString("id")) == 1){
                                      %>
                                      <img src="images/rooms/room1.jpg" alt="" height="120px" width="120px;" />
                                      <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 2){
                                    %>
                                    <img src="images/rooms/room2.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }
                                  else if(Integer.parseInt(resultSet.getString("id")) == 3){
                                    %>
                                    <img src="images/rooms/room3.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }
                                    else if(Integer.parseInt(resultSet.getString("id")) == 4){
                                    %>
                                    <img src="images/rooms/room4.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 5){
                                    %>
                                    <img src="images/rooms/room5.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 6){
                                    %>
                                    <img src="images/rooms/room6.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 7){
                                    %>
                                    <img src="images/rooms/room7.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 8){
                                    %>
                                    <img src="images/rooms/room8.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 9){
                                    %>
                                    <img src="images/rooms/room9.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 10){
                                    %>
                                    <img src="images/rooms/room10.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 11){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 12){
                                    %>
                                    <img src="images/rooms/room11.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 13){
                                    %>
                                    <img src="images/rooms/room13.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 14){
                                    %>
                                    <img src="images/rooms/room14.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 15){
                                    %>
                                    <img src="images/rooms/room15.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 16){
                                    %>
                                    <img src="images/rooms/room16.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 17){
                                    %>
                                    <img src="images/rooms/room17.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 18){
                                    %>
                                    <img src="images/rooms/room18.jpg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 19){
                                    %>
                                    <img src="images/rooms/room19.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }else if(Integer.parseInt(resultSet.getString("id")) == 20){
                                    %>
                                    <img src="images/rooms/room20.jpeg" alt="" height="120px" width="120px;" />
                                    <%
                                  }
                              %>
                                
                              </td>
                              <td>
                                  <!--<a href="room_single.jsp?uid=<%=resultSet.getString("id")%>" class="btn btn-primary btn-sm " title="view details"><i class="fa fa-eye fa-lg"></i></a>-->
                                  <a  href="update_room.jsp?uid=<%=resultSet.getString("id")%>" class="btn btn-success btn-sm" title="Edit room">Edit<i class="fa fa-edit fa-lg"></i></a>
                                  <a href="delete_room.jsp?uid=<%=resultSet.getString("id")%>"  title="delete This room" id="delroom" class="btn btn-danger btn-sm"><i class="fa fa-trash fa-lg"></i>Delete</a>
                              </td>
                            </tr>

                        <%
                            }//End while loop
                            }catch(Exception e){
                                e.printStackTrace();
                            }

                        %>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script>
     
        $("a#delroom").click(function() {
        // alert('something');
            if (confirm("Are You Sure To delete this room? You will never recover it again")) {
                return true;
            }
            return false;
        });
        
    </script>
            
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
</body>
</html>
