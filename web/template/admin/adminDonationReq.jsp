<%@page import="com.helper.DBClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
