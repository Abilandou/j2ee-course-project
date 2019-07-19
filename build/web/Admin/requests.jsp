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
        <title>CEF502 Hotel Admin | view requests</title>
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
                <h3 class="flow-text"><i class="material-icons"></i>Reservation Requests</h3>
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
                                <th width="8%" class=" text-center">Name</th>
                                <th width="10%" class=" text-center">Email</th>
                                <th width="8%" class=" text-center">Phone</th>
                                <th width="8%" class=" text-center">Country</th>
                                <th width="3%" class=" text-center">adults</th>
                                <th width="3%" class=" text-center">children</th>
                                <th width="8%" class=" text-center">checkin</th>
                                <th width="8%" class=" text-center">checkout</th>
                                <th width="8%" class=" text-center">status</th>
                                <th width="10%" class=" text-center">Request For A</th>
                                <th width="35%" class=" text-center">Action</th>
                            </tr>
            
                            <%

                                try{
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    statement = conn.createStatement();
                                    String sql = "SELECT * FROM guest";

                                    resultSet = statement.executeQuery(sql);

                                    while(resultSet.next()){



                            %>
                            <tr>
                              <td><%=resultSet.getString("id")  %></td>
                              <td><%=resultSet.getString("name")  %></td>
                              <td><%=resultSet.getString("email")  %></td>
                              <td><%=resultSet.getString("phone")  %></td>
                              <td><%=resultSet.getString("country")  %></td>
                              <td><%=resultSet.getString("adults")  %></td>
                              <td><%=resultSet.getString("children")  %></td>
                              <td><%=resultSet.getString("check_in")  %></td>
                               <td><%=resultSet.getString("check_out")  %></td>
                              <td>
                                <%
                                  if(Integer.parseInt(resultSet.getString("status")) == 1){
                                      %>
                                      <p class="green-text"><b>Accepted</b></p>
                                      <%
                                  }else{
                                    %>
                                    <p class="blue-text"><b>Pending</b></p>
                                    <%
                                  }
                                %>
                              
                              </td>
                              <td><%=resultSet.getString("determinant")  %></td>
                              <td>
                                  <a  href="./Reservation/accept_request.jsp?uid=<%=resultSet.getString("id")%>"  class="btn btn-primary btn-xs" id="acceptrequest" title="Accept Request">Accept<i class="fa fa-edit fa-lg"></i></a>
                                  <a href="./Reservation/cancel_request.jsp?uid=<%=resultSet.getString("id")%>"  title="Cancel Request" id="cancelrequest" class="btn btn-info btn-xs"><i class="fa fa-trash fa-lg"></i>Cancel</a>
                                  <a href="./Reservation/del_request.jsp?uid=<%=resultSet.getString("id")%>"  title="Delete Request" id="deleterequest" class="btn btn-danger btn-xs"><i class="fa fa-trash fa-lg"></i>Delete</a>
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
        $(document).ready(function(){
            $("a#acceptrequest").click(function(){
                if(confirm("Sure To accept this request?")){
                    return true;
                }
                return false;
            });
            $("a#cancelrequest").click(function(){
                if(confirm("Sure To Cancel this request?")){
                    return true;
                }
                return false;
            });
            $("a#deleterequest").click(function(){
                if(confirm("Sure To Delete this request?")){
                    return true;
                }
                return false;
            });
        });
        
    </script>
 <div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
    
</body>
</html>
