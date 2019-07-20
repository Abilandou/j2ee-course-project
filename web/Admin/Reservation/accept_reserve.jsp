<%-- 
    Document   : handleViewCustomers
    Created on : May 3, 2019, 6:53:35 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<head></head>
        <%   
           String str = request.getParameter("uid");

            try{
             

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            Statement stat = con.createStatement();
            String query = "SELECT * FROM reserve WHERE id='"+str+"'";
            ResultSet rs = stat.executeQuery(query);
            if(rs.next()){
                 try{
               
                        int room_id = Integer.parseInt(rs.getString("room_id"));
                        Class.forName("com.mysql.jdbc.Driver");

            //            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                        Statement statt = con.createStatement();
                        String querry = "UPDATE rooms SET booked='"+1+"' WHERE id='"+room_id+"'";
                        int i = statt.executeUpdate(querry);

                        if(i == 1){
                            try{
               
                                int customer_id = Integer.parseInt(rs.getString("customer_id"));
                                Class.forName("com.mysql.jdbc.Driver");

                    //            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                Statement strt = con.createStatement();
                                String querrty = "UPDATE customers SET has_room='"+1+"' WHERE id='"+customer_id+"'";
                                int j = strt.executeUpdate(querrty);

                                if(j == 1){
                                   response.sendRedirect("./../view_reserved.jsp");
                    //               out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                                }
                                else{
                         //        out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                                }
                            }catch (ClassNotFoundException e){
                                e.printStackTrace();
                            }
                        }
                        else{
                 //        out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
                        }
                    }catch (ClassNotFoundException e){
                        e.printStackTrace();
                    }
                    
                 
                 
                    
            }
            
            else{
     //        out.println("<h4 class='text-danger'>Sorry, Update not successfull</h4>");
            }
            }catch (ClassNotFoundException e){
                e.printStackTrace();
            }

          

        %>
        
        