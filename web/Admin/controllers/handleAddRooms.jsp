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
            
            if(request.getParameter("addRoomBut") != null){
                String name, status,category,image, description;
                
                name=request.getParameter("name");
                category=request.getParameter("category");
                description =request.getParameter("description");
                image=request.getParameter("image");
                status = request.getParameter("status");
               
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into rooms( name,category, description, image, status) values(?, ?);");
                
                preparestmnt.setString(1, name);
                preparestmnt.setString(2, category);
                preparestmnt.setString(3, description);
                preparestmnt.setString(4, image);
                preparestmnt.setString(5, status);
                preparestmnt.executeUpdate(); //execute query
                
                request.setAttribute("successMsg", "category successfully added");
                response.sendRedirect("./../view_rooms.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
        %>
        