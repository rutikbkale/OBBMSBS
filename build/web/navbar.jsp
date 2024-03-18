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
        <link href="static/css/style.css" rel="stylesheet">
    </head>
    <body>


        <nav style="background-color: #FF0018;" class="navbar navbar-expand-md navbar-dark fixed-top">
            <div class="container-fluid d-flex justify-content-evenly">
                <!-- Title -->
                <div class="navbar-brand fs-3 me-auto"><i class="fas fa-heartbeat"></i>&nbsp; Online Blood Bank Management System &nbsp;<i class="fas fa-heartbeat"></i></div>
                <!-- Toggle Button -->
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Navbar Links -->
                <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
                    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
                        <ul class="navbar-nav me-auto mb-2 mb-md-0 justify-content-md-evenly" style="margin-left: 300px;">
                            <li class="nav-item ms-4">
                                <a class="nav-link t-white fs-5" href="index.jsp"><i class="fas fa-home"></i>&nbsp; Home</a>
                            </li>
                            <li class="nav-item ms-4">
                                <a class="nav-link t-white fs-5" href="patientLogin.jsp"><i class="fas fa-procedures"></i>&nbsp; Patient</a>
                            </li>
                            <li class="nav-item ms-4">
                                <a class="nav-link t-white fs-5" href="donarLogin.jsp"><i class="fas fa-user"></i>&nbsp; Donor</a>
                            </li>
                            <li class="nav-item ms-4">
                                <a class="nav-link t-white fs-5" href="adminLogin.jsp"><i class="fas fa-user-shield"></i>&nbsp; Admin</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <img src="static/img/bg.png" alt="alt" class="position-absolute w-100 h-100 "/>
        <%@include file="footer.html" %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>