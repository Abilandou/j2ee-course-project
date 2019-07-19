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
                
                <!--Updating booked field under rooms table-->
                <%
                    try{
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");         
                    if(request.getParameter("reserveBut") != null){
                        
                        String rumid;
                        rumid=request.getParameter("room_id");
                         String query = "UPDATE rooms SET booked='"+1+"' WHERE id='"+rumid+"'";
                        Statement stat = con.createStatement();
//                        ResultSet rs = stat.executeQuery(query);
                            int i = stat.executeUpdate(query);
                            if(i == 1){
//                                response.sendRedirect("./view_reserved.jsp");
//                                out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                            }
                            else{
                 //              out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                            }
                      

                       
                    }
                    }catch(Exception e){
                        out.println(e);
                    }
               
                %>
                <!--Updating has_room field under customers table-->
                 <%
                    try{
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");         
                    if(request.getParameter("reserveBut") != null){
                        
                        String custid;
                        custid=request.getParameter("customer_id");
                         String query = "UPDATE customers SET has_room='"+1+"' WHERE id='"+custid+"'";
                        Statement stat = con.createStatement();
//                        ResultSet rs = stat.executeQuery(query);
                            int i = stat.executeUpdate(query);
                            if(i == 1){
//                                response.sendRedirect("./view_reserved.jsp");
//                                out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                            }
                            else{
                 //              out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                            }
                      

                       
                    }
                    }catch(Exception e){
                        out.println(e);
                    }
               
                %>
                <%
                 
               try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("reserveBut") != null){
                String  room_id,  customer_id;
                String check_in, check_out, from_time, to_time, adults, children;
                int number_of_days, amount_due, one_day_cost;
                
                
                //Calculatin the amount due to insert in the database.

                room_id=request.getParameter("room_id");
                customer_id=request.getParameter("customer_id");
                check_in =request.getParameter("check_in");
                from_time =request.getParameter("from_time");
                check_out=request.getParameter("check_out");
                to_time =request.getParameter("to_time");
                adults=request.getParameter("adults");
                children=request.getParameter("children");
                
//                
//                number_of_days = Integer.parseInt(check_out) - Integer.parseInt(check_in);
//                one_day_cost = Integer.parseInt(cost_per_day);
//                amount_due = number_of_days * one_day_cost;
               
                
                PreparedStatement preparestmnt = null; //Create statement
                String querry1 = "insert into reserve(room_id,"+
                        "customer_id, check_in, from_time, check_out, to_time, adults, children) values(?, ?, ?, ?, ?, ?, ?, ?);";
                preparestmnt = con.prepareStatement(querry1);
                
                preparestmnt.setString(1, room_id);
                preparestmnt.setString(2, customer_id);
                preparestmnt.setString(3, check_in);
                preparestmnt.setString(4, from_time);
                preparestmnt.setString(5, check_out);
                preparestmnt.setString(6, to_time);
                preparestmnt.setString(7, adults);
                preparestmnt.setString(8, children);

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
                        <select name="room_id" required="" class="form-control">
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
                                        <option value="<%=rs.getString("id")%>"><%=rs.getString("name")  %></option>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }
                              %>

                        </select>
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Guest Full Name<span class="text-danger">*</span></label>
                        <select name="customer_id" required="" class="form-control">
                             <% 
                                 try{
                                    
                                    String strl = request.getParameter("uid");
                                     
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM customers WHERE id='"+strl+"'";

                                    ResultSet rs = stm.executeQuery(sql);

                                    if(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("id")%>"><%=rs.getString("first_name")  %> <%=rs.getString("last_name")  %></option>
                                        <%
                                    }else{
                                        %>
                                        <option value="">Select Guest</option>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }
                              %>
                             
                             <% 
                                 try{
                                     
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                    Statement stm = conn.createStatement();
                                    String sql = "SELECT * FROM customers";

                                    ResultSet rs = stm.executeQuery(sql);

                                    while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("id")%>"><%=rs.getString("first_name")  %> <%=rs.getString("last_name")  %></option>
                                        <%
                                    }
                                    }catch(Exception e){
                                        out.println(e);
                                    }
                              %>

                        </select>
                    </div>
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
                    <input required 
                        class="form-control" 
                        type="hidden" name="number_of_days"
                        value="number_of_days"
                        id="numdays"
                    >
                    <div class="form-group">
                        <label class="text-dark lead">Adults<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="number" name="adults" 
                            id="adults" 
                            value="1"
                            min="1"
                        >
                    </div>
                    <div class="form-group">
                        <label class="text-dark lead">Children</label>
                        <input
                            class="form-control" 
                            type="number" name="children" 
                            id="children" 
                            value="0"
                            min="0"
                        >
                    </div>
                    <input required 
                        class="form-control" 
                        type="hidden" name="amount_due"
                        value="amount_due"
                        id="numdays"
                    >
                    <div class="form-group">
                        <input type="submit" name="reserveBut" value="Make Reservation" class="btn pull-right">
                    </div>
                     <br/>
                </form>
            </div>
        </div>
    </div>
</div>     
<script>
     $(document).ready(function(){
        var check_in_date = $("#check_in").val();
        var check_out_date = $("#check_out").val();
        var in_date = new Date(check_in_date); 
        var out_date = new Date(check_out_date);
        if((in_date > out_date) || (out_date < in_date)){
            alert("Check out date can not be less than check in date ");
            return false;
        }
    });
</script>
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
