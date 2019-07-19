<%-- 
    Document   : Login
    Created on : Apr 8, 2019, 10:27:34 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <head>
        <%@include file="AllIncludes.jsp" %>
        <%@include file="includes/header.jsp" %>
        <%@page import="java.util.Random" %>
        <%@page import="java.sql.*"%>
        <title>User Login</title>
    </head>
    <body>
        <%
            if(request.getAttribute("loginBut") != null){
            
                String email = request.getParameter("email");
                  
                String password = request.getParameter("password");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502",
                        "godlove", "godlove");
                Statement st = con.createStatement();
                ResultSet rs;
                ResultSet rs2;
                rs = st.executeQuery("select * from customers where  email='" + email + "' and password='" + password + "'");
                if (rs.next()) {
                    
                    session.setAttribute("email", email);
                    //out.println("welcome " + userid);
                    //out.println("<a href='logout.jsp'>Log out</a>");
                    response.sendRedirect("account.jsp");
                } else {
                    out.println("Invalid password <a href='index.jsp'>try again</a>");
                }
            }
 
//        Random random = new Random();
//            char c = (char) (random.nextInt(26) + 'a');
////            String theChar = Character.toString(c); 
//            String theChar = "ru4r4yehdw4WRWA4SDHDH4Ssdher4h4e4h4d4f4"; 
//            session.setAttribute("custsession", theChar);
//            String custsession = (String)session.getAttribute("custsession");//Retrieve value of session and getAttribute return session objecso we need to convert it to string
////            String custsession = theChar;
        %>
        <section class="align-content-center " > <%-- Login Section--%>
            <div class="container pull-center" id="LoginSection">
                <div class="row card hoverable z-depth-5">
                    
                    <div class="col-sm-3 col-md-3 col-xm-3 col-xl-3"></div>
                    <div class="col-sm-6 col-md-6 col-xm-6 col-xl-6">
                        <div class="card-title">
                            <p class="lead text-capitalize text-primary"> User Login</p>
                        </div>
                        <div class="card-body mx-5">
                            <form class="UserLoginForm" name="loginForm" action="./controllers/loginHandle.jsp" method="post">
                                <div class="form-group mb-3">
                                    <label class="text-dark">Email</label>
                                    <input type="email" 
                                        name="email" 
                                        id="user_email" 
                                        class="form-control"
                                        placeholder="email"
                                        required
                                    >
                                </div>
                                <div class="form-group mt-5">
                                    <label class="text-dark">PassWord</label>
                                    <input type="password"
                                        name="password"
                                        id="user_password"
                                        class="form-control"
                                        placeholder="password"
                                        required
                                    >
                                </div>
                                <div class="form-group">
                                    <input type="submit" 
                                        value="Login" 
                                        class="btn btn-primary"
                                        id="UserLoginButton"
                                        name="loginBut"
                                    >
                                </div>
                            </form>
                        </div>
                        <div class="header-bottom">
                            <p>Do Not Have An Account Yet?<a id="NoAccountInfo" href="#"> Register </a></p>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-xm-3 col-xl-3"></div>
                </div>
            </div>
        </section><%-- End Login Section--%>
       <section class="align-content-center" > <%-- Register Section --%>
            <div class="container pull-center" id="RegisterSection" >
                <div class="row card hoverable z-depth-5">
                    <div class="col-sm-3 col-md-3 col-xm-3 col-xl-3"></div>
                    <div class="col-sm-6 col-md-6 col-xm-6 col-xl-6">
                        <div class="card-title">
                            
                        </div>
                        <div class="card-body">
                            <p class="lead text-capitalize text-primary ">New User Register</p>
                             <form action="./controllers/registerHandle.jsp" id="UserRegisterForm" class="mx-5" method="post">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input type="text" class="form-control first_name" name="first_name" required id="first_name"/>
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input type="text" class="form-control last_name" name="last_name" required id="last_name" />
                                </div>
                                 <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control email" name="email" required id="email" />
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" class="form-control address" name="address" required id="address"  />
                                </div>
                                 <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" class="form-control phone" name="phone" required id="phone"  />
                                </div>
                                 <div class="form-group">
                                    <label>City</label>
                                    <input type="text" class="form-control city" name="city" required id="city"  />
                                 </div>
                                 <div class="form-group">
                                    <label>State</label>
                                    <input type="text" class="form-control state" name="state" required id="state"  />
                                </div>
                                 <div class="form-group">
                                    <label>Country</label>
                                    <select name="name" class="browser-default">
                                        <option value="">Select country</option>
                                        <% 
                                            try{

                                               Class.forName("com.mysql.jdbc.Driver");
                                               Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
                                               Statement stm = conn.createStatement();
                                               String sql = "SELECT * FROM countries";

                                               ResultSet rst = stm.executeQuery(sql);

                                               while(rst.next()){
                                                   %>
                                                   <option value="<%=rst.getString("country_name")  %>"><%=rst.getString("country_name")  %></option>
                                                   <%
                                               }

                                               }catch(Exception e){
                                                   out.println(e);
                                               }
                                         %>
                                    </select>
                                    
                                </div>
                                <div class="form-group">
                                    <label>PassWord</label>
                                    <input type="password" class="form-control password" name="password" required id="password"  />
                                </div>
<!--                                 <div class="form-group">
                                   
                                     <input type="hidden" value="" name="custsession"   />
                                </div>-->
                                <div class="form-group">
                                    <input type="submit" name="registerBut" class="btn btn-success btn-lg" value="Register" />
                                </div>
                            </form>
                        </div>
                        <div class="header-bottom">
                            <p>Have An Account Already?<a id="HaveAccountInfo" href="#"> Login </a></p>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-xm-3 col-xl-3"></div>
                </div>
            </div>
       </section>
       <%@include file="includes/footer.jsp" %>
    </body>   
</html>
