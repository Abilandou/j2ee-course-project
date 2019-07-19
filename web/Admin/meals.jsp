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
        <title>CEF502 Hotel Admin | view categories</title>
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
            <div class="col-md-11">
                <h3 class="flow-text"><i class="material-icons"></i> Meals
                    <a class="grey-text text-lighten-4 right" href="meal_order.jsp"><button  class="btn right"><i class="material-icons prefix">add</i>Add New</button></a>
                 </h3>
                <div class="divider"></div><br/>

                <div class="card z-depth-2">
                <div class="card-content">
                  <table class="table-bordered  table-responsive table-hover" id="myDataTable">
                    <thead>
                      <tr>
                          <th  width="2%">#</th>
                          <th  width="12%">Room Name</th>
                          <th  width="6%">Room Number</th>
                          <th  width="10%">Guest Name</th>
                          <th  width="5%">Meal Type</th>
                          <th  width="3%">Plate(s)</th>
                          <th  width="5%">Cost/Plate</th>
                          <th  width="3%">Total</th>
                          <th  width="6%">Received</th>
                          <th  width="10%">Date/Time</th>
                          <th  width="10%">Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                            try{
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                statement = conn.createStatement();
                                 String querry = " SELECT * FROM meals INNER JOIN rooms ON meals.room_id = rooms.id INNER JOIN customers ON meals.guest_id = customers.id ";
                                resultSet = statement.executeQuery(querry);

                                while(resultSet.next()){
                        %>
                        <tr>
                            <td><%=resultSet.getString("id")  %></td>
                            <td><%=resultSet.getString("rooms.name")  %></td>
                            <td><%=resultSet.getString("rooms.number")  %></td>
                            <td><%=resultSet.getString("customers.first_name")  %> <%=resultSet.getString("customers.last_name")  %></td> 
                            <td><%=resultSet.getString("meals.meal_type")  %></td>
                            <td><%=resultSet.getString("meals.number_of_plates")  %></td>
                            <td><%=resultSet.getString("meals.amount_per_plate")%></td>
                            <td><%=resultSet.getString("meals.total_amount")%></td>
                            <td>
                              <%
                                if(Integer.parseInt(resultSet.getString("meals.received")) == 1){
                                    %>
                                    <p class="green-text"><b>Received</b></p>
                                    <%
                                }else{
                                  %>
                                  <p class="blue-text"><b>Pending...</b></p>
                                  <%
                                }
                              %>
                              </td>
                            <td><%=resultSet.getString("meals.created_at")%></td>
                            <td>
                                <a  href="./edit_category.jsp?uid=<%=resultSet.getString("id")%>" class="btn btn-success btn-sm" title="Edit room"><i class="fa fa-edit fa-lg">edit</i></a>
                                <a href="./meals/delete_meal.jsp?uid=<%=resultSet.getString("id")%>" title="delete This meal order" id="delcat" class="btn btn-danger btn-sm">Delete<i class="fa fa-trash fa-lg"></i></a>
                            </td>
                        </tr> 
                        <%
                            }//End while loop
                            }catch(Exception e){
                                out.println(e);
                            }

                        %>
                    </tbody>
                  </table>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
    <script>
        $("a#delcat").click(function() {
        // alert('something');
            if (confirm("Are You Sure To delete this category? You will never recover it again")) {
                return true;
            }
            return false;
        });
    </script>
</body>
</html>

