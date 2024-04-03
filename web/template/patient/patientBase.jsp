<%@page import="com.helper.IdProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.entities.Patient" %>
<!DOCTYPE html>
<html>
    <%@include file="../../header.jsp" %>
    <body>
        <nav style="background-color: #FF0018;" class="navbar navbar-expand-md navbar-dark fixed-top">
            <div class="container-fluid d-flex justify-content-evenly">
                <!-- Title -->
                <div class="navbar-brand fs-3 me-auto"><i class="fas fa-heartbeat"></i>&nbsp; Online Blood Bank Management System &nbsp;<i class="fas fa-heartbeat"></i></div>
                <!-- Navbar Links -->
                <ul class="navbar-nav">
                    <li class="nav-item ms-5">
                        <a class="nav-link fs-5 me-5" style="color: white;" data-bs-toggle="modal" data-bs-target="#profileModal" href="#?"><i class="fas fa-user-circle"></i> Profile</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Modal -->
        <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header bg-red">
                        <h1 class="modal-title fs-5 text-light text-center" id="exampleModalLabel"><i class="fas fa-user-circle fs-5"></i> Patient Profile</h1>
                        <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <%
                            Patient patient = (Patient) session.getAttribute("currentPatient");
                        %>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th>Name : </th>
                                    <td><%= patient.getfName() + " " + patient.getlName()%></td>
                                </tr>
                                <tr>
                                    <th>Address : </th>
                                    <td><%= patient.getAddress()%></td>
                                </tr>
                                <tr>
                                    <th>Mobile No : </th>
                                    <td><%= patient.getMobno()%></td>
                                </tr>
                                <tr>
                                    <th>Blood Group : </th>
                                    <td><%= patient.getBloodgroup()%></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="d-flex justify-content-evenly">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#editModal"><i class="fas fa-solid fa-user-pen"></i> Edit</button>
                            <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#passwordModal"><i class="fas fa-solid fa-key"></i> Change Password</button>
                            <button type="button" class="btn btn-danger" onclick="logout('patientLogin')"><i class="fas fa-sign-out-alt"></i> Log out</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header bg-red">
                        <h1 class="modal-title fs-5 text-light text-center" id="exampleModalLabel"><i class="fas fa-solid fa-user-pen fs-5"></i> Edit Details </h1>
                        <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../../editProfile" method="post" id="editProfile">
                            <input type="hidden" name="id" value="<%= IdProvider.getPatientId(patient)%>">
                            <input type="hidden" name="userType" id="userType" value="patient">
                            <%
                                session.setAttribute("cPatient", patient);
                            %>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>First Name : </th>
                                        <td>
                                            <input type="text" class="form-control" id="fName" name="fName" value="<%=patient.getfName()%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Last Name : </th>
                                        <td>
                                            <input type="text" class="form-control" id="lName" name="lName" value="<%=patient.getlName()%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Address : </th>
                                        <td>
                                            <input type="text" class="form-control" id="address" name="address" value="<%=patient.getAddress()%>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Blood Group : </th>
                                        <td>
                                            <input type="text" class="form-control" id="bloodgroup" name="bloodgroup" value="<%=patient.getBloodgroup()%>">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="text-center">
                                <input type="submit" class="btn btn-outline-danger" value="save" data-bs-toggle="modal" data-bs-target="#editModal">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header bg-red">
                        <h1 class="modal-title fs-5 text-light text-center" id="exampleModalLabel"><i class="fas fa-solid fa-key fs-5"></i> Change Password</h1>
                        <button type="button" class="btn-close bg-light" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="../../changePassword" method="post" id="changePassword">
                            <input type="hidden" name="dbPassword" value="<%=patient.getPassword()%>">
                            <input type="hidden" name="id" value="<%= IdProvider.getPatientId(patient)%>">
                            <input type="hidden" name="userType" id="userType" value="patient">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>Old Password : </th>
                                        <td>
                                            <input type="password" class="form-control" id="oldPassword" name="oldPassword">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>New Password : </th>
                                        <td>
                                            <input type="password" class="form-control" id="newPassword" name="newPassword">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="text-center">
                                <input type="submit" class="btn btn-outline-danger" value="change" data-bs-toggle="modal" data-bs-target="#passwordModal">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="asider">
            <ul class="list-group list-unstyled">
                <li class="px-3 d-block py-4 fs-5"><a href="patientDashboard.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li class="px-3 d-block py-4 fs-5"><a href="patientBloodReq.jsp"><i class="fas fa-sync-alt"></i> Blood Request</a></li>
                <li class="px-3 d-block py-4 fs-5"><a href="patientBloodReqHistory.jsp"><i class="fas fa-history"></i> Request History</a></li>
            </ul> 
        </div>
        <%@include file="../../footer.html" %>
        <script src="https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <!--<script src="../../static/js/changePassword.js"></script>-->
        <script src="../../static/js/logout.js"></script>
    </body>
</html>
