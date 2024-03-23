<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Donar"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
    <%@include file="donarBase.jsp" %>
    <body>
        <div class="container"  style="margin-left: 220px; margin-top: 75px;">
            <%
                Donar currentDonar = (Donar) session.getAttribute("currentDonar");
                int id = IdProvider.getDonarId(currentDonar);
            %>
            <div class="row">
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-sync-alt xyz text-primary fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Request Made 
                                </div>
                            </div>
                            <div class="position-relative fs-5" style="top: 10px; right: 30px;">
                                <%
                                    int count1 = CountProvider.getTotalCount("blood_donation_list_tb", "id", "donar_id", id);
                                    int count2 = CountProvider.getTotalCount("blood_request_list_tb", "id", "donar_id", id);
                                    int totalCount = count1 + count2;
                                    int dc = count1;
                                %>
                                <%=totalCount%>
                            </div>                            
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-sync xyz text-warning fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Pending Request
                                </div>
                            </div>
                            <div class="position-relative fs-5" style="top: 10px; right: 30px;">
                                <%
                                    count1 = CountProvider.getCondCount("blood_donation_list_tb", "id", "Pending", "donar_id", id);
                                    count2 = CountProvider.getCondCount("blood_request_list_tb", "id", "Pending", "donar_id", id);
                                    totalCount = count1 + count2;
                                %>
                                <%=totalCount%>
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-primary fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Approved Request
                                </div>
                            </div>
                            <div class="position-relative fs-5" style="top: 10px; right: 30px;">
                                <%
                                    count1 = CountProvider.getCondCount("blood_donation_list_tb", "id", "Approved", "donar_id", id);
                                    count2 = CountProvider.getCondCount("blood_request_list_tb", "id", "Approved", "donar_id", id);
                                    totalCount = count1 + count2;
                                %>
                                <%=totalCount%> 
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-times-circle xyz text-danger fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Rejected Request 
                                </div>
                            </div>
                            <div class="position-relative fs-5" style="top: 10px; right: 30px;">
                                <%
                                    count1 = CountProvider.getCondCount("blood_donation_list_tb", "id", "Rejected", "donar_id", id);
                                    count2 = CountProvider.getCondCount("blood_request_list_tb", "id", "Rejected", "donar_id", id);
                                    totalCount = count1 + count2;
                                %>
                                <%=totalCount%>
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-success fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Donated Successfully
                                </div>
                            </div>
                            <div class="position-relative fs-5" style="top: 10px; right: 30px;">
                                <%
                                    count1 = CountProvider.getCondCount("blood_donation_list_tb", "id", "Donated", "donar_id", id);
                                %>
                                <%=count1%> 
                            </div>                            
                        </div>
                    </div>
                </div>

                <div class="col-4">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-success fs-4"></i>
                                <div class="mt-5 fs-5">
                                    Withdrawal Successfully
                                </div>
                            </div>
                            <div class="position-relative fs-5" style="top: 10px; right: 30px;">
                                <%
                                    count2 = CountProvider.getCondCount("blood_request_list_tb", "id", "Withdrawal", "donar_id", id);
                                %>
                                <%=count2%> 
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
            <hr>

            <%
                if (dc == 0) {
                    out.println("<div class='row mt-3'>");
                    out.println("<div class='col-6 offset-3'>");
                    out.println("<div class='card bg-light'>");
                    out.println("<div class='card-body text-center '>");
                    out.println("<div class='my-3 fs-4 text-primary'>");
                    out.println(" You Have Not Yet Made Any Donation Request !");
                    out.println("</div>");
                    out.println("<div>");
                    out.println("<p>For Donation Request </p>");
                    out.println("<a class='btn btn-danger' href='donarBloodDonation.jsp'>Made Request</a>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println(" </div>");
                } else {
                    try {
                        String query = "SELECT status, approval_date, rejection_reason FROM blood_donation_list_tb WHERE donar_id = ? ORDER BY approval_date LIMIT 1";
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
                                out.println("<div class='row mt-3'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-primary'>");
                                out.println(" Your Request For Donation Has Been Approved !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p>You can visit our blood bank. </p>");
                                out.println("<p>Within 10 days you need to donate your blood. </p>");
                                out.println("<p class='text-danger'>Expired Date : " + formattedExpireDate + "</p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println(" </div>");
                            } else if (status.equals("Rejected")) {
                                rejectionReason = rs.getString("rejection_reason");
                                out.println("<div class='row mt-3'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-danger'>");
                                out.println("Your Request For Blood Has Been Rejected !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p>Sorry Try next time. </p>");
                                out.println("<p>Reason : " + rejectionReason + "</p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println(" </div>");
                            } else if (status.equals("Donated")) {
                                out.println("<div class='row mt-3'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-success'>");
                                out.println("Thank you for your valuable blood !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p>You can donate your blood 3 times in a year.</p>");
                                out.println("<p class='text-primary'>Eat healthy and stay strong !</p>");
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

            <%-- <%
                 if (bc == 0) {
                     out.println("<div class='row mt-3'>");
                     out.println("<div class='col-6 offset-3'>");
                     out.println("<div class='card bg-light'>");
                     out.println("<div class='card-body text-center '>");
                     out.println("<div class='my-3 fs-4 text-primary'>");
                     out.println(" You Have Not Yet Made Any Blood Request !");
                     out.println("</div>");
                     out.println("<div>");
                     out.println("<p>For Blood Request </p>");
                     out.println("<a class='btn btn-danger' href='donarBloodReq.jsp'>Made Request</a>");
                     out.println("</div>");
                     out.println("</div>");
                     out.println("</div>");
                     out.println("</div>");
                     out.println(" </div>");
                 } else {
                     try {
                         String query = "SELECT status, approval_date, rejection_reason FROM blood_request_list_tb WHERE donar_id = ? ORDER BY approval_date LIMIT 1";
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
                                out.println("<div class='row mt-3'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-success'>");
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
                                out.println("<div class='row mt-3'>");
                                out.println("<div class='col-6 offset-3'>");
                                out.println("<div class='card bg-light'>");
                                out.println("<div class='card-body text-center '>");
                                out.println("<div class='my-3 fs-4 text-danger'>");
                                out.println("Your Request For Blood Has Been Rejected !");
                                out.println("</div>");
                                out.println("<div>");
                                out.println("<p>Sorry Try next time. </p>");
                                out.println("<p>Reason : " + rejectionReason + "</p>");
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
            %> --%>
        </div>
    </body>
</html>
