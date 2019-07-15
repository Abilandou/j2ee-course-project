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
            
            if(request.getParameter("addRoomButd") != null){
                String name, number, category, description, price, date_free, time_free;
                
                name=request.getParameter("name");
                number=request.getParameter("number");
                category=request.getParameter("category");
                description =request.getParameter("description");
                price =request.getParameter("price");
                date_free=request.getParameter("date_free");
                time_free=request.getParameter("time_free");
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into rooms( name, number, category, description, price, date_free, time_free) values(?, ?, ?, ?, ?, ?, ?);");
                
                preparestmnt.setString(1, name);
                preparestmnt.setString(2, number);
                preparestmnt.setString(3, category);
                preparestmnt.setString(4, description);
                preparestmnt.setString(5, price);
                preparestmnt.setString(6, date_free);
                preparestmnt.setString(7, time_free);
                preparestmnt.executeUpdate(); //execute query
                
                String message = "Room added successfully";
                request.setAttribute("msg", message);
                response.sendRedirect("./view_rooms.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
              %>  
              
                <form action="add_rooms.jsp" method="post"  id="addRoom2_form">
                    <div class="form-group">
                        <label class="text-dark lead">Room Name<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="name" 
                            id="name" 
                            required
                        >
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Room Number<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="number" 
                            id="number" 
                            required
                        >
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Room Type<span class="text-danger">*</span></label>
                        <select name="category" required="" class="form-control">
                             <option value="">Select Category</option>
                             <% 
                                 try{

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM categories";

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
                        <label class="text-dark lead">Description<span class="text-danger">*</span></label>
                        <textarea
                            name="description"
                            id="description"
                            class="description"
                            style="height: 100px;"
                            required
                            placeholder="description"
                            
                        ></textarea>
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Price(FCFA)<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="number" name="price" 
                            id="price" 
                            required
                        >
                    </div> 
                    <div class="form-group">
                        <label class="text-dark lead">Date Free</label>
                        <input required 
                            class="form-control" 
                            type="date" name="date_free" 
                            id="date" 
                        >
                    </div> 
                    <div class="form-group">
                        <label class="text-dark lead">Time Free</label>
                        <input required 
                            class="form-control" 
                            type="time" name="time_free" 
                            id="date" 
                        >
                    </div> 
                    <div class="form-group">
                        <label class="text-dark lead">Image</label>
                        <input  
                            type="file" name="image" 
                            id="image" 
                        >
                    </div>
                    <div class="form-group">
                        <input type="submit" name="addRoomButd" value="Add Room" class="btn pull-right">
                    </div>
                     <br/>
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
