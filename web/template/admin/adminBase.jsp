<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OBBMS - Save The Lifes</title>

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--Bootstrap cdn-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .asider{
                position: absolute;
                top: 7%;
                height: 93vh;
                width: 200px;
                background-color: #4d4747;
            }
            .asider ul li a{
                text-decoration: none;
                color:white;
            }
        </style>
    </head>
    <body>
        <nav style="background-color: #FF0018;" class="navbar navbar-expand-md navbar-dark fixed-top">
            <div class="container-fluid d-flex justify-content-evenly">
                <!-- Title -->
                <div class="navbar-brand fs-3 me-auto"><i class="fas fa-heartbeat fa-spin"></i>&nbsp; Online Blood Bank Management System &nbsp;<i class="fas fa-heartbeat fa-spin"></i></div>
                <!-- Navbar Links -->
                <ul class="navbar-nav">
                    <li class="nav-item ms-5">
                        <a class="nav-link fs-5 me-5" href="../../adminLogin.jsp"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="asider">
            <ul class="list-group list-unstyled">
                <li class="px-3 pt-5 fs-5"><a href="/"><i class="fas fa-home"></i>&nbsp;Home</a></li>
                <li class="px-3 pt-5 fs-5"><a href="/admin-donor"><i class="fas fa-user"></i>&nbsp;Donor</a></li>
                <li class="px-3 pt-5 fs-5"><a href="/admin-patient"><i class="fas fa-user-injured"></i>&nbsp;Patient</a></li>
                <li class="px-3 pt-5 fs-5"><a href="/admin-donation"><i class="fas fa-hand-holding-medical"></i>&nbsp;Donations</a></li>
                <li class="px-3 pt-5 fs-5"><a href="/admin-request"><i class="fas fa-sync-alt"></i>&nbsp;Blood Requests</a></li>
                <li class="px-3 pt-5 fs-5"><a href="/admin-request-history"><i class="fas fa-history"></i>&nbsp;Request History</a></li>
                <li class="px-3 pt-5 fs-5"><a href="/admin-blood"><i class="fas fa-hand-holding-water"></i>&nbsp;Blood Stock</a></li>
            </ul> 
        </div>
        <%@include file="adminDashboard.jsp" %>

    </body>
</html>
