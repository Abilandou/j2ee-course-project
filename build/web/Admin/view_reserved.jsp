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
                <h3 class="flow-text"><i class="material-icons"></i> Reservations
                    <a class="grey-text text-lighten-4 right" href="./reserve.jsp"><button  class="btn modal-trigger right">Make Reservation</button></a>
                </h3>
                <div class="divider"></div><br/>

                <div class="card z-depth-2">
                    <div class="card-content">
                        <%
                            String message = (String)request.getAttribute("msg");
                            if(message != null){
                                %>
                                <h5 class="text-success">Reservation Made Successfully.</h5>
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

                                preparestmnt = con.prepareStatement("DELETE FROM  reserve WHERE id='"+id+"'");
                                preparestmnt.executeUpdate(); //execute query

                                request.setAttribute("successMsg", "Room successfully deleted");
                                response.sendRedirect("./view_reserved.jsp");

                                con.close();

                            }


                        }catch(Exception e){
                                out.println(e);
                            }

                        %>
                        <table class="table-bordered  table-responsive table-hover" id="myDataTable">
                            <tr>
                                <th width="1%" class=" text-center bg-danger">id</th>
                                <th width="20%" class=" text-center bg-primary">Room Name</th>
                                <th width="5%" class=" text-center bg-warning">Room Number</th>
                                <th width="15%" class=" text-center red white-text">Guest Name</th>
                                <th width="15%" class=" text-center bg-info">Guest Email</th>
                                <th width="5%" class=" text-center bg-info">Status</th>
                                <th width="12%" class=" text-center bg-success">CheckIn/time</th>
                                <th width="12%" class=" text-center bg-primary">CheckOut/time</th>
                                <th width="2%" class=" text-center bg-danger">Adults</th>
                                <th width="2%" class=" text-center bg-info">Children</th>
                                 <th width="5%" class=" text-center bg-warning">Amount Due</th>
                                <th width="20%" class=" text-center bg-danger">Action</th>
                            </tr>

                        <%

                            try{
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                statement = conn.createStatement();
                                String sql = "SELECT * FROM reserve";

                                resultSet = statement.executeQuery(sql);

                                while(resultSet.next()){



                        %>
                            <tr>
                              <td><%=resultSet.getString("id")  %></td>
                              <td><%=resultSet.getString("room_name")  %></td>
                              <td><%=resultSet.getString("room_number")  %></td>
                              <td><%=resultSet.getString("customer_name")  %></td>
                              <td><%=resultSet.getString("customer_email")  %></td>
                              <td>
                                <%
                                    if(Integer.parseInt(resultSet.getString("status")) == 1){
                                        %>
                                        <p class="red-text text-center "><b>occupied</b></p>
                                        <%
                                    }else{
                                      %>
                                      <p class="green-text"><b>free</b></p>
                                      <%
                                    }
                                %>
                              </td>
                              <td><%=resultSet.getString("check_in")  %>/<%=resultSet.getString("from_time")  %></td>
                              <td><%=resultSet.getString("check_out")  %>/<%=resultSet.getString("to_time")  %></td>
                              <td><%=resultSet.getString("adults")  %></td>
                              <td><%=resultSet.getString("children")  %></td>
                              <td><%=resultSet.getString("amount_due")  %></td>
                              <td>
                                  <a  href="edit_reserve.jsp?uid=<%=resultSet.getString("id")%>" class="btn btn-primary btn-xs" title="Edit Reservation">Edit<i class="fa fa-edit fa-lg"></i></a>
                                  <a href="./Reservation/cancel_reserve.jsp?uid=<%=resultSet.getString("id")%>" title="Cancel Reservation" id="cancelreserve" class="btn btn-info btn-xs"><i class="fa fa-trash fa-lg"></i>Cancel</a>
                                  <a href="./Reservation/del_reserve.jsp?uid=<%=resultSet.getString("id")%>" title="Cancel Reservation" id="delreserve" class="btn btn-danger btn-xs"><i class="fa fa-trash fa-lg"></i>Delete</a>
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
        $("a#cancelreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To cancel this reservation? You will never recover it again")) {
                return true;
            }
            return false;
        });
        
        $("a#delreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To delete this reservation? You will never recover it again")) {
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
