<%@page import="com.dao.BloodStock"%>
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
        <%@include file="adminBase.jsp" %>
        <div class="container" style="margin-left: 210px; margin-top: 75px;">
            <div class="row">
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>A+ <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("A+") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>B+ <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("B+") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>O+ <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("O+") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>AB+ <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("AB+") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>A- <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("A-") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>B- <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("B-") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>O- <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("O-") + " ml"%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h2>AB- <i class="fas fa-tint text-danger"></i></h2>
                            </div>
                            <div>
                                <h4><%=BloodStock.getUnit("AB-") + " ml"%></h4>
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
                                <form action="../../bloodStockUpdater" method="POST" id="myForm">
                                    <div class="form-group my-3">
                                        <select name="bloodgroup" class="form-select form-control">
                                            <option selected="selected">Choose option</option>
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
                                        <input type="number" class="form-control" name="unit" placeholder="Enter Unit in ml">
                                    </div>
                                    <div class="container text-center my-3" style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                    </div>
                                    <div class="form-group my-3 text-center">
                                        <button type="submit" class="btn btn-danger" id="updateBtn">Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="../../static/js/bloodStock.js"></script>

    </body>
</html>
