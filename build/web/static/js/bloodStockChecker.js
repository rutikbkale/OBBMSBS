$(document).ready(function () {
    $('#approvalForm').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        $.ajax({
            url: "../../bloodRequestStatus",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)

                if (data.trim() == 'reject') {
                    swal({
                        title: "Invalid Stock ! ",
                        text: "Requested type of blood not available at this time .",
                        type: "error",
                    }).then((value) => {
                        window.location = "adminDashboard.jsp";
                    });
                }
                else if (data.trim() == 'success') {
                    swal({
                        title: "Request Approved !",
                        type: "success",
                    }).then((value) => {
                        window.location = "adminDashboard.jsp";
                    });
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#login-btn').show();
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