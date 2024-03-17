<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.helper.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="adminBase.jsp" %>
        <div class="container" style="margin-left: 225px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">DONOR DETAILS</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col" class="text-center">Donar Id</th>
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
                        String query = "select id, fName, lName, address, dob, bloodgroup,mobno from donar_info_tb";
                        Statement smt = con.createStatement();
                        ResultSet set = smt.executeQuery(query);
                        while (set.next()) {
                            out.println("<tr>");
                            String fName = set.getString("fName") + " " + set.getString("lName");
                            out.println("<td class='text-center'>" + set.getInt("id") + "</td>");
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
