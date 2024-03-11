$(document).ready(function () {
    $('#donarForm').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        $('#sign-btn').hide();
        $('#loader').show();
        $.ajax({
            url: "../../donarBloodDonation",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                $('#sign-btn').show();
                $('#loader').hide();
                if (data.trim() === 'done') {
                    swal({
                        title: "Request sent Successfully!",
                        icon: "success"
                    }).then((value) => {
                        window.location = "donarDashboard.jsp";
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
