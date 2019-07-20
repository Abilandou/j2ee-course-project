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
  
            <!--Guest Room Reservation logic-->
        <%

        try{

         Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");

         if(request.getParameter("reserveBut") != null){
             String  room_id,  customer_id, determinant;
             String check_in, check_out, from_time, to_time, adults, children;

             //Calculatin the amount due to insert in the database.

             room_id=request.getParameter("room_id");
             customer_id=request.getParameter("customer_id");
             check_in =request.getParameter("check_in");
             from_time =request.getParameter("from_time");
             check_out=request.getParameter("check_out");
             to_time =request.getParameter("to_time");
             adults=request.getParameter("adults");
             children=request.getParameter("children");
             determinant=request.getParameter("determinant");


             PreparedStatement preparestmnt = null; //Create statement
             String querry1 = "insert into reserve(room_id,"+
                     "customer_id, check_in, from_time, check_out, to_time, adults, children, determinant) values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
             preparestmnt = con.prepareStatement(querry1);

             preparestmnt.setString(1, room_id);
             preparestmnt.setString(2, customer_id);
             preparestmnt.setString(3, check_in);
             preparestmnt.setString(4, from_time);
             preparestmnt.setString(5, check_out);
             preparestmnt.setString(6, to_time);
             preparestmnt.setString(7, adults);
             preparestmnt.setString(8, children);
             preparestmnt.setString(9, determinant);

             preparestmnt.executeUpdate(); //execute query

             String message = "Reservation made successfully";
             request.setAttribute("msg", message);
             response.sendRedirect("./../thanks_booking.jsp");

             con.close();
         }
         }catch(Exception e){
             out.println(e);
         }

        %> 
    </body>
</html>
