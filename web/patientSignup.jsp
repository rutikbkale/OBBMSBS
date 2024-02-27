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
        <link href="static/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%@include file="navbar.html" %>
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
                                <!--                                <form action="patientSignup" method="post" id="patientForm">
                                                                    <div class="mb-1">
                                                                        <label for="fName" class="form-label">First Name</label>
                                                                        <input type="text" class="form-control" id="fName" name="fName">
                                                                    </div>
                                                                    <div class="mb-1">
                                                                        <label for="lName" class="form-label">Last Name</label>
                                                                        <input type="text" class="form-control" id="lName" name="lName">
                                                                    </div>
                                                                    <div class="mb-1">
                                                                        <label for="username" class="form-label">UserName</label>
                                                                        <input type="text" class="form-control" id="username" name="username">
                                                                    </div>
                                                                    <div class="mb-1">
                                                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                                                    </div>
                                                                    <div class="mb-1">
                                                                        <label for="mobno" class="form-label">Mobile No</label>
                                                                        <input type="tel" class="form-control" id="mobno" name="mobno">
                                                                    </div>
                                                                    <div class="form-row">
                                                                        <div class="name">Blood Group</div>
                                                                        <div class="value">
                                                                            <div class="input-group">
                                                                                <div class="rs-select2 js-select-simple select--no-search">
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
                                                                                    <div class="select-dropdown"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="container text-center" style="display: none" id="loader">
                                                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                                                    </div>
                                                                    <div class="text-center" id="sign-btn">
                                                                        <button type="submit" class="btn btn-danger">Signup</button>
                                                                    </div>
                                                                </form>-->
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
                                        <button type="submit" class="btn btn-danger btn-lg " id="sign-btn"> Register </button>
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

        <%@include file="footer.html" %>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="static/js/patient.js"></script>
    </body>
</html>
