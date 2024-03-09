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
        <%@include file="patientBase.jsp" %>
        <div class="container"  style="margin-left: 210px; margin-top: 75px;">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-sync-alt xyz text-primary"></i>
                            </div><br>
                            <div>
                                Request Made <br>
                                <!--{{requestmade}}-->
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-sync xyz text-primary"></i>
                            </div><br>
                            <div>
                                Pending Request <br>
                                <!--{{requestpending}}-->
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-check-circle xyz text-success"></i>
                            </div><br>
                            <div>
                                Approved Request<br>
                                <!--{{requestapproved}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-times-circle xyz text-danger"></i>
                            </div><br>
                            <div>
                                Rejected Request <br>
                                <!--{{requestrejected}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
