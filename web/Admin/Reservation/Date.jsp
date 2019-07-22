<%-- 
    Document   : Date
    Created on : Jul 22, 2019, 1:08:05 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%@page import="java.sql.*"%>
        <%@page import="java.text.DateFormat"%>
        
        <%@page import="java.text.SimpleDateFormat"%>
 

    </head>
    <body>
        
        <%
                 
               try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("reserveBut") != null){
                String check_in, check_out;
                int number_of_days, amount_due, one_day_cost;
                
                

                check_in =request.getParameter("check_in");
                check_out=request.getParameter("check_out");

                PreparedStatement preparestmnt = null; //Create statement
                String querry1 = "insert into reserve";
                preparestmnt = con.prepareStatement(querry1);
                

                String date1 =request.getParameter("check_in");

                String date2 =request.getParameter("check_out");

                SimpleDateFormat dateformat = new SimpleDateFormat ("E    yyyy.MM.dd"); //SDF to display output with day of week

                Date displaydate1=new Date(Long.parseLong(date1)); //Turning the inputed date from string
                                                   //to date format to be used for the output
                Date displaydate2=new Date(Long.parseLong(date2));

                  int differenceInDays = (int) ((displaydate2.getTime() - displaydate1.getTime())/(1000*60*60*24));//common method to calculate number of days

                out.println("Between " +dateformat.format(displaydate1)+ " and " +dateformat.format(displaydate2)+ " there are " +differenceInDays+ " days");


                
                preparestmnt.setString(1, check_in);
                preparestmnt.setString(2, check_out);

                preparestmnt.executeUpdate(); //execute query
                
                String message = "Reservation made successfully";
                request.setAttribute("msg", message);
                response.sendRedirect("./view_reserved.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
              %>
              
              <form action="Date.jsp">
                  <input type="date" value="2019-07-12" name="check_in">
                  <input type="date" value="2019-07-21" name="check_in">
                  <input type="text" name="number_of_days" value="number_of_days">
                  <input type="submit" class="btn" value="Try" />

              </form>
    </body>
</html>
