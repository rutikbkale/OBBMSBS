<%@page import="com.helper.IdProvider"%>
<%@page import="com.helper.AgeCalculator"%>
<%@page import="com.entities.Donar"%>
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
                            <i class="fas fa-arrow-right fa-3x"></i>&nbsp; 
                            <p>BLOOD REQUEST</p>
                        </div>
                        <%
                            Donar currentDonar = (Donar) session.getAttribute("currentDonar");
                            String fName = currentDonar.getfName() + " " + currentDonar.getlName();
                            String dob = currentDonar.getDate();
                            String bloodgroup = currentDonar.getBloodgroup();
                            int id = IdProvider.getDonarId(currentDonar);
                            int age = AgeCalculator.getAge(dob);
                        %>
                        <div class="card-body">

                            <form class="row g-3" action="../../donarBloodRequest" method="post" id="donarForm">
                                <input type="hidden" name="pName" value="<%=fName%>">
                                <input type="hidden" name="age" value="<%= age%>">
                                <input type="hidden" name="bloodgroup" value="<%= bloodgroup%>">
                                <input type="hidden" name="patient_id" value="<%= id%>">
                                <div class="col-12">
                                    <label for="pName" class="form-label">Patient Name</label>
                                    <input type="text" class="form-control" id="pName" name="pName" value="<%=fName%>" disabled="disabled">
                                </div>
                                <div class="col-12">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="text" class="form-control" id="age" value="<%= age%>" disabled="disabled">
                                </div>
                                <div class="col-12">
                                    <label for="reason" class="form-label">Reason</label>
                                    <input type="text" class="form-control" id="reason" name="reason">
                                </div>
                                <div class="col-12">
                                    <label for="bloodgroup" class="form-label">Blood Group</label>
                                    <input type="text" class="form-control" id="bloodgroup" name="bloodgroup" value="<%= bloodgroup%>" disabled="disabled">
                                </div>    
                                <div class="col-12">
                                    <label for="unit" class="form-label">Unit (in ml)</label>
                                    <input type="text" class="form-control" id="unit" name="unit">
                                </div>

                                <div class="container text-center my-3" style="display: none" id="loader">
                                    <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                </div>
                                <div class="col-12 text-center">
                                    <button type="submit" class="btn btn-danger btn-lg " id="sign-btn"> Request </button>
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
        <script src="../../static/js/donarRequest.js"></script>
    </body>
</html>
