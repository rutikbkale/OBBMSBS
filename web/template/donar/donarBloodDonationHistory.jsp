<%@page import="com.helper.DBClass"%>
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
                        <th scope="col">Donar Name</th>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Unit (in ml)</th>
                        <th scope="col">Donor Age</th>
                        <th scope="col">Disease (if any)</th>
                        <th scope="col">Date</th>
                        <th scope="col">Status</th>

                    </tr>
                </thead>
                <%
                    Donar currentDonar = (Donar) session.getAttribute("currentDonar");
                    int id = currentDonar.getId();
                    String query = "select name, bloodgroup, unit, age, disease, reqdate, status from blood_donation_list_tb where id ='" + id + "'";
                    Connection con = DBClass.getConnection();
                    Statement smt = con.createStatement();
                    ResultSet set = smt.executeQuery(query);
                %>
                <tbody>
                    <%
                        while (set.next()) {
                            out.println("<tr>");
                            out.println("<td>" + set.getString("name") + "</td>");
                            out.println("<td>" + set.getString("bloodgroup") + "</td>");
                            out.println("<td>" + set.getInt("unit") + "</td>");
                            out.println("<td>" + set.getInt("age") + "</td>");
                            out.println("<td>" + set.getString("disease") + "</td>");
                            out.println("<td>" + set.getDate("reqdate") + "</td>");
                            if (set.getString("status") == "Approved") {
                                out.println("<td><span class='label success'>Approved</span></td>");
                            } else if (set.getString("status") == "Rejected") {
                                out.println("<td><span class='label danger'>Rejected</span></td>");
                            } else {
                                out.println("<td><span class='label warning'>Pending</span></td>");
                            }
                            out.println("</tr>");
                        }
                    %>
                </tbody>
                <!--                <tbody>
                                    {% for t in donations %}
                                    <tr>
                
                
                                        <td>{{t.age}}</td>
                                        <td> {{t.disease}}</td>
                
                                        <td>{{t.bloodgroup}}</td>
                                        <td>{{t.unit}}</td>
                                        <td>{{t.date}}</td>
                                        {% if t.status == 'Approved' %}
                                        <td><span class="label warning"> Approved</span></td>
                
                                        {% elif t.status == 'Rejected' %}
                                        <td><span class="label success">Rejected</span></td>
                                        {% else %}
                                        <td><span style="color: white;margin-left: 0px;" class="label info">Pending</span></td>
                                        {% endif %}
                
                
                                    </tr>
                                    {% endfor %}
                
                                </tbody>-->

            </table>
        </div>
    </body>
</html>
