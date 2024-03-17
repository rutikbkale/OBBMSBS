<%@page import="com.helper.AgeCalculator"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.helper.DBClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
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
            <H4 class="text-center" style="margin-top: 6rem;">DONOR DETAILS</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class="text-center">Name</th>
                        <th scope="col" class="text-center">Address</th>
                        <th scope="col" class="text-center">Age</th>
                        <th scope="col" class="text-center">Blood Group</th>
                        <th scope="col" class="text-center">Mobile</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection con = DBClass.getConnection();
                        String query = "select fName, lName, address, dob, bloodgroup,mobno from donar_info_tb";
                        Statement smt = con.createStatement();
                        ResultSet set = smt.executeQuery(query);
                        while (set.next()) {
                            out.println("<tr>");
                            String fName = set.getString("fName") + " " + set.getString("lName");
                            out.println("<td class='text-center'>" + fName + "</td>");
                            out.println("<td class='text-center'>" + set.getString("address") + "</td>");
                            String dob = set.getString("dob");
                            out.println("<td class='text-center'>" + AgeCalculator.getAge(dob) + "</td>");
                            out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                            out.println("<td class='text-center'>" + set.getString("mobno") + "</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
