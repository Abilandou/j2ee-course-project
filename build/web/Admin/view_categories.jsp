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
                <h3 class="flow-text"><i class="material-icons"></i> Categories
                    <a class="grey-text text-lighten-4 right" href="add_categories.jsp"><button  class="btn right"><i class="material-icons prefix">add</i>Add New</button></a>
                 </h3>
                <div class="divider"></div><br/>

                <div class="card z-depth-2">
                <div class="card-content">
                  <table class="table-bordered  table-responsive table-hover" id="myDataTable">
                    <thead>
                      <tr>
                          <th  width="2%">#</th>
                          <th  width="20%">Name</th>
                          <th  width="60%">Description</th>
                          <th  width="18%">Actions</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                            try{
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                statement = conn.createStatement();
                                String sql = "SELECT * FROM categories";

                                resultSet = statement.executeQuery(sql);

                                while(resultSet.next()){
                        %>
                        <tr>
                            <td><%=resultSet.getString("id")  %></td>
                            <td><%=resultSet.getString("name")  %></td>
                            <td><%=resultSet.getString("description")  %></td>
                            <td>
                                <a  href="./edit_category.jsp?uid=<%=resultSet.getString("id")%>" class="btn btn-success btn-sm" title="Edit room"><i class="fa fa-edit fa-lg">edit</i></a>

                                <a href="delete_category.jsp?uid=<%=resultSet.getString("id")%>" title="delete This category" id="delcat" class="btn btn-danger btn-sm">Delete<i class="fa fa-trash fa-lg"></i></a>
                            </td>
                        </tr> 
                        <%
                            }//End while loop
                            }catch(Exception e){
                                e.printStackTrace();
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

