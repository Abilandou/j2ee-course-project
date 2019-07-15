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
        <title>CEF502 Hotel Admin | view contacts</title>
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
                <h3 class="flow-text"><i class="material-icons"></i> Contacts</h3>
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
                                <th width="1%" class=" text-center">id</th>
                                <th width="10%" class=" text-center">Name</th>
                                <th width="15%" class=" text-center">Email</th>
                                <th width="20%" class=" text-center">Subject</th>
                                <th width="48%" class=" text-center">Message</th>
                                <th width="10%" class=" text-center">Action</th>
                            </tr>
            
                            <%

                                try{
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    statement = conn.createStatement();
                                    String sql = "SELECT * FROM contacts";

                                    resultSet = statement.executeQuery(sql);

                                    while(resultSet.next()){



                            %>
                            <tr>
                              <td><%=resultSet.getString("id")  %></td>
                              <td><%=resultSet.getString("name")  %></td>
                              <td><%=resultSet.getString("email")  %></td>
                              <td><%=resultSet.getString("subject")  %></td>
                              <td><%=resultSet.getString("message")  %></td>
                              <td>
                                <p class="btn btn-danger btn-xs" title="delete this message"><i class="fa fa-trash"></i>delete</p>
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
