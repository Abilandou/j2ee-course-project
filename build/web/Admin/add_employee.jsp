<%-- 
    Document   : add_categories.jsp
    Created on : May 3, 2019, 6:42:39 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Add_Room</title>

        <!--close-Header-part--> 
        <%@include file="AllAdminIncludes.jsp"  %>
        <%@page import="java.io.*, java.util.*, javax.servlet.*" %>
        <%@page import="javax.servlet.http.*" %>
        <%@page import="org.apache.commons.fileupload.*" %>
        <%@page import="org.apache.commons.fileupload.disk.*" %>
        <%@page import="org.apache.commons.fileupload.servlet.*" %>
        <%@page import="org.apache.commons.io.output.*" %>
        <%@page import="java.sql.*" %>
    </head>

<body>
<!--top-Header-menu-->
<div>
  <%@include file="./includes/admin_header.jsp" %>
</div>

<!--sidebar-menu-->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-1"><%@include file="./includes/admin_sidebar.jsp" %></div>
            <div class="col-md-2"></div>
            <div class="col-md-7 card hoverable">
                <h6>Required Fields are marked(<b class="text-danger">*</b>)</h6>
                <%
                 
               try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("addEmpBut") != null){
                String id_number, name, email, position, phone, address;
                
                id_number=request.getParameter("id_number");
                name=request.getParameter("name");
                email=request.getParameter("email");
                position =request.getParameter("position");
                phone =request.getParameter("phone");
                address=request.getParameter("address");
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into employees( id_number, name, email, position, phone, address) values(?, ?, ?, ?, ?, ?);");
                
                preparestmnt.setString(1, id_number);
                preparestmnt.setString(2, name);
                preparestmnt.setString(3, email);
                preparestmnt.setString(4, position);
                preparestmnt.setString(5, phone);
                preparestmnt.setString(6, address);
                preparestmnt.executeUpdate(); //execute query
                
                String message = "Employee added successfully";
                request.setAttribute("msg", message);
                response.sendRedirect("./Employees.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
              %>  
              
              <form action="add_employee.jsp" method="post" id="addemp_form">
                    <div class="form-group">
                        <label class="lead">Id Number<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="id_number" 
                            id="id_number" 
                        >
                    </div>
                  <div class="form-group">
                        <label class="lead">Name<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="name" 
                            id="name" 
                        >
                    </div>
                  <div class="form-group">
                        <label class=" lead">Email<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="email" name="email" 
                            id="email" 
                        >
                    </div>
                    <div class="form-group">
                        <label class="lead">Position</label>
                        <select name="position" required="" class="form-control">
                             <option value="">Select Job Position</option>
                             <% 
                                 try{

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM positions";

                                    ResultSet rs = stm.executeQuery(sql);

                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("name")  %>"><%=rs.getString("name")  %></option>
                                        <%
                                    }

                                    }catch(Exception e){
                                        out.println(e);
                                    }
                              %>

                        </select>
                    </div>
                    <div class="form-group">
                        <label class="lead">Phone<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="phone" 
                            id="phone" 
                        >
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Address<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="address" 
                            id="address" 
                        >
                    </div>
                    <div class="form-group">
                        <input type="submit" name="addEmpBut" value="Add Employee" class="btn pull-right" style="margin-bottom: 20px;">
                    </div>
                </form>
                 
            </div>
        </div>
    </div>
</div>     
        
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
