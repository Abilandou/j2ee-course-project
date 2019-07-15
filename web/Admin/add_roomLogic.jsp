<%-- 
    Document   : add_roomLogic
    Created on : Jun 4, 2019, 1:23:02 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502Hotel Admin | Add-Room</title>

        <!--close-Header-part--> 
        <%@include file="AllAdminIncludes.jsp"  %>
        <%@page import="java.sql.*" %>
        <%@page import="com.oreilly.servlet.MultipartRequest" %>

        <%@ page import="java.util.*, java.io.*" %>
        <%@ page import="java.util.Iterator"%>
        <%@ page import="java.util.List"%>
        <%@ page import="java.io.File"%>
    </head>
    <body>
          <%
//          String root =getServletContext().getRealPath("./../images/rooms");
//          MultipartRequest mr = new MultipartRequest(request, root);
      
        try{

            Class.forName("com.mysql.jdbc.Driver");
//            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("addRoomBut") != null){
                String name; String category; String image; String description; String date_free; String time_free;
//                int status;
                
                name=request.getParameter("name");
                category=request.getParameter("category");
                description =request.getParameter("description");
//                date_free=request.getParameter("date_free");
//                time_free=request.getParameter("time_free");
//                image=request.getParameter("image");
//                status = request.getInteger(1);
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into rooms( name,category, description) values(?, ?, ?);");
                
                preparestmnt.setString(1, name);
                preparestmnt.setString(2, category);
                preparestmnt.setString(3, description);
//                preparestmnt.setString(4,image);
//                preparestmnt.setInt(5, status);
//                preparestmnt.setString(4, date_free);
//                preparestmnt.setString(5, time_free);
                preparestmnt.executeUpdate(); //execute query
                
                request.setAttribute("successMsg", "category successfully added");
                response.sendRedirect("./view_rooms.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
      
      
      
      %>
    </body>
</html>



<%-- 
    Document   : add_categories.jsp
    Created on : May 3, 2019, 6:42:39 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502Hotel Admin | Add-Room</title>

        <!--close-Header-part--> 
        <%@include file="AllAdminIncludes.jsp"  %>
        <%@page import="java.sql.*" %>
        <%@page import="com.oreilly.servlet.MultipartRequest" %>

        <%@ page import="java.util.*, java.io.*" %>
        <%@ page import="java.util.Iterator"%>
        <%@ page import="java.util.List"%>
        <%@ page import="java.io.File"%>
        <%@page import="java.sql.*" %>
    </head>

<body>
<!--top-Header-menu-->
<div>
  <%@include file="./includes/admin_header.jsp" %>
</div>

<!--sidebar-menu-->
<div>
    <%@include file="./includes/admin_sidebar.jsp" %>
</div>
<!--sidebar-menu-->

     <div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="./../index.jsp" title="Go to Home" class="tip-bottom"><i class="fa fa-home"></i> Home</a> <a href="#"><i class="fa fa-angle-right"></i>
            <i class="fa fa-user"></i> Room</a><i class="fa fa-angle-right"></i><a href="#" class="current">Add Room</a> 
    </div>
    <h3>Add Room</h3>
  </div>
  <div class="container">
     
      
      
       <%
            try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("addRoomBut") != null){
                String name, description, category;
                
                name=request.getParameter("name");
                description =request.getParameter("description");
                category=request.getParameter("category");
//                date_free =request.getParameter("date_free");
//                time_free =request.getParameter("time_free");
//               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into rooms( name, description, category) values(?, ?, ?);");
                
                preparestmnt.setString(1, name);
                preparestmnt.setString(2, description);
                preparestmnt.setString(3, category);
//                preparestmnt.setString(4, date_free);
//                preparestmnt.setString(5, time_free);
//                preparestmnt.setString(2, description);
                preparestmnt.executeUpdate(); //execute query
                
                request.setAttribute("successMsg", "Room successfully added");
                response.sendRedirect("./view_rooms.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
        %>

    <hr>
    <div class="col-sm-4">
        <form method="post" action="add_rooms.jsp" enctype="multipart/form-data">
            <div class="form-group">
                <label>Room Name</label>
                <input type="text" placeholder="room name" name="name" required="" id="roomName" class="form-control" >
            </div>
            <div class="form-group">
                <label>Room Type</label>
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
                <label>Description</label>
                <textarea
                   name="description"
                   id="roomDesc"
                   required
                   style="width: 350px;"
                   placeholder="Room Description"
                   required
                 >

                </textarea>
            </div>
            <div class="form-group">
                <label>Date Available(yyyy-mm-dd)</label>
                <input type="text"  name="date_free" id="roomdate" class="form-control" >
            </div>
             <div class="form-group">
                <label>Time Available(hour:min:sec)</label>
                <input type="text" name="time_free"  id="roomtime" class="form-control" >
            </div>
             <div class="form-group">
                <label>Image</label>
                <input type="file" name="image">
            </div>
            <input type="submit" name="addRoomBut" value="Add Room" class="btn btn-success pull-right">
        </form>
    </div>
    </div>
</div>   
  
        
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
