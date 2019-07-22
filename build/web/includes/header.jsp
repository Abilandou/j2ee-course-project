<%-- 
    Document   : header
    Created on : Apr 7, 2019, 4:16:20 AM
    Author     : godlove
--%>
<%@page import="java.sql.*" %>

<div class="navbar-fixed ">
  <nav class="indigo lighten-1" >
    <div class="nav-wrapper">
        <a class="navbar-brand" href="index.jsp"><b class="orange-text text-darken-4">CEF502</b></a>
        <div  style="margin-left: 300px;">
            <ul>
                <li  style="margin-top: -20px;">(+237) 672-722-945 / 677-443-398<i class="fa fa-phone"></i></li>
                 <li style="margin-top: -20px; margin-left: 20px;">infocef502hotel@gmail.com<i class="fa fa-envelope-open"></i></li>
            </ul> 
        </div>
      <ul class="right hide-on-med-and-down">
          <li class="black-text">
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
          </li>
      </ul>
    </div>
  </nav>
</div>
<div class="navbar-fixed ">
  <nav class=" indigo lighten-1" style="text-align:center;">
    <div class="nav-wrapper" style="padding-left:200px; padding-right:60px;" >
      <ul class=" hide-on-med-and-down">
         <li class="nav-item ">
        <a href="index.jsp">Home<i class="fa fa-home"></i></a>
      </li>
      <li class=" nav-item ">
        <a href="rooms.jsp">Rooms<i class="fa fa-list"></i></a>
      </li>
      <li class=" nav-item ">
        <a href="about.jsp">About<i class="fa fa-gg-circle"></i></a>
      </li>
      <li class="nav-item ">
        <a href="contact.jsp">Contact<i class="fa fa-envelope-open"></i></a>
      </li>
      <%
          if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
        %>
            <li class=" nav-item right">
        <a  href="Login.jsp">Login<i class="fa fa-lock"></i></a>
      </li>
        <%} else {
        %>
      <li class=" nav-item right ">
        <a class=" black-text " href="account.jsp">
            <%
                if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
            %>
            <%} else {
            %>
                <b class="orange-text text-darken-4"><%=session.getAttribute("email")%></b><i class="fa fa-user"></i> 
            <%
                }
            %>
        </a>
      </li>  
      <li class=" nav-item right">
        <a class="nav-link" href="./logout.jsp">Logout<i class="fa fa-arrow-right"></i></a>
      </li>
        <%
            }
        %>
      </ul>
    </div>
  </nav>
</div>

  