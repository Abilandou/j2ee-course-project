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
        <title>CEF502 Hotel Admin | view customers</title>
    </head>
 <body>
   
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
                <h3 class="flow-text"><i class="material-icons"></i> Customers</h3>
                <div class="divider"></div><br/>

                <div class="card z-depth-2">
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
                    <div class="card-content">
                        <table class="table-bordered  table-responsive table-hover">
                            <tr>
                                <th width="2%" class=" text-center">id</th>
                                <th width="10%" class=" text-center">First Name</th>
                                <th width="15%" class=" text-center">Email</th>
                                <th width="10%" class=" text-center">Phone</th>
                                <th width="10%" class=" text-center">City</th>
                                <th width="15%" class=" text-center">Country</th>
                                <th width="10%" class=" text-center">Action</th>
                            </tr>
            
                            <%

                                try{
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    statement = conn.createStatement();
                                    String sql = "SELECT * FROM customers";

                                    resultSet = statement.executeQuery(sql);

                                    while(resultSet.next()){



                            %>
                            <tr>
                              <td><%=resultSet.getString("id")  %></td>
                              <td><%=resultSet.getString("first_name")  %></td>
                              <td><%=resultSet.getString("email")  %></td>
                              <td><%=resultSet.getString("phone")  %></td>
                              <td><%=resultSet.getString("city")  %></td>
                              <td><%=resultSet.getString("country")  %></td>
                              <td>
                                  <p class="btn btn-primary btn-xs" title="view customer's details"><i class="fa fa-eye fa-lg"></i>view</p>
                                <p class="btn btn-danger btn-xs" title="delete this customer"><i class="fa fa-trash"></i>delete</p>
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

 <div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
    
</body>
</html>
