<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Patient"%>
<!DOCTYPE html>
<html>
    <%@include file="patientBase.jsp" %>
    <body>
        <div class="container"  style="margin-left: 210px; margin-top: 75px;">
            <%
                Patient currentPatient = (Patient) session.getAttribute("currentPatient");
                int id = IdProvider.getPatientId(currentPatient);
            %>
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-sync-alt xyz text-primary fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Request Made
                                </div> 
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4>
                                    <%int count = CountProvider.getTotalCount("blood_request_list_tb", "id", "patient_id", id);
                                        out.println(count);
                                    %>
                                </h4>
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-sync xyz text-warning fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Pending Request
                                </div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCondCount("blood_request_list_tb", "id", "Pending", "patient_id", id)%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle xyz text-success fs-4"></i>
                                <div class="mt-5 fs-5">Approved Request</div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCondCount("blood_request_list_tb", "id", "Approved", "patient_id", id)%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body  d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-times-circle xyz text-danger fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Rejected Request
                                </div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCondCount("blood_request_list_tb", "id", "Rejected", "patient_id", id)%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>

            <%
                if (count == 1) {
            %>
            <div class="row mt-5">
                <div class="col-6 offset-3">
                    <div class="card bg-light">
                        <div class="card-body text-center ">
                            <div class="my-3 fs-4">
                                You Have Not Yet Made Any Blood Request !
                            </div>
                            <div>
                                <p>For Blood Request </p>
                                <a class="btn btn-danger" href="patientBloodReq.jsp">Made Request</a>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
            <%
            } else {
            %>
            <div class="row mt-5">
                <div class="col-6 offset-3">
                    <div class="card bg-light">
                        <div class="card-body text-center ">
                            <div class="my-3 fs-4">
                                Your Request For Blood Has Been Approved !
                            </div>
                            <div>
                                <p>Testing </p>
                                <a class="btn btn-danger" href="patientBloodReq.jsp">Made Request</a>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
