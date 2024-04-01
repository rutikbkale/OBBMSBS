<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="navbar.jsp" %>
    <body>
        <main class="d-flex align-items-center" style="height:100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card border-0">
                            <div class="card-header bg-red text-light text-center fs-5">
                                <i class="fas fa-procedures fa-3x"></i>&nbsp; 
                                <p class="fw-bold">Patient Signup</p>
                            </div>
                            <div class="card-body">
                                <form class="row g-3" action="patientSignup" method="post" id="patientForm">
                                    <div class="col-md-6">
                                        <label for="fName" class="form-label fw-semibold">First Name</label>
                                        <input type="text" class="form-control" id="fName" name="fName">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lName" class="form-label fw-semibold">Last Name</label>
                                        <input type="text" class="form-control" id="lName" name="lName">
                                    </div>
                                    <div class="col-6">
                                        <label for="inputAddress" class="form-label fw-semibold">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" name="address">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="mobno" class="form-label fw-semibold">Mobile No. </label>
                                        <input type="tel" class="form-control" id="mobno" name="mobno">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="password" class="form-label fw-semibold">Password</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="checkpass" class="form-label fw-semibold">Re-Enter Password </label>
                                        <input type="password" class="form-control" id="checkpass" name="checkpass">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="dob" class="form-label fw-semibold">Date of Birth</label>
                                        <input type="date" class="form-control" id="dob" name="dob">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="bloodgroup" class="form-label fw-semibold">Blood Group</label>
                                        <select name="bloodgroup" class="form-select form-control" id="bloodgroup">
                                            <option selected="selected">Choose option</option>
                                            <option>O+</option>
                                            <option>O-</option>
                                            <option>A+</option>
                                            <option>A-</option>
                                            <option>B+</option>
                                            <option>B-</option>
                                            <option>AB+</option>
                                            <option>AB-</option>
                                        </select>
                                    </div>
                                    <div class="container text-center my-3" style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                    </div>
                                    <div class="col-12 text-center my-3">
                                        <button type="submit" class="btn btn-danger btn-lg fw-semibold" id="sign-btn"> Register </button>
                                    </div>
                                </form>
                                <div class="text-center mb-0" id="login-btn">
                                    <p class="fw-semibold">Already have an account ?</p>
                                    <a href="patientLogin.jsp" class="text-danger text-decoration-none">Click here to Login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="static/js/patientSignup.js"></script>
    </body>
</html>
