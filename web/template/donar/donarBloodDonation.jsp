<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Donar"%>
<!DOCTYPE html>
<html>
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
                            int id = IdProvider.getDonarId(currentDonar);
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
        <script src="../../static/js/donarDonation.js"></script>
    </body>
</html>
