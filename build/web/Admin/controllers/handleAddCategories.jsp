<%-- 
    Document   : registerHandle
    Created on : Apr 26, 2019, 9:02:47 PM
    Author     : godlove
--%>

<%@page import="java.sql.*" %>

        <% 
//            if(session.getAttribute("login")!=null){
//                response.sendRedirect("index.jsp");
//            }

        %>
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
                response.sendRedirect("./../view_categories.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
        %>
        