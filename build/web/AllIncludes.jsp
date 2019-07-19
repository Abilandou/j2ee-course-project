<%-- 
    Document   : AllIncludes
    Created on : Apr 8, 2019, 10:15:43 PM
    Author     : godlove
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
        <script src="bootstrap/js/jquery-3.3.1.js" ></script>
        <link rel="stylesheet" href="includes/main.css" />
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="includes/main.js"></script>
        <script src="Remote Files/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
        
        
        <link rel="stylesheet" href="bootstrap/css/matcss/materialize.min.css">
        <link rel="stylesheet" href="bootstrap/css/matcss/materialize.css">
        <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $("#family").hide();
                $("#friend").show();
                $(".familyword").click(function(){
                    $("#family").show();
                    $("#friend").hide();
                });
                $(".friendword").click(function(){
                    $("#friend").show();
                    $("#family").hide();
                });

             });
            
        </script>

    </head>
</html>
