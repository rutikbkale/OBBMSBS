<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.DBClass"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%@include file="adminBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 250px; margin-top: 75px;">
            <H4 class="text-center"  style="margin-top: 6rem;">BLOOD DONATION REQUESTS</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class="text-center">Req Id</th>
                        <th scope="col" class="text-center">Donor Name</th>
                        <th scope="col" class="text-center">Blood Group</th>
                        <th scope="col" class="text-center">Unit (in ml)</th>
                        <th scope="col" class="text-center">Age</th>
                        <th scope="col" class="text-center">Disease</th>
                        <th scope="col" class="text-center">Request Date</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = DBClass.getConnection();
                        Statement smt = con.createStatement();
                        String query = "select id, name, bloodgroup, unit, age, disease, reqdate from blood_donation_list_tb where status='Pending'";
                        ResultSet set = smt.executeQuery(query);

                        if (set.next()) {
                            do {
                                out.println("<tr>");
                                int id = set.getInt("id");
                    %>
                    <tr>
                        <td class='text-center'><%=id%></td>
                        <td class='text-center'><%=set.getString("name")%></td>
                        <td class='text-center'><%=set.getString("bloodgroup")%></td>
                        <td class='text-center'><%=set.getInt("unit")%></td>
                        <td class='text-center'><%=set.getInt("age")%></td>
                        <td class='text-center'><%=set.getString("disease")%></td>
                        <td class='text-center'><%=set.getDate("reqdate")%></td>
                        <td class='d-flex justify-content-evenly'>
                            <form id='approvalForm' action='../../bloodDonationStatus' method='post'>
                                <input type='hidden' name='id' value='<%= id%>'>
                                <input type='hidden' name='status' value='Approved'>
                                <button type='submit' class='btn btn-success badge-pill'>Approve</button>
                            </form>
                            <form id='rejectionForm<%= id%>' action='../../bloodDonationStatus' method='post'>
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
        <script src="../../static/js/rejectionRequest.js"></script>
    </body>
</html>
