<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.dao.BloodStock"%>
<!DOCTYPE html>
<html>
    <%@include file="adminBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 225px; margin-top: 75px;">
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
        <script src="../../static/js/bloodStock.js"></script>
    </body>
</html>
