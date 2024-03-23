<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.BloodStock"%>
<%@page import="com.helper.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%@include file="adminBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 250px; margin-top: 75px;">

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
                                <i class="fas fa-users text-primary fs-4"></i>
                                <div class="mt-5">
                                    Total Donation Requests
                                </div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCount("blood_donation_list_tb", "id")%></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-spinner text-warning fs-4"></i>
                                <div class="mt-5">
                                    Total Blood Requests
                                </div>
                            </div> 
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCount("blood_request_list_tb", "id")%></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-success fs-4"></i>
                                <div class="mt-5">
                                    Approved Requests
                                </div>
                            </div>    
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4>
                                    <%
                                        int count1 = CountProvider.getCond1Count("blood_donation_list_tb", "id", "Approved");
                                        int count2 = CountProvider.getCond1Count("blood_request_list_tb", "id", "Approved");
                                        int totalCount = count1 + count2;
                                    %>
                                    <%=totalCount%> 
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 my-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-tint text-danger fs-4"></i>
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
