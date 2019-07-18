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
        <%@page import="java.text.DateFormat"%>
        
        <%@page import="java.text.SimpleDateFormat"%>
        <%@page import="java.util.Calendar" %> 
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
                        
                        String theid;
                        theid=request.getParameter("room_id");
                         String query = "UPDATE rooms SET booked='"+1+"' WHERE id='"+theid+"'";
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
                String  room_id,  customer_name, customer_email, cost_per_day;
                String check_in, check_out, from_time, to_time, adults, children;
                int number_of_days, amount_due, one_day_cost;
      
                
                //Calculatin the amount due to insert in the database.

                room_id=request.getParameter("room_id");
                customer_name=request.getParameter("customer_name");
                customer_email =request.getParameter("customer_email");
                check_in =request.getParameter("check_in");
                from_time =request.getParameter("from_time");
                check_out=request.getParameter("check_out");
                to_time =request.getParameter("to_time");
                adults=request.getParameter("adults");
                children=request.getParameter("children");
                cost_per_day=request.getParameter("cost_per_day");
                
//                number_of_days = Integer.parseInt(check_out) - Integer.parseInt(check_in);
               
                
                SimpleDateFormat dateformat = new SimpleDateFormat ("E    yyyy.MM.dd"); //SDF to display output with day of week

                Date in_date=new Date(Long.parseLong(check_in)); //Turning the inputed date from string
                                                   //to date format to be used for the output
                Date out_date=new Date(Long.parseLong(check_out));

                number_of_days = (int) ((out_date.getTime() - in_date.getTime())/(1000*60*60*24));//common method to calculate number of days
                one_day_cost = Integer.parseInt(cost_per_day);
                amount_due = number_of_days * one_day_cost;
                
//                    SimpleDateFormat datformat = new SimpleDateFormat ("E    yyyy.MM.dd"); //SDF to display output with day of week
//
//                Date displaydate1=new Date(date1); //Turning the inputed date from string
//                                                   //to date format to be used for the output
//                Date displaydate2=new Date(date2);
//
//                int differenceInDays = (int) ((displaydate2.getTime() - displaydate1.getTime())/(1000*60*60*24));//common method to calculate number of days

                
               
                
                PreparedStatement preparestmnt = null; //Create statement
                String querry1 = "insert into reserve(room_id,"+
                        "customer_name, customer_email, check_in, from_time, check_out, to_time, adults, children) values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
                preparestmnt = con.prepareStatement(querry1);
                
                preparestmnt.setString(1, room_id);
                preparestmnt.setString(2, customer_name);
                preparestmnt.setString(3, customer_email);
                preparestmnt.setString(4, check_in);
                preparestmnt.setString(5, from_time);
                preparestmnt.setString(6, check_out);
                preparestmnt.setString(7, to_time);
//                preparestmnt.setInt(8, number_of_days);
                preparestmnt.setString(8, adults);
                preparestmnt.setString(9, children);
//                preparestmnt.setString(11, cost_per_day);
//                preparestmnt.setInt(12, amount_due);
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
<%--<!--                    <input required 
                        class="form-control" 
                        type="hidden" name="number_of_days"
                        value="number_of_days"
                        id="numdays"
                    >-->
<!--                    <div class="form-group">
                        <label class="text-dark lead">One Day Cost<span class="text-danger">*</span></label>
                        <input required 
                            class="form-control" 
                            type="number" name="cost_per_day" 
                            id="costaday" 
                            min="1"
                        >
                    </div>--> --%>
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
<!--                    <input required 
                        class="form-control" 
                        type="hidden" name="amount_due"
                        value="amount_due"
                        id="numdays"
                    >-->
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
