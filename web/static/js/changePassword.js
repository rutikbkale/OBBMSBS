$(document).ready(function () {
    $('#changePassword').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);

        $.ajax({
            url: "../../changePassword",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)

                if (data.trim() == 'done') {
                    swal({
                        title: "Password Changed ! ",
                        type: "success",
                    }).then((value) => {
                        let userType = $('#userType').val();
                        console.log(userType);
                        if (userType === "patient")
                            window.location = "patientDashboard.jsp";
                        else
                            window.location = "donarDashboard.jsp";
                    });
                } else if (data.trim() == 'mismatch') {
                    swal({
                        title: "Wrong Password ! ",
                        text: 'Please Enter correct old password ...',
                        type: "warning",
                    }).then((value) => {
                        let userType = $('#userType').val();
                        console.log(userType);
                        $('#passwordModal').modal('show');
                    });
                } else {
                    swal({
                        title: "Error ! ",
                        text: "Please try again later.",
                        type: "error"
                    });
                    $('#exampleInputPassword1').val("");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#login-btn').show();
                $('#loader').hide();
                swal({
                    title: "Error Occurred1!",
                    text: "Please try again later.",
                    type: "error"
                })
            },
            processData: false,
            contentType: false

        });
    });
    $('#editProfile').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);

        $.ajax({
            url: "../../editProfile",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)

                if (data.trim() == 'done') {
                    swal({
                        title: "Profile Edited Successfully ! ",
                        type: "success",
                    }).then((value) => {
                        let userType = $('#userType').val();
                        console.log(userType);
                        if (userType === "patient")
                            window.location = "patientDashboard.jsp";
                        else
                            window.location = "donarDashboard.jsp";
                    });
                } else {
                    swal({
                        title: "Error ! ",
                        text: "Please try again later.",
                        type: "error"
                    });
                    $('#exampleInputPassword1').val("");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#login-btn').show();
                $('#loader').hide();
                swal({
                    title: "Error Occurred1!",
                    text: "Please try again later.",
                    type: "error"
                })
            },
            processData: false,
            contentType: false

        });
    });
});