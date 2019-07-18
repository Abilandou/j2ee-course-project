<%-- 
    Document   : header
    Created on : Apr 7, 2019, 4:16:20 AM
    Author     : godlove
--%>
<%@page import="java.sql.*" %>

<div class="navbar-fixed ">
  <nav class="white" >
    <div class="nav-wrapper">
      <a class="navbar-brand" href="}"><img src="" alt="Norway"></a>
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
  <nav class=" white" style="text-align:center;">
    <div class="nav-wrapper" style="padding-left:200px; padding-right:60px;" >
      <ul class=" hide-on-med-and-down"  >
         <li class="nav-item ">
        <a class=" black-text nav-link" href="index.jsp"><i class="fa fa-home"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class=" nav-item ">
        <a class=" black-text nav-link" href="rooms.jsp"><i class="fa fa-list"></i>Rooms</a>
      </li>
      <li class=" nav-item ">
        <a class=" black-text nav-link" href="about.jsp"><i class="fa fa-gg-circle"></i>About</a>
      </li>
      <li class="nav-item ">
        <a class=" black-text nav-link" href="contact.jsp"><i class="fa fa-envelope-open"></i>Contact</a>
      </li>
      <%
          if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
        %>
            <li class=" nav-item right">
        <a class=" black-text nav-link" href="Login.jsp"><i class="fa fa-lock"></i>Login</a>
      </li>
        <%} else {
        %>
      <li class=" nav-item right ">
        <a class=" black-text nav-link" href="account.jsp">
            <%
                if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
            %>
            <%} else {
            %>
                <i class="fa fa-user"></i><b class="red-text text-capitalize"><%=session.getAttribute("email")%></b> 
            <%
                }
            %>
        </a>
      </li>  
      <li class=" nav-item right">
        <a class=" black-text nav-link" href="./logout.jsp"><i class="fa fa-arrow-right"></i>Logout</a>
      </li>
        <%
            }
        %>
      </ul>
    </div>
  </nav>
</div>