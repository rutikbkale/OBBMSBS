<%@page import="com.helper.*"%>
<%@page import="com.entities.Donar"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OBBMS - Save The Lifes</title>

        <!-- font awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--Bootstrap cdn-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href="../../static/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="donarBase.jsp" %>
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

                        while (set.next()) {
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
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
