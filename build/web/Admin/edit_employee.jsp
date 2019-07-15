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
          String str1 = request.getParameter("id_number");
          String str2 = request.getParameter("name");
          String str3 = request.getParameter("email");
          String str4 = request.getParameter("position");
          String str5 = request.getParameter("phone");
          String str6 = request.getParameter("address");
          String str7 = request.getParameter("hid");
          
       try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "UPDATE employees SET  id_number='"+str1+"', name='"+str2+"', email='"+str3+"', position='"+str4+"', phone='"+str5+"', address='"+str6+"' WHERE id='"+str7+"'";
           int i = stat.executeUpdate(query);
           if(i == 1){
               response.sendRedirect("./Employees.jsp");
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
            String query = "SELECT * FROM employees WHERE id="+strl;
            ResultSet rs = stat.executeQuery(query);
            if(rs.next()){
                %>
                <div class="col-md-7 card hoverable">
                    <h6>Required Fields are marked(<b class="text-danger">*</b>)</h6>
                    
                   <form method="post" action="edit_employee.jsp">
                        <input type="hidden" name="hid" value="<%=rs.getString("id")  %>" >
                        <div class="form-group">
                            <label class="lead">Id Number<span class="text-danger">*</span></label>
                            <input type="text" name="id_number" required="" value="<%=rs.getString("id_number")  %>" id="id_number" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label class="lead">Name<span class="text-danger">*</span></label>
                            <input type="text" name="name" required="" value="<%=rs.getString("name")  %>" id="empname" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label class="lead">Email<span class="text-danger">*</span></label>
                            <input type="email" name="email" required="" value="<%=rs.getString("email")  %>" id="empemail" class="form-control" >
                        </div>
                        
                        <div class="form-group">
                         <label class="lead" >Job Position<span class="text-danger">*</span></label>
                         <select name="position" required="" class="form-control">
                              <option value="<%=rs.getString("position")  %>"><%=rs.getString("position")  %></option>
                              <% 
                                  try{

                                     Class.forName("com.mysql.jdbc.Driver");
                                     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                     Statement stm = conn.createStatement();
                                     String sql = "SELECT * FROM positions";

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
                            <h4 class="lead">Phone<span class="text-danger">*</span></h4>
                            <input required 
                                class="form-control" 
                                type="text" name="phone" 
                                id="price" 
                                value ="<%=rs.getString("phone")  %>"
                            >
                        </div>
                        <div class="form-group">
                            <h4 class="lead">Address<span class="text-danger">*</span></h4>
                            <input required 
                                class="form-control" 
                                type="text" name="address" 
                                id="price" 
                                value ="<%=rs.getString("address")  %>"
                            >
                        </div>
                        
                        <input type="submit" name="updateBut" value="Update Room" class="btn pull-right" style="margin-bottom: 20px;">
                    </form> 
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
    </div>
</div>
                        
                       
</div>   
  
        
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
