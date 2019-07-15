<%-- 
    Document   : dommydata
    Created on : Jul 1, 2019, 9:31:21 AM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="./search_item.jsp" method="post" >
                            <input class="form-control mr-0" name="q" type="text" placeholder="Search here...."/>
                        </form>
        String query = "SELECT * FROM  rooms WHERE name like '%"+ name +"%' OR category like '%"+ category +"%' OR date_free like '%"+ date_free +"%' OR time_free like '%"+ time_free +"%' ;";
    </body>
</html>
