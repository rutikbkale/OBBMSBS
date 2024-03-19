<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="java.sql.*" %>
<%@page import="com.entities.Donar"%>
<!DOCTYPE html>
<html>
    <%@include file="donarBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 220px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">MY BLOOD REQUEST HISTORY</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class='text-center'>Patient Name</th>
                        <th scope="col" class='text-center'>Patient Age</th>
                        <th scope="col" class='text-center'>Reason</th>
                        <th scope="col" class='text-center'>Blood Group</th>
                        <th scope="col" class='text-center'>Unit (in ml)</th>
                        <th scope="col" class='text-center'>Date</th>
                        <th scope="col" class='text-center'>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Donar currentDonar = (Donar) session.getAttribute("currentDonar");
                        int id = IdProvider.getDonarId(currentDonar);
                        String query = "select name, age, reason, bloodgroup, unit, reqdate, status from blood_request_list_tb where donar_id ='" + id + "'";
                        Connection con = DBClass.getConnection();
                        Statement smt = con.createStatement();
                        ResultSet set = smt.executeQuery(query);

                        while (set.next()) {
                            out.println("<tr>");
                            out.println("<td class='text-center'>" + set.getString("name") + "</td>");
                            out.println("<td class='text-center'>" + set.getInt("age") + "</td>");
                            out.println("<td class='text-center'>" + set.getString("reason") + "</td>");
                            out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                            out.println("<td class='text-center'>" + set.getInt("unit") + "</td>");
                            out.println("<td class='text-center'>" + set.getDate("reqdate") + "</td>");
                            if (set.getString("status").equals("Approved")) {
                                out.println("<td class='text-center'><span class='badge bg-success fs-5'>Approved</span></td>");
                            } else if (set.getString("status").equals("Rejected")) {
                                out.println("<td class='text-center'><span class='badge bg-danger fs-5'>Rejected</span></td>");
                            } else {
                                out.println("<td class='text-center'><span class='badge bg-warning fs-5'>Pending</span></td>");
                            }
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
