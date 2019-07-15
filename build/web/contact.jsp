<%-- 
    Document   : contact
    Created on : Apr 26, 2019, 5:52:11 AM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/header.jsp"  %>
         <%@include file="AllIncludes.jsp" %> 
         <%@page import="java.sql.*" %>
        <title>contact</title>
    </head>
 <body>
    
    <div id="contact-page" class="container">
    	<div class="bg">
	    <div class="row">    		
                <div class="col-sm-12">    			   			
                    <h4 class=" lead text-capitalize pull-left text-primary">Get In Touch </h4>    			    				    				
                    <div id="gmap" class="contact-map">
                    </div>
                </div>			 		
            </div>    	
            <div class="row">  	
                <div class="col-sm-8 z-depth-5 hoverable">
                    <div class="contact-form">
                        <h5 class="title text-center">Get In Touch</h5>
                        <div class="status alert alert-success" style="display: none"></div>
                         
                        <%
                           try{

                           Class.forName("com.mysql.jdbc.Driver");

                           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");

                           if(request.getParameter("contactBut") != null){
                               String name, email, subject, message;

                               name=request.getParameter("name");
                               email =request.getParameter("email");
                               subject =request.getParameter("subject");
                               message =request.getParameter("message");


                               PreparedStatement preparestmnt = null; //Create statement

                               preparestmnt = con.prepareStatement("insert into contacts( name, email, subject, message) values(?, ?, ?, ?);");

                               preparestmnt.setString(1, name);
                               preparestmnt.setString(2, email);
                               preparestmnt.setString(3, subject);
                               preparestmnt.setString(4, message);
                               preparestmnt.executeUpdate(); //execute query

                               request.setAttribute("successMsg", "Thanks For Contacting Us");
                               response.sendRedirect("./thankscontact.jsp");

                               con.close();
                           }
                           }catch(Exception e){
                               out.println(e);
                           }
                        %>
                        <form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
                            <div class="form-group col-md-6">
                                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                            </div>
                            <div class="form-group col-md-6">
                                 <%
                                    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
                                %>
                                    <input type="email" name="email" class="form-control" required="required" placeholder="Email">
                                <%} else {
                                %>
                                <input type="email" name="email" class="form-control" value="<%=session.getAttribute("email")%>" required="required" placeholder="Email">
                                <%
                                    }
                                %>
                                
                            </div>
                            <div class="form-group col-md-12">
                                <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
                            </div>
                            <div class="form-group col-md-12">
                                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                            </div>                        
                            <div class="form-group col-md-12">
                                <input type="submit" name="contactBut" class="btn btn-primary pull-right" value="Submit">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="contact-info">
                        <h4 class="title text-center lead text-primary">Contact Info</h4>
                        <address>
                            <p>CEF502 Hotel Int.</p>
                            <p>Molyko Buea, University of Buea</p>
                            <p>SouthWest Region Cameroon</p>
                            <p><i class="fa fa-phone"></i> (+237) 672-722-945 / 677-443-398</p>
                            <p><i class="fa fa-envelope"></i> info@cef502.com</p>
                        </address>
                        <div class="social-networks">
                            <h4 class="title text-center lead text-primary">Social Networking</h4>
                             <div class="social-icons ml-5">
                                <div class="col-sm-2">
                                    <a href="https://web.facebook.com/godluv.goddy" target="_blank"><i class="fa fa-facebook text-primary"></i></a>
                                </div>
                                <div class="col-sm-2">
                                    <a href="https://twitter.com/goddyco" target="_blank"><i class="fa fa-twitter text-info"></i> </a>
                                 </div>
                                <div class="col-sm-2">
                                    <a href="#" target="_blank"><i class="fa fa-google-plus text-danger"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    			
	    </div>  
    	</div>	
    </div><!--/#contact-page-->
     
     
    <%@include file="includes/footer.jsp"  %>
</body>
</html>
