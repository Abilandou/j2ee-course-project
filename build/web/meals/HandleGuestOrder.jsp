<%-- 
    Document   : registerHandle
    Created on : Apr 26, 2019, 9:02:47 PM
    Author     : godlove
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Random" %>


        <%
            try{

                Class.forName("com.mysql.jdbc.Driver");

                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");

               if(request.getParameter("mealOrderBut") != null){
                   String room_id, guest_id, meal_type;
                   String number_of_plates, amount_per_plate;
                   int total_amount;
                   room_id=request.getParameter("room_id");
                   guest_id=request.getParameter("guest_id");
                   meal_type=request.getParameter("meal_type");
                   number_of_plates =request.getParameter("number_of_plates");
                   amount_per_plate =request.getParameter("amount_per_plate");
                   total_amount = Integer.parseInt(number_of_plates) * Integer.parseInt(amount_per_plate);


                   PreparedStatement preparestmnt = null; //Create statement

                   preparestmnt = con.prepareStatement("insert into meals( room_id, guest_id,meal_type, number_of_plates, amount_per_plate, total_amount) values(?, ?, ?, ?, ?, ?);");

                   preparestmnt.setString(1, room_id);
                   preparestmnt.setString(2, guest_id);
                   preparestmnt.setString(3, meal_type);
                   preparestmnt.setString(4, number_of_plates);
                   preparestmnt.setString(5, amount_per_plate);
                   preparestmnt.setInt(6, total_amount);
                   preparestmnt.executeUpdate(); //execute query

                   String message = "Success In Meal Odering.";
                   request.setAttribute("msg", message);
                   response.sendRedirect("./../account.jsp");

                   con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
        %>
        