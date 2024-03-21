<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Donar"%>
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
                <div class="col-sm-3">
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
                                %>
                                <%=totalCount%>
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

                <div class="col-sm-3">
                    <div class="card bg-light">
                        <div class="card-body d-flex justify-content-between mb-3">
                            <div class="blood">
                                <i class="fas fa-check-circle text-success fs-4"></i>
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
                <div class="col-sm-3">
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
            </div>

            <div class="row mt-5">
                <div class="col-6 offset-3">
                    <div class="card bg-light">
                        <div class="card-body text-center ">
                            <div class="my-3 fs-4">
                                You Have Not Yet Made Any Donation Request !
                            </div>
                            <div>
                                <p>For Blood Request </p>
                                <a class="btn btn-danger" href="donarBloodDonation.jsp">Made Request</a>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
