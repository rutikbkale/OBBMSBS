<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entities.Patient"%>
<%@page import="com.helper.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%@include file="patientBase.jsp" %>
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
                            Patient currentPatient = (Patient) session.getAttribute("currentPatient");
                            String fName = currentPatient.getfName() + " " + currentPatient.getlName();
                            String dob = currentPatient.getDate();
                            String bloodgroup = currentPatient.getBloodgroup();
                            int patient_id = IdProvider.getPatientId(currentPatient);
                        %>
                        <div class="card-body">

                            <form class="row g-3" action="../../bloodRequest" method="post" id="patientForm">
                                <input type="hidden" name="pName" value="<%=fName%>">
                                <input type="hidden" name="age" value="<%= AgeCalculator.getAge(dob)%>">
                                <input type="hidden" name="bloodgroup" value="<%= bloodgroup%>">
                                <input type="hidden" name="patient_id" value="<%= patient_id%>">
                                <input type="hidden" name="isPatient" value="true" id="isPatient">
                                <div class="col-12">
                                    <label for="pName" class="form-label">Patient Name</label>
                                    <input type="text" class="form-control" id="pName" name="pName" value="<%=fName%>" disabled="disabled">
                                </div>
                                <div class="col-12">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="text" class="form-control" id="age" name="age" value="<%= AgeCalculator.getAge(dob)%>" disabled="disabled">
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
