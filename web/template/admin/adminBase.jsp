<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
        <%@include file="../../header.jsp" %>
    </head>
    <body>
        <nav style="background-color: #FF0018;" class="navbar navbar-expand-md navbar-dark fixed-top">
            <div class="container-fluid d-flex justify-content-evenly">
                <!-- Title -->
                <div class="navbar-brand fs-3 me-auto"><i class="fas fa-heartbeat"></i>&nbsp; Online Blood Bank Management System &nbsp;<i class="fas fa-heartbeat"></i></div>
                <!-- Navbar Links -->
                <ul class="navbar-nav">
                    <li class="nav-item ms-5">
                        <a class="nav-link fs-5 me-5" style="color: white;" onclick="logout('adminLogin')" href="#"><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a>
                    </li>            
                </ul>
            </div>
        </nav>
        <div class="asider" style="width: 250px;">
            <ul class="list-group list-unstyled">
                <li class="p-3 pt-4 d-block fs-5"><a href="adminDashboard.jsp"><i class="fas fa-home"></i>&nbsp;Home</a></li>
                <li class="p-3 d-block fs-5"><a href="adminDonarList.jsp"><i class="fas fa-user"></i>&nbsp;Donor</a></li>
                <li class="p-3 d-block fs-5"><a href="adminPatientList.jsp"><i class="fas fa-user-injured"></i>&nbsp;Patient</a></li>
                <li class="p-3 d-block fs-5"><a href="adminDonationReq.jsp"><i class="fas fa-hand-holding-medical"></i>&nbsp;Donations</a></li>
                <li class="p-3 d-block fs-5"><a href="adminWaitingDonationReq.jsp"><i class="fas fa-regular fa-hourglass-half"></i>&nbsp;Waiting Donations</a></li>
                <li class="p-3 d-block fs-5"><a href="adminDonationReqHistory.jsp"><i class="fas fa-history"></i>&nbsp;Donation History</a></li>
                <li class="p-3 d-block fs-5"><a href="adminBloodReq.jsp"><i class="fas fa-sync-alt"></i>&nbsp;Blood Requests</a></li>
                <li class="p-3 d-block fs-5"><a href="adminWaitingDonationReq.jsp"><i class="fas fa-regular fa-hourglass-half"></i>&nbsp;Waiting Withdrawal</a></li>
                <li class="p-3 d-block fs-5"><a href="adminBloodReqHistory.jsp"><i class="fas fa-history"></i>&nbsp;Request History</a></li>
                <li class="p-3 d-block fs-5"><a href="adminBloodStock.jsp"><i class="fas fa-hand-holding-water"></i>&nbsp;Blood Stock</a></li>
            </ul> 
        </div>
        <%@include file="../../footer.html" %>
        <script src="https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script src="../../static/js/logout.js"></script>
    </body>
</html>
