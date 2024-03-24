<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Patient"%>
<%@page import="java.sql.*" %>
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
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-sync-alt text-primary fs-4"></i>
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

                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-sync text-warning fs-4"></i>
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
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-primary fs-4"></i>
                                <div class="mt-5 fs-5">Approved Request</div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCondCount("blood_request_list_tb", "id", "Approved", "patient_id", id)%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body  d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-times-circle text-danger fs-4"></i>
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
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body  d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-success fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Withdrawal Successfully
                                </div>
                            </div>
                            <div class="position-relative" style="top: 10px; right: 30px;">
                                <h4><%=CountProvider.getCondCount("blood_request_list_tb", "id", "Withdrawal", "patient_id", id)%></h4>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <%
                if (count == 0) {
                    out.println("<div class='row mt-5'>");
                    out.println("<div class='col-6 offset-3'>");
                    out.println("<div class='card bg-light'>");
                    out.println("<div class='card-body text-center '>");
                    out.println("<div class='my-3 fs-4 text-primary'>");
                    out.println(" You Have Not Yet Made Any Blood Request !");
                    out.println("</div>");
                    out.println("<div>");
                    out.println("<p>For Blood Request </p>");
                    out.println("<a class='btn btn-danger' href='patientBloodReq.jsp'>Made Request</a>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println(" </div>");
                } else {
                    try {
                        String query = "SELECT status, approval_date, rejection_reason FROM blood_request_list_tb WHERE patient_id = ? ORDER BY id desc LIMIT 1";
                        String status = "";
                        Date approvalDate;
                        String rejectionReason;
                        Connection con = DBClass.getConnection();
                        PreparedStatement pstmt = con.prepareStatement(query);
                        pstmt.setInt(1, id);
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                            status = rs.getString("status");

                            if (status.equals("Approved")) {
                                approvalDate = rs.getDate("approval_date");
                                LocalDate localApprovalDate = approvalDate.toLocalDate();
                                LocalDate expireDate = localApprovalDate.plusDays(10);
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                String formattedExpireDate = expireDate.format(formatter);
                                out.println("<div class='row mt-5'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-primary'>");
                                out.println(" Your Request For Blood Has Been Approved !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p>You can collect your required blood from blood bank. </p>");
                                out.println("<p>Within 10 days you need to collect your blood. </p>");
                                out.println("<p class='text-danger'>Expired Date : " + formattedExpireDate + "</p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println(" </div>");
                            } else if (status.equals("Rejected")) {
                                rejectionReason = rs.getString("rejection_reason");
                                out.println("<div class='row mt-5'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-danger'>");
                                out.println("Your Request For Blood Has Been Rejected !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p>Sorry Try next time. </p>");
                                out.println("<p class='text-danger'>Reason : " + rejectionReason + "</p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println(" </div>");
                            } else if (status.equals("Withdrawal")) {
                                out.println("<div class='row mt-5'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-success'>");
                                out.println("Blood Successfully withdrawal by you !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p class='text-primary'>Thank you for using our website. </p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println(" </div>");
                            } else {
                                out.println("<div class='row mt-5'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-warning'>");
                                out.println("Your Request For Blood In Progress !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p class='text-primary'>Please wait for approval . </p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println(" </div>");
                            }
                        }
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            %>
        </div>
    </body>
</html>
