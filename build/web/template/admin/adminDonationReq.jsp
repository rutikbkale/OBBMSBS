<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.DBClass"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="adminBase.jsp" %>
        <div class="container" style="margin-left: 225px; margin-top: 75px;">
            <H4 class="text-center"  style="margin-top: 6rem;">BLOOD DONATION REQUESTS</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
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
                            while (set.next()) {
                                out.println("<tr>");
                                int id = set.getInt("id");
                                out.println("<td class='text-center'>" + set.getString("name") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("unit") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("age") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("disease") + "</td>");
                                out.println("<td class='text-center'>" + set.getDate("reqdate") + "</td>");
                                out.println("<td class='d-flex justify-content-evenly'><a class='btn btn-success badge-pill' href='../../bloodDonationStatus?id=" + id + "&status=Approved'>Approve</a><a class='btn btn-danger badge-pill' href='../../bloodDonationStatus?id=" + id + "&status=Rejected'>Reject</a></td>");
                                out.println("</tr>");
                            }
                        } else {
                            out.println("</tbody>");
                            out.println(" </table>");
                            out.println("<h5 class='text-center'>No Blood Donation Request Found !</h5>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
