<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Donar"%>
<!DOCTYPE html>
<html>
    <%@include file="donarBase.jsp" %>
    <body>
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

                            <form class="row g-3" action="../../bloodRequest" method="post" id="patientForm">
                                <input type="hidden" name="pName" value="<%=fName%>">
                                <input type="hidden" name="age" value="<%= age%>">
                                <input type="hidden" name="bloodgroup" value="<%= bloodgroup%>">
                                <input type="hidden" name="donar_id" value="<%= id%>">
                                <input type="hidden" name="isPatient" value="false" id="isPatient">
                                <div class="col-12">
                                    <label for="pName" class="form-label">Patient Name</label>
                                    <input type="text" class="form-control" id="pName" name="pName" value="<%=fName%>" disabled="disabled">
                                </div>
                                <div class="col-12">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="text" class="form-control" id="age" name="age" value="<%= age%>" disabled="disabled">
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
        <script src="../../static/js/bloodRequest.js"></script>
    </body>
</html>
