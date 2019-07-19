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
        <title>Admin | Add_Room</title>

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
            
            if(request.getParameter("addGuestBut") != null){
                String first_name, last_name, email, city, state, country, address, phone;
                
                first_name=request.getParameter("first_name");
                last_name=request.getParameter("last_name");
                email=request.getParameter("email");
                city =request.getParameter("city");
                state =request.getParameter("state");
                country=request.getParameter("country");
                address=request.getParameter("address");
                phone=request.getParameter("phone");
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("INSERT INTO customers( first_name, last_name, email, city, state, country, address, phone) values(?, ?, ?, ?, ?, ?, ?, ?);");
                
                preparestmnt.setString(1, first_name);
                preparestmnt.setString(2, last_name);
                preparestmnt.setString(3, email);
                preparestmnt.setString(4, city);
                preparestmnt.setString(5, state);
                preparestmnt.setString(6, country);
                preparestmnt.setString(7, address);
                preparestmnt.setString(8, phone);
                preparestmnt.executeUpdate(); //execute query
                
                String message = "Guest added successfully";
                request.setAttribute("msg", message);
                response.sendRedirect("./view_customers.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
            %>  
                <form action="add_guest.jsp" id="UserRegisterForm" class="mx-5" method="post">
                    <div class="form-group">
                        <label><h5>First Name</h5></label>
                        <input type="text" class="form-control first_name" name="first_name" required id="first_name"/>
                    </div>
                    <div class="form-group">
                        <label><h5>Last Name</h5></label>
                        <input type="text" class="form-control last_name" name="last_name" required id="last_name" />
                    </div>
                     <div class="form-group">
                         <label><h5>Email</h5></label>
                        <input type="email" class="form-control email" name="email" required id="email" />
                    </div>
                    <div class="form-group">
                        <label><h5>Address</h5></label>
                        <input type="text" class="form-control address" name="address" required id="address"  />
                    </div>
                     <div class="form-group">
                         <label><h5>Phone</h5></label>
                        <input type="text" class="form-control phone" name="phone" required id="phone"  />
                    </div>
                     <div class="form-group">
                         <label><h5>City</h5></label>
                        <input type="text" class="form-control city" name="city" required id="city"  />
                     </div>
                     <div class="form-group">
                         <label><h5>State</h5></label>
                        <input type="text" class="form-control state" name="state" required id="state"  />
                    </div>
                     <div class="form-group">
                         <label><h5>Country</h5></label>
                        <select name="country" class="browser-default">
                            <option value="">Select country</option>
                            <% 
                                try{

                                   Class.forName("com.mysql.jdbc.Driver");
                                   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                   Statement stm = conn.createStatement();
                                   String sql = "SELECT * FROM countries";

                                   ResultSet rst = stm.executeQuery(sql);

                                   while(rst.next()){
                                       %>
                                       <option value="<%=rst.getString("country_name")  %>"><%=rst.getString("country_name")  %></option>
                                       <%
                                   }

                                   }catch(Exception e){
                                       out.println(e);
                                   }
                             %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><h5>PassWord</h5></label>
                        <input type="password" class="form-control password" name="password" required id="password"  />
                    </div>
                    <div class="form-group">
                        <input type="submit" name="addGuestBut" class="btn right" value="Add Guest" />
                    </div>
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
