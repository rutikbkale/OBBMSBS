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
        <div class="container">

            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>A+ <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{A1.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>B+ <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{B1.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>O+ <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{O1.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>AB+ <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{AB1.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>A- <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{A2.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>B- <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{B2.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>O- <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{O2.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <h2>AB- <i class="fas fa-tint text-danger"></i></h2>
                            </div><br><br>
                            <div>
                                <!--{{AB2.unit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-users"></i>
                            </div><br>
                            <div>
                                Total Donors <br>
                                <!--{{totaldonors}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-spinner"></i>
                            </div><br>
                            <div>
                                Total Requests <br>
                                <!--{{totalrequest}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="far fa-check-circle"></i>
                            </div><br>
                            <div>
                                Approved Requests <br>
                                <!--{{totalapprovedrequest}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body">
                            <div class="blood">
                                <i class="fas fa-tint xyz"></i>
                            </div><br>
                            <div>
                                Total Blood Unit (in ml) <br>
                                <!--{{totalbloodunit}}-->
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
