<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.DBClass"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%@include file="adminBase.jsp" %>
    <!-- SweetAlert CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">


    <body>
        <div class="container" style="margin-left: 225px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">BLOOD REQUIREMENT REQUESTS</H4><br>
            <h5 class="text-center d-block" style="color: red;"></h5>

            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class="text-center">Req Id</th>
                        <th scope="col" class="text-center">Patient Name</th>
                        <th scope="col" class="text-center">Age</th>
                        <th scope="col" class="text-center">Reason</th>
                        <th scope="col" class="text-center">Blood Group</th>
                        <th scope="col" class="text-center">Unit (in ml)</th>
                        <th scope="col" class="text-center">Date</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = DBClass.getConnection();
                        Statement smt = con.createStatement();
                        String query = "select id, name, age, reason, bloodgroup, unit, reqdate from blood_request_list_tb where status='Pending'";
                        ResultSet set = smt.executeQuery(query);

                        if (set.next()) {
                            do {
                                out.println("<tr>");
                                int id = set.getInt("id");
                                out.println("<td class='text-center'>" + id + "</td>");
                                out.println("<td class='text-center'>" + set.getString("name") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("age") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("reason") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("unit") + "</td>");
                                out.println("<td class='text-center'>" + set.getDate("reqdate") + "</td>");
                                out.println("<td class='d-flex justify-content-evenly'>");
                                out.println("    <form id='approvalForm' action='../../bloodRequestStatus' method='post'>");
                                out.println("        <input type='hidden' name='id' value='" + id + "'>");
                                out.println("        <input type='hidden' name='status' value='Approved'>");
                                out.println("        <button type='submit' class='btn btn-success badge-pill'>Approve</button>");
                                out.println("    </form>");
                                out.println("    <button class='btn btn-danger badge-pill' onclick='rejectRequest(" + id + ")'>Reject</button>");
                                out.println("</td>");
                                out.println("</tr>");
                            } while (set.next());
                        } else {
                            out.println("<tr><td colspan='8' class='text-center'>No Blood Request Found !</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
    <!-- SweetAlert JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        function rejectRequest(id) {
            swal({
                title: "Reject Request",
                text: "Enter reason for rejection:",
                content: {
                    element: "input",
                    attributes: {
                        placeholder: "Enter reason",
                        type: "text",
                    },
                },
                buttons: {
                    cancel: true,
                    confirm: {
                        text: "Submit",
                        value: true,
                        visible: true,
                        className: "btn btn-danger",
                    },
                },
            }).then((reason) => {
                if (reason) {
                    // Submit the rejection reason along with the ID and status to the controller
                    var formData = new FormData();
                    formData.append("id", id);
                    formData.append("status", "Rejected");
                    formData.append("rejectionReason", reason);
                    console.log(id,reason)
                    fetch("../../bloodRequestStatus", {
                        method: "POST",
                        body: formData,
                    }).then(response => {
                        if (response.ok) {
                            swal("Request rejected!", {
                                icon: "success",
                            });
                        } else {
                            swal("Error!", "Failed to reject request.", "error");
                        }
                    }).catch(error => {
                        swal("Error!", "Failed to reject request.", "error");
                    });
                } else {
                    swal("Cancelled", "No reason provided", "error");
                }
            });
        }
    </script>
</html>
