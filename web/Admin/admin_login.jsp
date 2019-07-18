<%-- 
    Document   : admin_login
    Created on : May 2, 2019, 6:17:18 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="bootstrap/css/matcss/materialize.min.css">
    <link rel="stylesheet" href="bootstrap/css/matcss/materialize.css">
    <script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="bootstrap/js/matjs/materialize.js"></script>
    <script type="text/javascript" src="bootstrap/js/matjs/dataTable.js"></script>

     <script type="text/javascript" src="bootstrap/js/matjs/materialize.min.js"></script>
    <script type="text/javascript" src="main.js"></script>
    <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="https://maxcdn.bootstrap.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    <!--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <script src="bootstrap/js/jquery-3.3.1.js" ></script>
    <link rel="stylesheet" href="includes/admin_main.css" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="includes/admin_main.js"></script>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
      <!--Import materialize.css-->
     

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
        <title>CEF502 Hotel Admin Login</title>
    </head>
<body style="background-color: #07575B;">
    <div class="container"> 
        <div class="col-sm-3 col-mm-3 col-xm-3 col-lg-3"></div>
        
        
        <div class="col-sm-6 z-depth-4 card hoverable " id="logindiv" style="background-color: white; margin-top: 150px; border-radius: 18px; height: 250px;">
            <form id="loginform" class="form-vertical" action="./dashboard.jsp" method="post">
                <div class="control-group text-danger"> <h4>CEF502 Hotel Admin Login</h4></div>
                <div class="form-group">
                    <i class="fa fa-user fa-lg"> </i><input class="form-control" required="" type="text" name="name" placeholder="name" />
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i><input type="password" name="password" required="" class="form-control" placeholder="Password" />
                </div>
                <div class="form-actions">
                   <input type="submit" name="adminLoginBut" id="adminLoginBut" value="Login" class="lead "
                    style="
                       background-color: hotpink;
                       border-radius: 12px;
                       border-color: orange;
                       border-width: 2px;
                       width: 100px;
                    "
                  />
                    <p class="pull-right">Forgot password <a href="#"><b class="text-primary" id="forgetWord">Reset Here</b></a></p>
                  
                </div>
            </form>
        </div>
        <div class="col-sm-6 z-depth-4 card hoverable " id="passforget" style="background-color: white; margin-top: 150px; border-radius: 18px; height: 150px;">
            <form id="loginform" class="form-vertical" action="admin_login.jsp">
                <div class="control-group text-primary"> <h5>Enter email address to receive a new password</h5></div>
                <div class="form-group">
                    <i class="fa fa-user fa-lg"> </i><input class="form-control" required="" type="email" placeholder="Email" />
                </div>
                
                <div class="form-actions">
                    <input type="submit" name="login" id="adminLoginBut" value="Reset" class=" pull-right lead "
                    style="
                       background-color: hotpink;
                       border-radius: 12px;
                       border-color: orange;
                       border-width: 2px;
                       width: 100px;
                    "
                  />
                    <a href="#"><p class="text-primary lead" id="back" >Back To Login</p></a>
            </form>
        </div>
        <div class="col-sm-3 col-mD-3 col-xm-3 col-lg-3"></div>
    </div>
    
    <script>
        $(document).ready(function(){
            $("#passforget").hide();
            $("#forgetWord").click(function(){
                $("#logindiv").hide();
                $("#passforget").show();
            });
            $("#back").click(function(){
                $("#passforget").hide();
                $("#logindiv").show();
            });
        });
    </script>
    
</body>
</html>
