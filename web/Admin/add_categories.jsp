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
        <title>Admin | Add_Category</title>

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
                
               
            
             <%
            try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("addCategoryBut") != null){
                String name, description;
                
                name=request.getParameter("name");
                description =request.getParameter("description");
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into categories( name, description) values(?, ?);");
                
                preparestmnt.setString(1, name);
                preparestmnt.setString(2, description);
                preparestmnt.executeUpdate(); //execute query
                
                request.setAttribute("successMsg", "category successfully added");
                response.sendRedirect("./view_categories.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
        %>
        
                <form action="add_categories.jsp" method="post" id="addCategory_form">
                    <div class="form-group">
                        <h4 class="text-dark lead">Name<span class="text-danger">*</span></h4>
                        <input required 
                            class="form-control" 
                            type="text" name="name" 
                            id="category_name" 
                            class="category_name"
                            placeholder="category name"
                        >
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
                            
                        ></textarea>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="addCategoryBut" value="Add Category" class="btn pull-right">
                    </div>
                    
                </form>
                
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</div>       
<div>
  <%@include file="./includes/admin_footer.jsp" %>
</div>

</body>

</html>
