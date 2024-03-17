<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <%@include file="navbar.jsp" %>
    <body>
        <div class="container text-center">
            <img src="static/img/404Page.jpg" >
            <h4 class="display-3">Something went wrong ...</h4>
            <%--<%=exception%>--%>
            <a href="index.jsp" class="btn btn-danger btn-lg mt-2" >Home Page</a>
        </div>
    </body>
</html>
