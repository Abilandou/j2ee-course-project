<%-- 
    Document   : guest_reserve
    Created on : Jul 5, 2019, 10:37:08 AM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@page import="java.sql.*" %>
    </head>
    <body>
         <%
           
      
          String strt = request.getParameter("uid");
          String str1 = request.getParameter("booked");
          String str2 = request.getParameter("hid");
          
       try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "UPDATE  rooms  SET booked='"+1+"' WHERE id='"+strt+"'";
           int i = stat.executeUpdate(query);
           if(i == 1){
               response.sendRedirect("./booking.jsp");
               out.println("<h4 class='text-danger'>Sorry, Unable To Book this room at this moment</h4>");
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
        <%
            try{
              
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                
                if(request.getParameter("guestReserve") != null ){
                    String name, email, phone, country, adults, children, check_in, check_out, determinant;
                    
                    name = request.getParameter("name");
                    email = request.getParameter("email");
                    phone = request.getParameter("phone");
                    country =request.getParameter("country");
                    adults = request.getParameter("adults");
                    children =request.getParameter("children");
                    check_in = request.getParameter("check_in");
                    check_out = request.getParameter("check_out");
                    determinant = request.getParameter("determinant");
                    
                    PreparedStatement prepareStmnt = null;
                    
                    prepareStmnt = con.prepareStatement("INSERT INTO guest (name, email, phone, country, adults, children, check_in, check_out, determinant) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    prepareStmnt.setString(1, name);
                    prepareStmnt.setString(2, email);
                    prepareStmnt.setString(3, phone);
                    prepareStmnt.setString(4, country);
                    prepareStmnt.setString(5, adults);
                    prepareStmnt.setString(6, children);
                    prepareStmnt.setString(7, check_in);
                    prepareStmnt.setString(8, check_out);
                    prepareStmnt.setString(9, determinant);
                    
                    prepareStmnt.executeUpdate();
                    
                    request.setAttribute("msg", "Success");
                    response.sendRedirect("./../request_reserve.jsp");
                    
                    con.close();
                }
                
            }catch(Exception ex){
                out.println(ex);
            }
        
        %>
    </body>
</html>
