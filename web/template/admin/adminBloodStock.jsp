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
            .xyz{

                display: table;
                margin-right: auto;
                margin-left: auto;
            }
        </style>
    </head>
    <body>
        <%@include file="adminBase.jsp" %>
        <div class="container" style="margin-left: 200px; margin-top: 75px;">
            <div class="row">
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
                <div class="col-sm-3 my-3">
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
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-4 offset-4">
                        <div class="card">
                            <div class="card-header bg-red">
                                <h3 class="text-center t-white">Update Blood Unit</h3>
                            </div>
                            <div class="card-body">
                                <form class="form-inline" method="POST">
                                    <!--{% csrf_token %}-->
                                    <div class="form-group my-3">
                                        <select name="bloodgroup" class="form-control">
                                            <option disabled="disabled" selected="selected">Choose Blood Group</option>
                                            <option>O+</option>
                                            <option>O-</option>
                                            <option>A+</option>
                                            <option>A-</option>
                                            <option>B+</option>
                                            <option>B-</option>
                                            <option>AB+</option>
                                            <option>AB-</option>
                                        </select>
                                    </div>
                                    <div class="form-group  my-3">
                                        <input type="number" class="form-control" name="unit" placeholder="Unit">
                                    </div>
                                    <div class="form-group my-3 text-center">
                                        <button type="submit" class="btn btn-danger">Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
