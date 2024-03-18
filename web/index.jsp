<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="navbar.jsp" %>
    <head>
        <style>
            .hero-section {
                height: 100vh;
                display: flex;
                align-items: center;
                text-align: center;
                color: #fef;
            }

            .hero-section h1 {
                font-size: 3.5rem;
                margin-bottom: 20px;
            }

            .hero-section p {
                font-size: 1.5rem;
                margin-bottom: 30px;
            }

            .btn-danger {
                font-size: 1.2rem;
                padding: 12px 24px;
            }
        </style>
    </head>
    <body>
        <section class="hero-section position-absolute">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 offset-md-2">
                        <h1>Welcome to Online Blood Bank Management System</h1>
                        <p>A platform to connect blood donors with recipients. Register now to donate blood or request blood.</p>
                        <a href="donarSignup.jsp" class="btn btn-danger rounded-pill">Get Started</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
