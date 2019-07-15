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
                <h3 class="flow-text"><i class="material-icons"></i> Employees
                    <a class="grey-text text-lighten-4 right" href="add_employee.jsp"><button title="Add New Employee To The System"  class="btn modal-trigger right">Add Employee</button></a>
                 </h3>
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
                        <table class="table-bordered table-striped table-responsive">
                            <tr>
                                <th width="2%" class=" text-center">id</th>
                                <th width="10%" class=" text-center">Id NUmber</th>
                                <th width="15%" class=" text-center">Name</th>
                                <th width="15%" class=" text-center">Email</th>
                                <th width="15%" class=" text-center">Position</th>
                                <th width="10%" class=" text-center">Phone</th>
                                <th width="10%" class=" text-center">Address</th>
                                <th width="10%" class=" text-center">Action</th>
                            </tr>
            
                            <%

                                try{
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    statement = conn.createStatement();
                                    String sql = "SELECT * FROM employees";

                                    resultSet = statement.executeQuery(sql);

                                    while(resultSet.next()){



                            %>
                            <tr>
                              <td><%=resultSet.getString("id")  %></td>
                              <td><%=resultSet.getString("id_number")  %></td>
                              <td><%=resultSet.getString("name")  %></td>
                              <td><%=resultSet.getString("email")  %></td>
                              <td><%=resultSet.getString("position")  %></td>
                              <td><%=resultSet.getString("phone")  %></td>
                              <td><%=resultSet.getString("address")  %></td>
                              <td>
                                  <a  href="edit_employee.jsp?uid=<%=resultSet.getString("id")%>" class="btn btn-primary btn-xs" title="Edit Employee">Edit<i class="fa fa-edit fa-lg"></i></a>
                                  <a href="./employee/del_employee.jsp?uid=<%=resultSet.getString("id")%>" onclick="delEmployee();" title="Delete Employee" id="delreserve" class="btn btn-danger btn-xs"><i class="fa fa-trash fa-lg"></i>Delete</a>
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
        function delEmployee(){
            alert("Sure to delete this employee? You will not be able to recover this again.");
        }
    </script>
 <div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
    
</body>
</html>
