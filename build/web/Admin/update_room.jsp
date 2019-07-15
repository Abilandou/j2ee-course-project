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
          String str1 = request.getParameter("name");
          String str2 = request.getParameter("number");
          String str3 = request.getParameter("category");
          String str4 = request.getParameter("description");
          String str5 = request.getParameter("price");
          String str6 = request.getParameter("date_free");
          String str7 = request.getParameter("time_free");
          String str8 = request.getParameter("hid");
          
       try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "UPDATE rooms SET name='"+str1+"', number='"+str2+"', category='"+str3+"', description='"+str4+"', price='"+str5+"', date_free='"+str6+"', time_free='"+str7+"' WHERE id='"+str8+"'";
           int i = stat.executeUpdate(query);
           if(i == 1){
               response.sendRedirect("./view_rooms.jsp");
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
            String query = "SELECT * FROM rooms WHERE id="+strl;
            ResultSet rs = stat.executeQuery(query);
            if(rs.next()){
                %>
                <div class="col-md-7 card hoverable">
                    <h6>Required Fields are marked(<b class="text-danger">*</b>)</h6>
                    
                   <form method="post" action="update_room.jsp">
                        <input type="hidden" name="hid" value="<%=rs.getString("id")  %>" >
                        <div class="form-group">
                            <label class="lead">Room Name</label>
                            <input type="text" placeholder="room name" name="name" required="" value="<%=rs.getString("name")  %>" id="roomName" class="form-control" >
                        </div>
                        <div class="form-group">
                            <label class="lead">Room Number</label>
                            <input type="text" placeholder="room number" name="number" required="" value="<%=rs.getString("number")  %>" id="roomnumber" class="form-control" >
                        </div>
                        
                            <div class="form-group">
                <label class="lead" >Room Type</label>
                <select name="category" required="" class="form-control">
                     <option value="<%=rs.getString("category")  %>"><%=rs.getString("category")  %></option>
                     <% 
                         try{
                              
                            Class.forName("com.mysql.jdbc.Driver");
                           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                            Statement stm = conn.createStatement();
                            String sql = "SELECT * FROM categories";

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
                            <label class="lead">Description</label>
                            <textarea
                               name="description"
                               id="roomDesc"
                               required
                               style="height: 100px;"
                               placeholder="Room Description"
                               required
                               
                             >
                              <%=rs.getString("description")  %>
                            </textarea>
                        </div>
                        <div class="form-group">
                        <h4 class="text-dark lead">Price<span class="text-danger">*</span></h4>
                        <input required 
                            class="form-control" 
                            type="number" name="price" 
                            id="price" 
                            value ="<%=rs.getString("price")  %>"
                            placeholder="price"
                        >
                    </div>
                        <div class="form-group">
                            <label class="lead">Date Free(yyyy-mm-dd)</label>
                            <input type="date" name="date_free" value="<%=rs.getString("date_free")  %>" id="date_free" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="lead">Time Free(h:m:s)</label>
                            <input type="time" name="time_free" value="<%=rs.getString("time_free")  %>" id="time_free" class="form-control" >
                        </div>

                         <div class="form-group">
                            <label class="lead">Image</label>
                            <input type="file" name="image" >
                        </div>
                        <input type="submit" name="updateBut" value="Update Room" class="btn btn-success pull-right" style="margin-bottom: 20px;">
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
