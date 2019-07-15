<%-- 
    Document   : add_categories.jsp
    Created on : May 3, 2019, 6:42:39 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502Hotel Admin | Add-Room</title>

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
          <%
      
          String strl = request.getParameter("uid");
          String str1 = request.getParameter("room_name");
          String str2 = request.getParameter("room_number");
          String str3 = request.getParameter("customer_name");
          String str4 = request.getParameter("customer_email");
          String str5 = request.getParameter("check_in");
          String str6 = request.getParameter("from_time");
          String str7 = request.getParameter("check_out");
          String str8 = request.getParameter("to_time");
          String str9 = request.getParameter("adults");
          String str10 = request.getParameter("children");
          String str11 = request.getParameter("amount_due");
          String str12 = request.getParameter("status");
          String str13 = request.getParameter("hid");
          
       try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "UPDATE reserve SET room_name='"+str1+"', room_number='"+str2+"', customer_name='"+str3+"', status='"+str12+"', customer_email='"+str4+"', check_in='"+str5+"', from_time='"+str6+"', check_out='"+str7+"', to_time='"+str8+"', adults='"+str9+"', children='"+str10+"', amount_due='"+str11+"' WHERE id='"+str13+"'";
           int i = stat.executeUpdate(query);
           if(i == 1){
               response.sendRedirect("./view_reserved.jsp");
               out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
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
        <div class="col-md-12">
            <div class="col-md-1"><%@include file="./includes/admin_sidebar.jsp" %></div>
            <div class="col-md-2"></div>
             <%
      
            try{

                  Class.forName("com.mysql.jdbc.Driver");

                  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                  Statement stat = con.createStatement();
                  String query = "SELECT * FROM reserve WHERE id="+strl;
                  ResultSet rs = stat.executeQuery(query);
                if(rs.next()){
                %>
                <div class="col-md-7 card hoverable">
                    <h6>Required Fields are marked(<b class="text-danger">*</b>)</h6>
                    
                   <form action="./edit_reserve.jsp" method="post"  id="reserve_form">
                       <input type="hidden" name="hid" value="<%=rs.getString("id")  %>" >
                        <div class="form-group">
                            <label class="text-dark lead">Room Name<span class="text-danger">*</span></label>
                            <select name="room_name" required="" class="form-control">
                                 <option value="<%=rs.getString("room_name") %>"><%=rs.getString("room_name") %></option>
                                 <% 
                                     try{

                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                        Statement stm = conn.createStatement();
                                        String sql = "SELECT * FROM rooms WHERE booked='"+0+"'";

                                        ResultSet rsl = stm.executeQuery(sql);

                                        while(rsl.next()){
                                            %>
                                            <option value="<%=rsl.getString("name")  %>"><%=rsl.getString("name")  %></option>
                                            <%
                                        }
                                        }catch(Exception e){
                                            out.println(e);
                                        }
                                  %>

                            </select>
                        </div>
                        <div class="form-group">
                            <label class="lead">Room Number<span class="text-danger">*</span></label>
                            <input
                                class="form-control" 
                                type="text" name="room_number" 
                                value="<%=rs.getString("room_number") %>"
                                id="number" 
                                required
                            >
                        </div>
                        <div class="form-group">
                            <label class="text-dark lead">Guest Name<span class="text-danger">*</span></label>
                            <input
                                class="form-control" 
                                type="text" name="customer_name"
                                value="<%=rs.getString("customer_name") %>"
                                id="customer_name" 
                                required
                            >
                        </div>
                        <div class="form-group">
                            <label class="text-dark lead">Guest Email<span class="text-danger">*</span></label>
                            <input
                                class="form-control" 
                                type="email" name="customer_email" 
                                value="<%=rs.getString("customer_email") %>"
                                id="customer_email" 
                                required
                            >
                        </div>
                        <input
                            class="form-control" 
                            type="hidden" name="status" 
                            value="1"
                        >
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <label class="text-dark lead">Check In<span class="text-danger">*</span></label>
                                <input required 
                                    type="date" name="check_in"
                                    value="<%=rs.getString("check_in")%>"
                                    id="check_in" 
                                >
                            </div> 
                            <div class=" col-sm-6">
                                <label class="text-dark lead">From Time<span class="text-danger">*</span></label>
                                <input required 
                                    type="time" name="from_time"
                                    value="<%=rs.getString("from_time") %>"
                                    id="from_time" 
                                >
                            </div> 
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <label class="text-dark lead">Check Out<span class="text-danger">*</span></label>
                                <input required 
                                    type="date" name="check_out" 
                                    value="<%=rs.getString("check_out") %>"
                                    id="check_out" 
                                >
                            </div> 
                            <div class=" col-sm-6">
                                <label class="text-dark lead">To Time<span class="text-danger">*</span></label>
                                <input required 
                                    type="time" name="to_time"
                                    value="<%=rs.getString("to_time") %>"
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
                                 value="<%=rs.getString("adults") %>"
                                 max="3" min="1"
                            >
                        </div>
                        <div class="form-group">
                            <label class="text-dark lead">Children</label>
                            <input
                                class="form-control" 
                                type="number" name="children"
                                value="<%=rs.getString("children") %>"
                                id="children" 
                                max="3" min="0"
                            >
                        </div>
                        <div class="form-group">
                            <label class="text-dark lead">Amount Due<span class="text-danger">*</span></label>
                            <input required 
                                class="form-control" 
                                type="number" name="amount_due"
                                value="<%=rs.getString("amount_due") %>"
                                id="amount_due" 
                            >
                        </div>
                         <div class="form-group" >
                            <input type="submit" name="reserveBut" value="Edit Reservation" class="btn pull-right" style="margin-bottom: 20px;">
                        </div>
                <%
                }
                else{
                %>
                <%
                    response.sendRedirect("./../404.jsp");
                %>
            <%
                }
            }catch(Exception e){
                out.println(e);
            }
            %>
              </form>
           </div>
        </div>              
    </div>      
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
