<%-- 
    Document   : register
    Created on : Apr 26, 2019, 5:21:46 AM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="AllIncludes.jsp" %>
        <%@include file="./../includes/header.jsp" %>
        <%@include file="controllers/registerHandle.jsp" %>
        <title>user register</title>
    </head>
<body>
    
    <p class="text-success">
    <% 
        if(request.getAttribute("successM") != null){
            out.println(request.getAttribute("SuccessMsg"));
        }
    
    %>
    </p>
    
    
    <section class="align-content-center" > <%-- Register Section--%>
        <div class="container pull-center mx-5" id="RegisterSection" >
            <div class="row card">
                   
                <div class="col-sm-6 col-md-6 col-xm-6 col-xl-6">
                    <div class="card-title">
                        <p>Register</p>
                    </div>
                    <div class="card-body">
                         <form class="form-register" id="UserRegisterForm" method="post">
                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text" class="form-control" name="first_name" required id="first_name" class="first_name" />
                            </div>
                            <div class="form-group">
                                <label>Last Name</label>
                                <input type="text" class="form-control" name="last_name" required id="last_name" class="last_name" />
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" name="email" required id="email" class="email" />
                            </div>
                             <div class="form-group">
                                <label>City</label>
                                <input type="text" class="form-control" name="city" required id="city" class="city" />
                            </div>
                             <div class="form-group">
                                <label>State</label>
                                <input type="text" class="form-control" name="state" required id="state" class="state" />
                            </div>
                             <div class="form-group">
                                <label>Country</label>
                                <input type="text" class="form-control" name="country" required id="country" class="country" />
                            </div>
                             <div class="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" name="address" required id="address" class="address" />
                            </div>
                             <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" name="phone" required id="phone" class="phone" />
                            </div>
                            <div class="form-group">
                                <label>PassWord</label>
                                <input type="password" class="form-control" name="password" required id="password" class="password" />
                            </div>
                            <div class="form-group">
                                <input type="submit" onclick="myfunction();" class="btn btn-success btn-lg" id="registerBut" value="Register" />
                            </div>
                        </form>
                    </div>
                    <div class="header-bottom">
                        <p>Have An Account Already?<a id="HaveAccountInfo" href="Login.jsp"> Login </a></p>
                    </div>
                </div>
               
                </div>
            </div>
    </section>
    
<%@include file="./../includes/footer.jsp" %>        
</body>
</html>
