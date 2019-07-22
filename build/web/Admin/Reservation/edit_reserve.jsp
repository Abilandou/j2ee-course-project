<%-- 
    Document   : add_categories.jsp
    Created on : May 3, 2019, 6:42:39 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <%@page import="java.sql.*" %>
<body>

<!--sidebar-menu-->
<div class="container-fluid">
    <div class="row">
          <%
      
          String strl = request.getParameter("uid");
          String str1 = request.getParameter("room_id");
          String str2 = request.getParameter("customer_id");
          String str3 = request.getParameter("check_in");
          String str4 = request.getParameter("from_time");
          String str5 = request.getParameter("check_out");
          String str6 = request.getParameter("to_time");
          String str7 = request.getParameter("adults");
          String str8 = request.getParameter("children");
          String str9 = request.getParameter("hid");
          
       try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502?allowMultiQueries=true", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "UPDATE reserve SET room_id='"+str1+"', customer_id='"+str2+"', check_in='"+str3+"', from_time='"+str4+"', check_out='"+str5+"', to_time='"+str6+"', adults='"+str7+"', children='"+str8+"' WHERE id='"+str9+"'";
           int i = stat.executeUpdate(query);
           if(i == 1){
               response.sendRedirect("./../view_reserved.jsp");
               
           }
           else{
//              out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
           }
        }
       catch(Exception e){
//           response.sendRedirect("./../404.jsp");
            out.println(e);
         
       }
       %>
                      
    </div>      
</body>

</html>
