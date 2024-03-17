<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="navbar.jsp" %>
    <body>
        <img src="static/img/bg.png" alt="alt" class="position-absolute w-100 h-100"/>
        <main class="d-flex align-items-center" style="height:100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card border-0">
                            <div class="card-header bg-red text-light text-center fs-5">
                                <i class="fas fa-procedures fa-3x"></i>&nbsp; 
                                <p>Patient Signup</p>
                            </div>
                            <div class="card-body">
                                <form class="row g-3" action="patientSignup" method="post" id="patientForm">
                                    <div class="col-md-6">
                                        <label for="fName" class="form-label">First Name</label>
                                        <input type="text" class="form-control" id="fName" name="fName">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lName" class="form-label">Last Name</label>
                                        <input type="text" class="form-control" id="lName" name="lName">
                                    </div>
                                    <div class="col-12">
                                        <label for="inputAddress" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" name="address">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="dob" class="form-label">Date of Birth</label>
                                        <input type="date" class="form-control" id="dob" name="dob">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputState" class="form-label">Blood Group</label>
                                        <select name="bloodgroup" class="form-select form-control">
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
                                    <div class="col-md-6">
                                        <label for="mobno" class="form-label">Mobile No. </label>
                                        <input type="tel" class="form-control" id="mobno" name="mobno">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                    <div class="container text-center my-3" style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                    </div>
                                    <div class="col-12 text-center my-3">
                                        <button type="submit" class="btn btn-danger btn-lg" id="sign-btn"> Register </button>
                                    </div>
                                </form>
                                <div class="text-center mb-0" id="login-btn">
                                    <p>Already have an account ?
                                        <a href="patientLogin.jsp" class="text-danger text-decoration-none">Click here to Login</a>
                                    </p>
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
