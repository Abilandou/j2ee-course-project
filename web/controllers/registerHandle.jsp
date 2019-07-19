<%-- 
    Document   : registerHandle
    Created on : Apr 26, 2019, 9:02:47 PM
    Author     : godlove
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Random" %>


        <%
            try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("registerBut") != null){
                String first_name, last_name, email, state, address, country, city, phone,password;
                
                first_name=request.getParameter("first_name");
                last_name=request.getParameter("last_name");
                email=request.getParameter("email");
                state=request.getParameter("state");
                address=request.getParameter("address");
                country=request.getParameter("country");
                city=request.getParameter("city");
                phone=request.getParameter("phone");
                password=request.getParameter("password");
                
                PreparedStatement preparestmnt = null; //Create statement
                
                preparestmnt = con.prepareStatement("insert into customers("
                        + "first_name, last_name, email, state, address,"
                        + "country, city, phone, password) values(?, ?, ?, ?, ?, ?, ?, ?, ?);");
                
                preparestmnt.setString(1, first_name);
                preparestmnt.setString(2, last_name);
                preparestmnt.setString(3, email);
                preparestmnt.setString(4, state);
                preparestmnt.setString(5, address);
                preparestmnt.setString(6, country);
                preparestmnt.setString(7, city);
                preparestmnt.setString(8, phone);
                preparestmnt.setString(9, password);
                
                preparestmnt.executeUpdate(); //execute query
                
                request.setAttribute("successMsg", "SUccessfully registered");
                response.sendRedirect("../Login.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
        %>
        