<%-- 
    Document   : header
    Created on : Apr 7, 2019, 4:16:20 AM
    Author     : godlove
--%>


<!-- > -->
<nav class="navbar navbar-expand-md z-depth-4 teal darken-4  shadow-sm">
    <div class="container">
        <a href="./dashboard.jsp" class="brand-logo center">
            <i class="material-icons">house</i><b class="orange-text text-darken-4" style="font-size: 30px;">ABK</b>
        </a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- Right Side Of Navbar -->
            <ul  class="right"<>
                <li class="nav-item">
                        <a class="nav-link mx-3" href="./../index.jsp">View Site</a>
                </li>
                <!-- Authentication Links -->
                    <li class="nav-item">
                        <a class="nav-link mx-3" href="./admin_login.jsp">Logout</a>
                    </li>
                
            </ul>
        </div>
    </div>
</nav>
<script>
    $(document).ready(function() {
    $('select').material_select();
});
</script>




