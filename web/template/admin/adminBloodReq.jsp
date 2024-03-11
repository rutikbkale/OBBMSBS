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
            <!--{% if requests %}-->
            <H4 class="text-center" style="margin-top: 6rem;">BLOOD REQUIREMENT REQUESTS</H4><br>
            <!--{% if message %}-->
            <h5 class="text-center d-block" style="color: red;"><!-- {{message}}--></h5>
            <!--{% else %}-->

            <!--{% endif %}-->
            <table class="table table-hover table-bordered table-striped">
                <thead class="bg-info t-white">
                    <tr>
                        <th scope="col">Patient Name</th>
                        <th scope="col">Age</th>
                        <th scope="col">Reason</th>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Unit (in ml)</th>
                        <th scope="col">Date</th>
                        <th scope="col">Status</th>
                        <th class="text-right">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!--                    {% for t in requests %}
                                        <tr>
                                            <td> {{t.patient_name}}</td>
                                            <td>{{t.patient_age}}</td>
                    
                    
                                            <td>{{t.reason}}</td>
                                            <td>{{t.bloodgroup}}</td>
                                            <td>{{t.unit}}</td>
                                            <td>{{t.date}}</td>
                                            <td>{{t.status}}</td>
                    
                    
                                            <td class="text-right">
                    
                                                <button class="btn btn-primary badge-pill" style="width: 100px;"><a  style="text-decoration: none;color: white;" href="{% url 'update-approve-status' t.id  %}">Approve</a> </button>
                                                <button class="btn btn-danger badge-pill" style="width: 80px;"><a  style="text-decoration: none;color: white;" href="{% url 'update-reject-status' t.id  %}">Reject</a> </button>
                    
                                            </td>
                                        </tr>
                                        {% endfor %}
                    
                                    </tbody>-->

            </table>
            <!--            {% else %}
                        <h5>No Blood Request By Patient / Donor !</h5>
                        {% endif %}-->

        </div>
    </body>
</html>
