<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="navbar.jsp" %>
    <body>
        <main class="d-flex align-items-center justify-content-center" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card border-0">
                            <div class="card-header bg-red text-light text-center fs-5">
                                <i class="fas fa-user fa-3x"></i>&nbsp; 
                                <p class="fw-bold">Donar Login</p>
                            </div>
                            <div class="card-body">
                                <form action="donarLogin" method="post" id="donarForm">
                                    <div class="mb-3">
                                        <label for="mobno" class="form-label fw-semibold">Mobile No</label>
                                        <input type="tel" class="form-control" id="mobno" name="mobno" required="required">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label fw-semibold">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" required="required">
                                    </div>
                                    <div class="container text-center my-3" style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                    </div>
                                    <div class="text-center" id="login-btn">
                                        <button type="submit" class="btn btn-danger fw-bold">Login</button>
                                    </div>
                                </form>
                                <br>
                                <div class="text-center" id="sign-btn">
                                    <p class="fw-semibold">Does not have an account ? </p>
                                    <p> <a href="donarSignup.jsp" class="text-danger text-decoration-none">Click here to register</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="static/js/donarlogin.js"></script>
    </body>
</html>
