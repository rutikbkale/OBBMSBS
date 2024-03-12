<%@page import="com.entities.Donar"%>
<%@page import="com.helper.AgeCalculator"%>
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
        <%@include file="donarBase.jsp" %>
        <div class="container" style="margin-top: 75px;">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header bg-red text-light text-center fs-5">
                            <i class="fas fa-hand-holding-medical fa-3x"></i>&nbsp; 
                            <p>Blood Donation</p>
                        </div>
                        <%
                            Donar currentDonar = (Donar) session.getAttribute("currentDonar");
                            int id = currentDonar.getId();
                            String fName = currentDonar.getfName() + " " + currentDonar.getlName();
                            String dob = currentDonar.getDate();
                            String bloodgroup = currentDonar.getBloodgroup();
                            int age = AgeCalculator.getAge(dob);
                        %>
                        <div class="card-body">

                            <form class="row g-3" action="../../donarBloodDonation" method="POST" id="donarForm">
                                <input type="hidden" name="id" value="<%=id%>">
                                <input type="hidden" name="dName" value="<%=fName%>">
                                <input type="hidden" name="bloodgroup" value="<%= bloodgroup%>">
                                <input type="hidden" name="age" value="<%=age%>">
                                <div class="col-12">
                                    <label for="dName" class="form-label">Donar Name</label>
                                    <input type="text" class="form-control" id="dName" name="dName" value="<%=fName%>" disabled="disabled">
                                </div>
                                <div class="col-12">
                                    <label for="bloodgroup" class="form-label">Blood Group</label>
                                    <input type="text" class="form-control" id="bloodgroup" name="bloodgroup" value="<%= bloodgroup%>" disabled="disabled">
                                </div>  
                                <div class="col-12">
                                    <label for="unit" class="form-label">Unit (in ml)</label>
                                    <input type="number" class="form-control" id="unit" name="unit">
                                </div>
                                <div class="col-12">
                                    <label for="age" class="form-label">Donar Age</label>
                                    <input type="text" class="form-control" id="age" name="age" value="<%=age%>" disabled="disabled">
                                </div>
                                <div class="col-12">
                                    <label for="disease" class="form-label">Disease (if any)</label>
                                    <input type="text" class="form-control" id="disease" name="disease">
                                </div>
                                <div class="container text-center my-3" style="display: none" id="loader">
                                    <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                </div>
                                <div class="col-12 text-center">
                                    <button type="submit" class="btn btn-danger btn-lg " id="sign-btn"> Donate </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="../../static/js/donarDonation.js"></script>
    </body>
</html>
