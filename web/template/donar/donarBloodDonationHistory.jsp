<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="com.entities.Donar"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%@include file="donarBase.jsp" %>
    <body>
        <div class="container" style="margin-left: 220px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">MY DONATION HISTORY</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class ='text-center'>Donar Name</th>
                        <th scope="col" class ='text-center'>Blood Group</th>
                        <th scope="col" class ='text-center'>Unit (in ml)</th>
                        <th scope="col" class ='text-center'>Donor Age</th>
                        <th scope="col" class ='text-center'>Disease (if any)</th>
                        <th scope="col" class ='text-center'>Date</th>
                        <th scope="col" class ='text-center'>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Donar currentDonar = (Donar) session.getAttribute("currentDonar");
                        int id = IdProvider.getDonarId(currentDonar);
                        String query = "select name, bloodgroup, unit, age, disease, reqdate, status from blood_donation_list_tb where donar_id ='" + id + "'";
                        Connection con = DBClass.getConnection();
                        Statement smt = con.createStatement();
                        ResultSet set = smt.executeQuery(query);

                        if (set.next()) {
                            do {
                                out.println("<tr class ='text-center'>");
                                out.println("<td class ='text-center'>" + set.getString("name") + "</td>");
                                out.println("<td class ='text-center'>" + set.getString("bloodgroup") + "</td>");
                                out.println("<td class ='text-center'>" + set.getInt("unit") + "</td>");
                                out.println("<td class ='text-center'>" + set.getInt("age") + "</td>");
                                out.println("<td class ='text-center'>" + set.getString("disease") + "</td>");
                                out.println("<td class ='text-center'>" + set.getDate("reqdate") + "</td>");
                                String status = set.getString("status");
                                if (status.equals("Approved")) {
                                    out.println("<td class ='text-center'><span class='badge bg-success fs-5'>Approved</span></td>");
                                } else if (status.equals("Rejected")) {
                                    out.println("<td class ='text-center'><span class='badge bg-danger fs-5'>Rejected</span></td>");
                                } else {
                                    out.println("<td class ='text-center'><span class='badge bg-warning fs-5'>Pending</span></td>");
                                }
                                out.println("</tr>");
                            } while (set.next());
                        } else {
                            out.println("<tr><td colspan='7' class='text-center'>No Blood Donation Request History Found !</td></tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
