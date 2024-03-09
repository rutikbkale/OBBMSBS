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
        <%@include file="adminBase.jsp" %>
        <div class="container" style="margin-left: 210px; margin-top: 75px;">
            <H4 class="text-center" style="margin-top: 6rem;">PATIENT DETAILS</H4><br>
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Profile</th>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Age</th>
                        <th scope="col">Disease</th>
                        <th scope="col">Mobile</th>
                        <th class="text-right">Action</th>
                    </tr>
                </thead>
                <!--                <tbody>
                                    {% for t in patients %}
                                    <tr>
                                        <td> {{t.get_name}}</td>
                                        <td> <img src="{% static t.profile_pic.url %}" alt="Profile Pic" height="40px" width="40px" /></td>
                                        <td>{{t.bloodgroup}}</td>
                                        <td>{{t.age}}</td>
                                        <td>{{t.disease}}</td>
                                        <td>{{t.mobile}}</td>
                
                                        <td class="text-right">
                                            <button class="btn btn-primary badge-pill" style="width: 80px;"><a  style="text-decoration: none;color: white;" href="{% url 'update-patient' t.id  %}">EDIT</a> </button>
                                            <button class="btn btn-danger badge-pill" style="width: 80px;"><a  style="text-decoration: none;color: white;" href="{% url 'delete-patient' t.id  %}">DELETE</a> </button>
                                        </td>
                                    </tr>
                                    {% endfor %}
                
                                </tbody>-->

            </table>
        </div>
    </body>
</html>
