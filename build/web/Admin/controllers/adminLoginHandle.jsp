<%-- 
    Document   : adminLoginHandle
    Created on : May 3, 2019, 5:27:44 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
    <%
//    
//        //Check if this session already exists
//        session = request.getSession(false);
//        if(session.getAttribute("email") !=null)
//        {
//            Connection conn = null;
//            ResultSet rs;
//            PreparedStatement ps = null;
//            
//            try{
//                Class.forName("com.mysql.jdbc.Driver");
//            }catch (ClassNotFoundException e){
//                e.printStackTrace();
//            }
//            
//            try{
//                        
//                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
//                String sql = "SELECT * FROM admin WHERE email=?, status='"+1+"'";
//                ps = conn.prepareStatement(sql);
//                ps.setString(1, session.getAttribute("email").toString());
//                rs = ps.executeQuery();
//
//                if(rs.next()){
//                    
//                }else{
//
//                }
//
//
//            }catch(Exception e){
//                e.printStackTrace();
//            }  
//
//        }
//        

    
        if("POST".equalsIgnoreCase(request.getMethod()))
        {
            if(request.getParameter("login") != null){
//                if(request.getParameter("login").equals("Login")){
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    
                    Connection conn = null;
//                    Statement statement = null;
                    ResultSet rs;
                    PreparedStatement ps = null;
                    
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                    }catch (ClassNotFoundException e){
                        e.printStackTrace();
                    }
                    try{
                        
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                        String sql = "SELECT * FROM admin WHERE email=?, password=?  status='"+1+"'";
                        ps = conn.prepareStatement(sql);
                        ps.setString(1, email);
                        ps.setString(2, password);
                        rs = ps.executeQuery();
                        
                        if(rs.next()){
                            //Login Successful
                            session = request.getSession();
                            session.setAttribute("email", email);
                            response.sendRedirect("../dashboard.jsp");
                            
                        }else{
                        
                        }
                        

                    }catch(Exception e){
                        e.printStackTrace();
                    }  
                    
//                }
            }
        }
    
    
    %>
    
  
     <% //  response.sendRedirect("../dashboard.jsp"); %>

       
