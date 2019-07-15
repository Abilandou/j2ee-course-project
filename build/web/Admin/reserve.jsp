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
        <title>Admin | Reserve Room</title>

        <!--close-Header-part--> 
        <%@include file="AllAdminIncludes.jsp"  %>
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
            
            if(request.getParameter("reserveBut") != null){
                String name, number,  customer_name, customer_email, booked;
                String check_in, check_out, from_time, to_time, adults, children;
                
                
                //Calculatin the amount due to insert in the database.
                
                
                name=request.getParameter("name");
                number=request.getParameter("number");
                customer_name=request.getParameter("customer_name");
                customer_email =request.getParameter("customer_email");
                booked =request.getParameter("booked");
                check_in =request.getParameter("check_in");
                from_time =request.getParameter("from_time");
                check_out=request.getParameter("check_out");
                to_time =request.getParameter("to_time");
                adults=request.getParameter("adults");
                children=request.getParameter("children");
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into rooms( name, number,"+
                        "customer_name, customer_email, booked, check_in, from_time, check_out, to_time, adults, children) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
                
                preparestmnt.setString(1, name);
                preparestmnt.setString(2, number);
                preparestmnt.setString(3, customer_name);
                preparestmnt.setString(4, customer_email);
                preparestmnt.setString(5, booked);
                preparestmnt.setString(6, check_in);
                preparestmnt.setString(7, from_time);
                preparestmnt.setString(8, check_out);
                 preparestmnt.setString(9, to_time);
                preparestmnt.setString(10, adults);
                preparestmnt.setString(11, children);
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
              
                <form action="reserve.jsp" method="post"  id="reserve_form">
                    <div class="form-group">
                        <label class="text-dark lead">Room Name<span class="text-danger">*</span></label>
                        <select name="name" required="" class="form-control">
                             <option value="">Select Room</option>
                             <% 
                                 try{

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM rooms WHERE booked='"+0+"'";

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
                        <label class="text-dark lead">Room Number<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="text" name="number" 
                            id="number" 
                            required
                        >
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Guest Name<span class="text-danger">*</span></label>
                        <input
                            class="form-control" 
                            type="text" name="customer_name" 
                            id="customer_name" 
                            required
                        >
                    </div> 
                    <div class="form-group">
                        <label class="text-dark lead">Guest Email<span class="text-danger">*</span></label>
                        <input
                            class="form-control" 
                            type="email" name="customer_email" 
                            id="customer_email" 
                            required
                        >
                    </div>
                    <input
                        class="form-control" 
                        type="hidden" name="booked" 
                        value="1"
                    >
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <label class="text-dark lead">Check In<span class="text-danger">*</span></label>
                            <input required 
                                type="date" name="check_in" 
                                id="check_in" 
                            >
                        </div> 
                        <div class=" col-sm-6">
                            <label class="text-dark lead">From Time<span class="text-danger">*</span></label>
                            <input required 
                                type="time" name="from_time" 
                                id="from_time" 
                            >
                        </div> 
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <label class="text-dark lead">Check Out<span class="text-danger">*</span></label>
                            <input required 
                                type="date" name="check_out" 
                                id="check_out" 
                            >
                        </div> 
                        <div class=" col-sm-6">
                            <label class="text-dark lead">To Time<span class="text-danger">*</span></label>
                            <input required 
                                type="time" name="to_time" 
                                id="to_time" 
                            >
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Adults<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="number" name="adults" 
                            id="adults" 
                            value="1"
                        >
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Children</label>
                        <input
                            class="form-control" 
                            type="number" name="children" 
                            id="children" 
                            value="0"
                        >
                    </div>
                    <div class="form-group">
                        <input type="submit" name="reserveBut" value="Make Reservation" class="btn pull-right">
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
