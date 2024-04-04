$(document).ready(function () {
    $('#patientForm').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        $('#login-btn').hide();
        $('#sign-btn').hide();
        $('#loader').show();

        $.ajax({
            url: "patientLogin",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)
                $('#login-btn').show();
                $('#sign-btn').show();
                $('#loader').hide();

                if (data.trim() == 'done') {
                    swal({
                        title: " Login Successfully ! ",
                        icon: "success",
                    }).then((value) => {
                        window.location = "template/patient/patientDashboard.jsp";
                    });
                } else {
                    swal({
                        title: "Login Failed",
                        text: "Please enter valid mobile no and password ! ",
                        icon: "error"
                    });
                    $('#exampleInputPassword1').val("");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#login-btn').show();
                $('#sign-btn').show();
                $('#loader').hide();
                swal({
                    title: "Error Occurred1!",
                    text: "Please try again later.",
                    icon: "error"
                }).then((value) => {
                    window.location = "errorPage.jsp"
                });
            },
            processData: false,
            contentType: false

        });
    });
});