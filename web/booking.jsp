<%-- 
    Document   : handleBooking
    Created on : Jun 4, 2019, 4:52:12 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/header.jsp"  %>
        <%@include file="AllIncludes.jsp" %>
        <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        <title>booking</title>
    </head>

    <body>
        <%
            try{
             String strl = request.getParameter("uid");

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "SELECT * FROM rooms WHERE id="+strl;
            ResultSet rs = stat.executeQuery(query);
            
        
            

            if(rs.next()){
             %>


             <div class="container">
                 <div class="row-fluid jumbotron">
                     <div class="col-sm-3">

                     </div>
                     <div class=" col-sm-6">
                         <h4>Verify Your Information and Complete Booking</h4>
                     </div>
                     <div class="col-sm-3">

                     </div>
                 </div>
             </div>
             <div class="container">
                 <div class="row">
                      <div class="col-sm-3">

                     </div>
                     <div class=" col-6">
                         <div class="col-sm-2"><h4>Name: </h4></div>
                         <div class="col-sm-2"><h4> Email:</h4></div>
                         <div class="col-sm-2">
                             <form action="./booking.jsp" method="post">
                                 <input type="hidden" name="hid" value="<%= rs.getString("id")%>" >
                                 <input type="hidden" name="booked" value="1" />
                                 <div class="form-group">
                                     <input type="submit" name="bookBut" value="Complete Booking" class="btn btn-success btn-sm">
                                 </div>
                             </form>
                         </div>

                     </div>
                     <div class="col-sm-3">

                     </div>
                 </div>
             </div>

             <%
             }
             else{
                 %>
                 <h3 class="text-danger">Sorry Could not book a room at this moment</h3>
                 <%
             }
        }
        catch(Exception e){
//           response.sendRedirect("./../404.jsp");
            out.println(e);
         
       }
            %>
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
               if((session.getAttribute("email") == null) || (session.getAttribute("email") == "")){
                   response.sendRedirect("./Login.jsp");
               }else{
                    response.sendRedirect("./thanks_booking.jsp");
                    out.println("<h4 class='text-danger'>Sorry, Unable To Book this room at this moment</h4>");
               }
              
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
       
       
       
       <%@include file="includes/footer.jsp"  %>
    </body>
</html>
 