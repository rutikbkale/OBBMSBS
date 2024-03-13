<%@page import="com.dao.BloodStock"%>
<%@page import="com.helper.DBClass"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>--%>
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
                                <h4>A+ <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("A+") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h4>B+ <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("B+") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h4>O+ <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("O+") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h4>AB+ <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("AB+") + " ml"%></h2>
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
                                <h4>A- <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("A-") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h4>B- <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("B-") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h4>O- <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("O-") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-5">
                            <div class="blood">
                                <h4>AB- <i class="fas fa-tint text-danger"></i></h4>
                            </div>
                            <div>
                                <h2><%=BloodStock.getUnit("AB-") + " ml"%></h2>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-users text-primary"></i>
                                <div class="mt-5">
                                    Total Donors
                                </div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4>5</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-spinner text-primary"></i>
                                <div class="mt-5">
                                    Total Requests
                                </div>
                            </div> 
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4>5</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="far fa-check-circle text-primary"></i>
                                <div class="mt-5">
                                    Approved Requests
                                </div>
                            </div>    
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4>5</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-tint xyz text-primary"></i>
                                <div class="mt-5">
                                    Total Blood Unit (in ml)
                                </div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%= BloodStock.getTotalUnit()%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
