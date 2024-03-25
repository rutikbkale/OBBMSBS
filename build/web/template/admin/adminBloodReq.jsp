<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.DBClass"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="adminBase.jsp" %>
    </head>
    <body>
        <div class="container" style="margin-left: 250px; margin-top: 75px;">
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
                        String query = "select id, name, age, reason, bloodgroup, unit, reqdate from blood_request_list_tb where status='Pending'";
                        Statement smt = con.createStatement();
                        ResultSet set = smt.executeQuery(query);
                        if (set.next()) {
                            do {
                                int id = set.getInt("id");
                                int unit = set.getInt("unit");
                                String bloodgroup = set.getString("bloodgroup");
                    %>
                    <tr>
                        <td class='text-center'><%= id%></td>
                        <td class='text-center'><%= set.getString("name")%></td>
                        <td class='text-center'><%= set.getInt("age")%></td>
                        <td class='text-center'><%= set.getString("reason")%></td>
                        <td class='text-center'><%= bloodgroup%></td>
                        <td class='text-center'><%= unit%></td>
                        <td class='text-center'><%= set.getDate("reqdate")%></td>
                        <td class='d-flex justify-content-evenly'>
                            <form id='approvalForm' action='../../bloodRequestStatus' method='post'>
                                <input type='hidden' name='id' value='<%= id%>'>
                                <input type='hidden' name='bloodgroup' value='<%= bloodgroup%>'>
                                <input type='hidden' name='unit' value='<%= unit%>'>
                                <input type='hidden' name='status' value='Approved'>
                                <button type='submit' class='btn btn-success badge-pill'>Approve</button>
                            </form>
                            <form id='rejectionForm<%= id%>' action='../../bloodRequestStatus' method='post'>
                                <input type='hidden' name='id' value='<%= id%>'>
                                <input type='hidden' name='status' value='Rejected'>
                                <button type='button' class='btn btn-danger badge-pill' onclick='rejectRequest(<%= id%>)'>Reject</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            } while (set.next());
                        } else {
                            out.println("<tr><td colspan='8' class='text-center'>No Blood Request Found !</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
        <!--<script src="../../static/js/bloodStockChecker.js"></script>-->
        <script src="../../static/js/rejectionRequest.js"></script>
    </body>
</html>
