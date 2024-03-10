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
    </head>
    <body>
        <nav style="background-color: #FF0018;" class="navbar navbar-expand-md navbar-dark fixed-top">
            <div class="container-fluid d-flex justify-content-evenly">
                <!-- Title -->
                <div class="navbar-brand fs-3 me-auto"><i class="fas fa-heartbeat fa-spin"></i>&nbsp; Online Blood Bank Management System &nbsp;<i class="fas fa-heartbeat fa-spin"></i></div>
                <!-- Navbar Links -->
                <ul class="navbar-nav">
                    <li class="nav-item ms-5">
                        <a class="nav-link fs-5 me-5" onclick="logout()" href="#"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="asider">
            <ul class="list-group list-unstyled">
                <li class="px-3 d-block py-4 fs-5"><a href="patientDashboard.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li class="px-3 d-block py-4 fs-5"><a href="patientBloodReq.jsp"><i class="fas fa-sync-alt"></i> Blood Request</a></li>
                <li class="px-3 d-block py-4 fs-5"><a href="patientBloodReqHistory.jsp"><i class="fas fa-history"></i> Request History</a></li>
            </ul> 
        </div>
        <%@include file="../../footer.html" %>
        <script src="https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js"></script>

        <script>
                            function logout() {
                                swal({
                                    title: 'Log out?',
                                    text: 'Are you sure you want to log out?',
                                    type: 'warning',
                                    showCancelButton: true,
                                    confirmButtonColor: '#3085d6',
                                    cancelButtonColor: '#d33',
                                    confirmButtonText: 'OK',
                                    closeOnConfirm: true,
                                    closeOnCancel: true
                                }).then((result) => {
                                    if (result.value === true) {
                                        window.location.href = '../../patientLogin.jsp';
                                    }
                                });
                            }
        </script>
    </body>
</html>
