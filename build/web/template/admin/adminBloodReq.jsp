<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.DBClass"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%@include file="adminBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 225px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">BLOOD REQUIREMENT REQUESTS</H4><br>
            <h5 class="text-center d-block" style="color: red;"></h5>

            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
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
                                out.println("<td class='text-center'>" + set.getString("name") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("age") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("reason") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("unit") + "</td>");
                                out.println("<td class='text-center'>" + set.getDate("reqdate") + "</td>");
                                out.println("<td class='d-flex justify-content-evenly'><a class='btn btn-success badge-pill' href='../../bloodRequestStatus?id=" + id + "&status=Approved'>Approve</a><a class='btn btn-danger badge-pill' href='../../bloodRequestStatus?id=" + id + "&status=Rejected'>Reject</a></td>");
                                out.println("</tr>");
                            } while (set.next());
                        } else {
                            out.println("<tr><td colspan='7' class='text-center'>No Blood Request Found !</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
