
<%-- 
    Document   : handleViewCustomers
    Created on : May 3, 2019, 6:53:35 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>

  <%@page import="java.text.DateFormat"%>
        
        <%@page import="java.text.SimpleDateFormat"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502 Hotel Admin | view Rooms</title>
    </head>
 <body background="/images/rooms/hotel1.png">
   
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

                            
                   <%
                 
               try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("reserveBut") != null){
                String check_in, check_out;
                int number_of_days, amount_due, one_day_cost, days;
                
                
                
                check_in =request.getParameter("check_in");

                check_out =request.getParameter("check_out");

                SimpleDateFormat dateformat = new SimpleDateFormat ("E    MM.dd.yyyy"); //SDF to display output with day of week

                Date displaydate1=new Date(Long.parseLong(check_in)); //Turning the inputed date from string
                                                   //to date format to be used for the output
                Date displaydate2=new Date(Long.parseLong(check_out));
                days = (int) ((displaydate2.getTime() - displaydate1.getTime())/(1000*60*60*24));//common method to calculate number of days

                out.println("Between " +dateformat.format(displaydate1)+ " and " +dateformat.format(displaydate2)+ " there are " +days+ " days");

//                check_in =request.getParameter("check_in");
//                check_out=request.getParameter("check_out");

                PreparedStatement preparestmnt = null; //Create statement
                String querry1 = "insert into try(check_in, check_out, days) values(?, ?, ?)";
                preparestmnt = con.prepareStatement(querry1);
                


                
//                preparestmnt.setDate(1, displaydate1);
//                preparestmnt.setDate(2, displaydate2);
                preparestmnt.setString(1, check_in);
                preparestmnt.setString(2, check_out);
                preparestmnt.setInt(3, days);

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
              
              <form action="view_reserved.jsp">
                  <input id="indate" type="date"  name="check_in">
                  <input type="date"  name="check_out">
                  <input type="hidden" value="days" name="days">
                  <input id="trying" type="submit" class="btn" value="Try" />

              </form>
        </div>
    </div>
</div>
    <script>

        $("a#cancelreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To cancel this reservation?")) {
                return true;
            }
            return false;
        });
        
        $("a#delreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To delete this reservation? You will never recover it again")) {
                return true;
            }
            return false;
        });
        $("a#acceptreserve").click(function() {
        // alert('something');
            if (confirm("Are You Sure To accept guest request for reservation?")) {
                return true;
            }
            return false;
        });
        
        
        
    </script>  
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>
</body>
</html>
