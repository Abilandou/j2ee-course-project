<%-- 
    Document   : handleViewCustomers
    Created on : May 3, 2019, 6:53:35 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<head></head>
        <%   
           String str = request.getParameter("uid");

            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement statement = con.createStatement();
            String query = "UPDATE reserve SET status='"+0+"' WHERE id="+str;
            int i = statement.executeUpdate(query);
            
            if(i == 1){
               response.sendRedirect("./../view_reserved.jsp");
//               out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
            }
            else{
     //        out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
            }
            }catch (ClassNotFoundException e){
                e.printStackTrace();
            }

          

        %>
        
        