<%-- 
    Document   : dashboard.jsp
    Created on : May 2, 2019, 5:42:59 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CEF502 Hotel Admin</title>
        
    </head>
    <body style="
            margin: auto;
           
        " 
    >
   

        
    <!--Header-part-->
<div id="header">

</div>
<!--close-Header-part--> 
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
      



<!--top-Header-menu-->
<div>
  <%@include file="./includes/admin_header.jsp" %>
</div>

 <div class="container">
    <div class="row">
      <div class="col s12">
        <h3 class="flow-text"><i class="material-icons"></i> Dashboard</h3>
        <div class="divider"></div>
      </div>
      <div class="section">
        <a href="./view_categories.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Categories<span class="new badge orange white-text">2</span></h4>
              </div>
            </div>
          </div>
        </a>

        <a href="./view_rooms.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Rooms<span class="new badge orange white-text">2</span></h4>
              </div>
            </div>
          </div>
        </a>
        <a href="./view_customers.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Customers<span class="new badge orange white-text">3</span></h4>
              </div>
            </div>
          </div>
        </a>
        <a href="./Employees.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Employees<span class="new badge  orange white-text">5</span></h4>
              </div>
            </div>
          </div>
        </a>
        <a href="./contactus.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Contacts<span class="new badge  orange white-text">10</span></h4>
              </div>
            </div>
          </div>
        </a>
        <a href="./view_reserved.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Reservations<span class="new badge  orange white-text">10</span></h4>
              </div>
            </div>
          </div>
        </a>
        <a href="./requests.jsp">
          <div class="col m4 s6">
            <div class="card hoverable teal lighten-3 white-text">
              <div class="card-content">
                <p class="center"><i class="large material-icons"></i></p>
                <h4 class="center-align flow-text">Reservation Requests<span class="new badge  orange white-text">3</span></h4>
              </div>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
<!--Footer-part-->


  <%@include file="./includes/admin_footer.jsp" %>


<!--end-Footer-part-->

    </body>
</html>
