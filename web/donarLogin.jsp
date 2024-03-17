<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navbar.jsp" %>
        <img src="static/img/bg.png" alt="alt" class="position-absolute w-100 h-100"/>
        <main class="d-flex align-items-center justify-content-center" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card border-0">
                            <div class="card-header bg-red text-light text-center fs-5">
                                <i class="fas fa-user fa-3x"></i>&nbsp; 
                                <p>Donar Login</p>
                            </div>
                            <div class="card-body">
                                <form action="donarLogin" method="post" id="donarForm">
                                    <div class="mb-3">
                                        <label for="mobno" class="form-label">Mobile No</label>
                                        <input type="tel" class="form-control" id="mobno" name="mobno">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                    </div>
                                    <div class="container text-center my-3" style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                    </div>
                                    <div class="text-center" id="login-btn">
                                        <button type="submit" class="btn btn-danger">Login</button>
                                    </div>
                                </form>
                                <br>
                                <div class="text-center" id="sign-btn">
                                    <p>Does not have an account ? 
                                        <a href="donarSignup.jsp" class="text-danger text-decoration-none">Click here to register</a>
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
