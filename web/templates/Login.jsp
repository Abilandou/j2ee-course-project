<%-- 
    Document   : Login
    Created on : Apr 8, 2019, 10:27:34 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/bootstrap/css/MainFrontEnd.css" />
        <%@include file="./../includes/header.jsp" %>
        <title>User Register/Login</title>
    </head>
    <body>
        <section class="align-content-center" > <%-- Login Section--%>
            <div class="container pull-center" id="LoginSection">
                <div class="row card">
                    <div class="col-sm-3 col-md-3 col-xm-3 col-xl-3"></div>
                    <div class="col-sm-6 col-md-6 col-xm-6 col-xl-6">
                        <div class="card-title">
                            <p>Login</p>
                        </div>
                        <div class="card-body">
                            <form class="UserLoginForm" name="loginForm" action="#" method="post">
                                <div class="form-group">
                                    <label class="label">Email</label>
                                    <input type="email" 
                                        name="user_email" 
                                        id="user_email" 

                                        class="form-control"
                                        placeholder="Enter Your Email"
                                    >
                                </div>
                                <div class="form-group">
                                    <label class="label">PassWord</label>
                                    <input type="password"
                                        name="user_password"
                                        id="user_password"
                                        class="form-control"

                                        placeholder="Enter Your Password"
                                    >
                                </div>
                                <div class="form-group">
                                    <input type="submit" 
                                        value="Login" 
                                        class="btn btn-default"
                                        id="UserLoginButton"
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
        
         <section class="align-content-center" > <%-- Register Section--%>
            <div class="container pull-center" id="RegisterSection" >
                <div class="row card">
                    <div class="col-sm-3 col-md-3 col-xm-3 col-xl-3"></div>
                    <div class="col-sm-6 col-md-6 col-xm-6 col-xl-6">
                        <div class="card-title">
                            <p>Register</p>
                        </div>
                        <div class="card-body">
                             <form action="controller" id="UserRegisterForm" method="post">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input type="text" class="form-control" name="first_name" required id="first_name" class="first_name" />
                                </div>
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input type="text" class="form-control" name="last_name" required id="last_name" class="last_name" />
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="address" required id="address" class="address" />
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" class="form-control" name="email" required id="email" class="email" />
                                </div>
                                <div class="form-group">
                                    <label>Date</label>
                                    <input type="date" class="form-control" name="date" required id="date" class="date" />
                                </div>
                                <div class="form-group">
                                    <label>PassWord</label>
                                    <input type="password" class="form-control" name="password" required id="password" class="password" />
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-success btn-lg" value="Register" />
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
    </body>
</html>
<%@include file="./../includes/footer.jsp" %>