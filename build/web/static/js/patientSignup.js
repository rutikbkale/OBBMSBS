$(document).ready(function () {
    console.log("loaded...")
    $('#patientForm').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        $('#login-btn').hide();
        $('#sign-btn').hide();
        $('#loader').show();

        $.ajax({
            url: "patientSignup",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)
                $('#login-btn').show();
                $('#sign-btn').show();
                $('#loader').hide();
                if (data.trim() === 'done') {
                    swal({
                        title: "Successfully Register !",
                        icon: "success",
                    }).then((value) => {
                        window.location = "patientLogin.jsp";
                    });
                } else {
                    swal({
                        title: "Error Occurred!",
                        text: "Please try again later.",
                        icon: "error"
                    });

                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR)
                $('#login-btn').show();
                $('#sign-btn').show();
                $('#loader').hide();
                    swal({
                        title: "Error Occurred!",
                        text: "Please try again later.",
                        icon: "error"
                    });
            },
            processData: false,
            contentType: false

        });
    });
});

