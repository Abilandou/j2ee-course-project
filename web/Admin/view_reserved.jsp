
<%-- 
    Document   : handleViewCustomers
    Created on : May 3, 2019, 6:53:35 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>

  <%@page import="java.text.DateFormat"%>
        
        <%@page import="java.text.SimpleDateFormat"%>
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
                            <table class="table-bordered  table-responsive table-hover" id="myDataTable">
                                <tr>
                                    <th width="1%" class=" text-center bg-danger">id</th>
                                    <th width="20%" class=" text-center bg-primary">Room Name/#</th>
                                    <th width="15%" class=" text-center red white-text">Guest Name</th>
                                    <th width="5%" class=" text-center bg-info">Room Status</th>
                                    <th width="7%" class=" text-center bg-info" title="Determines who is responsible for this reservation.">Determinant</th>
                                    <th width="12%" class=" text-center bg-success">CheckIn/time</th>
                                    <th width="12%" class=" text-center bg-primary">CheckOut/time</th>
                                    <th width="2%" class=" text-center bg-danger">Adults</th>
                                    <th width="2%" class=" text-center bg-info">Children</th>
                                    <th width="5%" class=" text-center bg-warning">Price/day</th>
                                    <th width="20%" class=" text-center bg-danger">Action</th>
                                </tr>
                                <%   
                                    Connection connection = null;
                                    String connectionURL = "jdbc:mysql://localhost:3306/cef502";
                                    ResultSet rs = null;
                                    Statement statement = null;
                                    try {

                                     Class.forName("com.mysql.jdbc.Driver").newInstance();

                                     connection = DriverManager.getConnection(connectionURL, "godlove", "godlove");
                                     
//                                     String firstquerry = "SELECT * from rooms, reserve WHERE rooms.id=reserve.room_id";
                                     
                                     statement = connection.createStatement();
                                     String querry = "SELECT * FROM reserve INNER JOIN rooms ON reserve.room_id = rooms.id INNER JOIN customers ON reserve.customer_id = customers.id ";
                                     rs = statement.executeQuery(querry);
                                while(rs.next()){
                               %>
                                <tr>
                                    <td><%= rs.getInt(1)%></td>
                                    <td><%= rs.getString("rooms.name")%>/<%= rs.getString("rooms.number")%></td>
                                    <td><%= rs.getString("customers.first_name")%> <%= rs.getString("customers.last_name")%></td>
                                    <td>
                                         <%
                                            if(Integer.parseInt(rs.getString("booked")) == 1){
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
                                    <td>
                                         <%
                                            if(Integer.parseInt(rs.getString("reserve.determinant")) == 0){
                                                %>
                                                <p class="text-center " title="Reservation done by admin"><b>Admin</b></p>
                                                <%
                                            }else{
                                              %>
                                              <p title="Done by guest from the site." ><b>Guest Request</b></p>
                                              <%
                                            }
                                        %>
                                    </td>
                                    <td><%= rs.getString("check_in")%>/<%= rs.getString("from_time")%></td>
                                    <td><%= rs.getString("check_out")%>/<%= rs.getString("to_time")%></td>
                                    <td><%= rs.getString("adults")%></td>
                                    <td><%= rs.getString("children")%></td>
                                    <td><%= rs.getString("price")%></td>
                                    <td>
                                        
                                        <%
                                            if(Integer.parseInt(rs.getString("reserve.determinant")) == 0){
                                                %>
                                                <a  href="./edit_reserve.jsp?uid=<%=rs.getString("id")%>" class="btn btn-primary btn-xs" title="Edit Reservation">Edit<i class="fa fa-edit fa-lg"></i></a>
                                                <a href="./Reservation/cancel_reserve.jsp?uid=<%= rs.getString("reserve.id")%>" title="Cancel Reservation" id="cancelreserve" class="btn btn-info btn-xs"><i class="fa fa-times fa-lg"></i>Cancel</a>
                                                <%
                                            }
                                            %>
                                            <%
                                            if((Integer.parseInt(rs.getString("reserve.determinant")) == 1) && (Integer.parseInt(rs.getString("rooms.booked")) == 0)){
                                            %>
                                                
                                                <a href="./Reservation/accept_reserve.jsp?uid=<%= rs.getString("reserve.id")%>" title="Accept Reservation" id="acceptreserve" class="btn btn-info btn-xs"><i class="fa fa-trash fa-lg"></i>Accept</a>
                                                <%
                                            }
                                            %>
                                        
                                        <a href="./Reservation/del_reserve.jsp?uid=<%=rs.getString("id")%>" title="Delete Reservation" id="delreserve" class="btn btn-danger btn-xs"><i class="fa fa-trash fa-lg"></i>Delete</a>
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
                            
                   <%
                 
               try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("tryBut") != null){
                String check_in, check_out;
                int number_of_days, amount_due, one_day_cost, days;
                
                String date1 =request.getParameter("firstdate");

                String date2 =request.getParameter("seconddate");

                
                check_in =request.getParameter("check_in");

                check_out =request.getParameter("check_out");

                SimpleDateFormat dateformat = new SimpleDateFormat ("yyy-mm-dd"); //SDF to display output with day of week

                Date displaydate1=new Date(Long.parseLong(check_in)); //Turning the inputed date from string
                                                   //to date format to be used for the output
                Date displaydate2=new Date(Long.parseLong(check_out));
                days = (int) ((displaydate2.getTime() - displaydate1.getTime())/(1000*60*60*24));//common method to calculate number of days

                out.println("Between " +dateformat.format(displaydate1)+ " and " +dateformat.format(displaydate2)+ " there are " +days+ " days");

//                check_in =request.getParameter("check_in");
//                check_out=request.getParameter("check_out");

                PreparedStatement preparestmnt = null; //Create statement
                String querry1 = "insert into try(check_in, check_out, days) values(?, ?, ?)";
                preparestmnt = con.prepareStatement(querry1);
                


                
//                preparestmnt.setDate(1, displaydate1);
//                preparestmnt.setDate(2, displaydate2);
                preparestmnt.setString(1, check_in);
                preparestmnt.setString(2, check_out);
                preparestmnt.setInt(3, days);

                preparestmnt.executeUpdate(); //execute query
                
                String message = "Reservation made successfully";
                request.setAttribute("msg", message);
                response.sendRedirect("./view_reserved.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
              %>
              
              <form action="view_reserved.jsp" method="post">
                  <input id="indate" type="date"  name="check_in" class="datepicker">
                  <input type="date"  name="check_out" class="datepicker">
                  <input type="hidden" value="days" name="days">
                  <input id="trying" type="submit" name="tryBut" class="btn" value="Try" />

              </form>
        </div>
    </div>
</div>
    <script>
         $(function() {
     $( ".datepicker" ).datepicker();
       });
        
        $("a#cancelreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To cancel this reservation?")) {
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
        $("a#acceptreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To accept guest request for reservation?")) {
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
