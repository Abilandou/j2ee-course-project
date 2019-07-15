<%-- 
    Document   : header
    Created on : Apr 7, 2019, 4:16:20 AM
    Author     : godlove
--%>
<%@page import="java.sql.*" %>
<div class="navbar-fixed ">
    <nav class="navbar navbar-expand-md teal darken-4  shadow-sm menu" data-target="menu">
        <div class="container-fluid">
            <a href="index.jsp" class="brand-logo ">CEF502 Hotel</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Right Side Of Navbar -->
                <div class="shop-menu pull-right">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp"><i class="fa fa-home"></i> Home</a></li>
                        <li><a href="rooms.jsp"><i class="fa fa-list"></i>Rooms</a></li>
                        <li><a href="about.jsp"><i class="fa fa-history"></i> About</a></li>
                        <li><a href="contact.jsp"><i class="fa fa-envelope-open"></i>Contact Us</a> </li>
                        <div class="pull-right"> 
                            <form action="./search_item.jsp" method="post" >
                                <p style="margin-left:180px;"> <input type="submit" class="btn btn-xs pink" title="Confirm Search" value="Search" style="height: 37px;" ></p>
                                <select name="q" required="" class="form-control" style="margin-right: -50px; width: 180px; margin-top: -58px; height:37px;">
                                    <option value="">Search by category</option>
                                    <% 
                                        try{

                                            String str = request.getParameter("category");

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


                            </form>
                        </div>
                        <%
                            if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
                        %>
                            <li><a href="Login.jsp"><i class="fa fa-lock"></i> Login</a></li>
                        <%} else {
                        %>
                            <li><a href="account.jsp"><i class="fa fa-user"></i>Account</a></li>
                            <li><a href="./logout.jsp"><i class="fa fa-arrow-right"></i> Logout</a></li>
                        <%
                            }
                        %>

                    </ul>
                </div>
            </div>
        </div>
    </nav>
</div>
                    






