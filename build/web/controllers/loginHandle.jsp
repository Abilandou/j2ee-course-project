<%-- 
    Document   : registerHandle
    Created on : Apr 26, 2019, 9:02:47 PM
    Author     : godlove
--%>

<%@page import="java.sql.*" %>

        <% 
            if(session.getAttribute("loginBut") != null){
                response.sendRedirect("../index.jsp");
            }

        %>
        <%
            
            if("POST".equalsIgnoreCase(request.getMethod())){
                if(request.getParameter("loginBut") != null){
                    //if(request.getParameter("login").equals("Login")){
                        String email = request.getParameter("email");
                        String password = request.getParameter("password");
                        
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                        String query;
                
            
            
                        try{

                            Class.forName("com.mysql.jdbc.Driver");


                        }catch(Exception e){
                            System.out.println(e);
                        }
                        
                        try{
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                            //Get data from database and compare it with the user input data from login form
                            query = "SELECT * FROM customers WHERE email=? AND password=?";
                            ps = con.prepareStatement(query);
                            ps.setString(1, "email");
                            ps.setString(2, "password");
                            
                            rs = ps.executeQuery();
                            
                            
//                            if(rs.next()){
                                //User Login Successfull
                                //Creating User Session
                                session = request.getSession();
                                session.setAttribute("email", email);
                                response.sendRedirect("../account.jsp"); //Redirect user to their account after successful login
                                
                               
//                            }
                                con.close();
                            
                        }
                        catch(SQLException e){
                            System.out.println(e);
                        
                        }
                   // }
                }
            }
        %>
        