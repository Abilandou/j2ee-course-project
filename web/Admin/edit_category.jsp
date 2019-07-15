<%-- 
    Document   : add_categories.jsp
    Created on : May 3, 2019, 6:42:39 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin | Edit_Category</title>

        <!--close-Header-part--> 
        <%@include file="AllAdminIncludes.jsp"  %>
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
          String str2 = request.getParameter("description");
          String str6 = request.getParameter("hid");
          
       try{
           Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "UPDATE categories SET name='"+str1+"', description='"+str2+"' WHERE id='"+str6+"'";
           int i = stat.executeUpdate(query);
           if(i == 1){
               response.sendRedirect("./view_categories.jsp");
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
            String query = "SELECT * FROM categories WHERE id="+strl;
            ResultSet rs = stat.executeQuery(query);
            if(rs.next()){
                %>
            <div class="col-md-7 card hoverable">
                
                <form action="edit_category.jsp" method="post" id="addCategory_form">
                    <input type="hidden" name="hid" value="<%=rs.getString("id")  %>" >
                    <div class="form-group">
                        <h4 class="text-dark lead">Name<span class="text-danger">*</span></h4>
                        <input required 
                            class="form-control category_name" 
                            type="text" name="name" 
                            id="category_name" 
                            placeholder="category name"
                            value="<%=rs.getString("name")%>"
                        />
                    </div>
                    <div class="form-group">
                        <h4 class="text-dark lead">Description<span class="text-danger">*</span></h4>
                        <textarea
                            name="description"
                            id="category-description"
                            class="category_description"
                            style="height: 100px;"
                            required
                            placeholder="description"
                        ><%=rs.getString("description")%></textarea>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="editCategoryBut" value="Edit Category" class="btn pull-right" style="margin-bottom: 20px;">
                    </div>
                    
                </form>
                    <%
            }
            else{
                %>
                <%
                response.sendRedirect("./view_categories.jsp");
                %><h2 class="text-danger">Category NOt updated</h2><%
               
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
</div>

       
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
