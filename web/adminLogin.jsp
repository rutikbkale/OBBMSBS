<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%@include file="navbar.jsp" %>
        <img src="static/img/bg.png" alt="alt" class="position-absolute w-100 h-100 "/>
        <main class="d-flex align-items-center justify-content-center" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card border-0">
                            <div class="card-header bg-red text-light text-center fs-5">
                                <i class="fas fa-user-shield fa-3x"></i>&nbsp; 
                                <p>Admin Login</p>
                            </div>
                            <div class="card-body">
                                <form action="adminLogin" method="post" id="adminForm">
                                    <div class="mb-3">
                                        <label for="username" class="form-label">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" required >
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
                                    </div>
                                    <div class="container text-center my-3" style="display: none" id="loader">
                                        <span class="fa fa-refresh fa-spin fa-3x" style="color: red"></span>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-danger" id="login-btn">Login</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="static/js/adminLogin.js"></script>
    </body>
</html>
