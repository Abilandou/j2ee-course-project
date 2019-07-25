<%-- 
    Document   : index
    Created on : Apr 26, 2019, 4:43:45 AM
    Author     : godlove/christian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="AllIncludes.jsp" %>
    <%@include file="includes/header.jsp"  %>
    <%@page import="java.sql.*" %>
    
    <title>Home</title>
</head>
<body style="border: 0;">
<section>
  <img  class="img-fluid" src="images/home/hotel1.jpg" alt="image"
        style="
            opacity:1;
            background-color:black;
            margin-top:-120px;
            width:100%;
            height:500px;
        "
  >
  <div class="text-block"
       style="
          position: absolute;
          bottom: 300px;
          left: 20px;
          background-color: teal;
          padding: 20px;
          border-radius:8px;
          color:pink;
          opacity:0.5px, black;
         

        "
        >
    <h4 class="" >THE NEW ERA</h4>
      <a href="./rooms.jsp" ><p class="btn btn-danger">get started<i class="material-icons prefix">trending_flat</i></p></a>
  </div>
</section>
    
<section style="margin-bottom: 20px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h5 class="center-align orange-text text-darken-4" style="padding-bottom:10px; " >Our Services.</h5>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="images/home/reservation.jpeg" alt="" width="292px;" height="200px;" />
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Room Reservation<i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Room Reservation</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Room Reservation<i class="material-icons right">close</i></span>
                            <p>Room Reservation Room Reservation Room Reservation.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="images/home/booking.jpg" alt="" width="292px;" height="200px;" />
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Booking Services<i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Booking Services</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Ambulance Services<i class="material-icons right">close</i></span>
                            <p>Ambulance Services Ambulance Services Ambulance Services.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="images/home/restaurant.jpg" alt="" width="292px;" height="200px;" />
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Restaurant Services<i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Restaurant Services</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Restaurant Services<i class="material-icons right">close</i></span>
                            <p>Restaurant Services Restaurant Services Restaurant Services.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="images/home/sport.jpg" alt="" width="292px;" height="200px;" />
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Sport Services<i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Sport Services</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Sport Services<i class="material-icons right">close</i></span>
                            <p>Sports Sports Sports Sports Sports.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="images/home/swimming.png" alt="" width="292px;" height="200px;" />
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Swimming Services<i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Swimming Services</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Swimming Services<i class="material-icons right">close</i></span>
                            <p>Swimming Pool Swimming Pool Swimming Pool.</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                     <div class="card">
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator" src="images/home/luggage.jpg" alt="" width="292px;" height="200px;" />
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Logging Facility<i class="material-icons right">more_vert</i></span>
                            <p><a href="#">Logging Facility</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">Logging Facility<i class="material-icons right">close</i></span>
                            <p>Logging Facility Logging Facility Logging Facility.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    
<section style="margin-bottom: 200px;">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h5 class="center-align orange-text text-darken-4" style="padding-bottom:10px; " >Events And Celebrations.</h5>
                <div class="col-sm-6">
                       <p>
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                           Room Reservation Room Reservation Room Reservation
                       </p>
                </div>
                <div class="col-sm-6">
                    <img class="activator" src="images/home/celebration.jpg" alt="" width="610px;" height="350px;" />
                </div>
            </div>
        </div>
    </div>
</section>

    
    <%@include file="includes/footer.jsp"  %>
</body>
        

</html>
