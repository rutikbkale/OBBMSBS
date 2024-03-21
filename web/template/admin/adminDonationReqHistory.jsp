<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.helper.*" %>
<!DOCTYPE html>
<html>
    <%@include file="adminBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 225px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">DONATION REQUEST HISTORY</H4><br>

            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class="text-center">Req Id</th>
                        <th scope="col" class="text-center">Donar Name</th>
                        <th scope="col" class="text-center">Blood Group</th>
                        <th scope="col" class="text-center">Unit (in ml)</th>
                        <th scope="col" class="text-center">Age</th>
                        <th scope="col" class="text-center">Disease (if any)</th>
                        <th scope="col" class="text-center">Date</th>
                        <th scope="col" class="text-center">Status</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = DBClass.getConnection();
                        Statement smt = con.createStatement();
                        String query = "select id, name, bloodgroup, unit, age, disease,  reqdate, status from blood_donation_list_tb where status='Approved' or status='Rejected'";
                        ResultSet set = smt.executeQuery(query);

                        if (set.next()) {
                            do {
                                out.println("<tr>");
                                out.println("<td class='text-center'>" + set.getInt("id") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("name") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("unit") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("age") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("disease") + "</td>");
                                out.println("<td class='text-center'>" + set.getDate("reqdate") + "</td>");
                                if (set.getString("status").equals("Approved")) {
                                    out.println("<td class='text-center'><span class='badge bg-success fs-5'>Approved</span></td>");
                                } else {
                                    out.println("<td class='text-center'><span class='badge bg-danger fs-5'>Rejected</span></td>");
                                }
                                out.println("</tr>");
                            } while (set.next());
                        } else {
                            out.println("<tr><td colspan='8' class='text-center'>No Blood Donation Request History Found !</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
