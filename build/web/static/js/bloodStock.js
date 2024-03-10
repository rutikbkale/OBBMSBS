$(document).ready(function () {
    $('#myForm').on('submit', function (event) {
        event.preventDefault();
        let form = new FormData(this);
        $('#updateBtn').hide();
        $('#loader').show();

        $.ajax({
            url: "../../bloodStockUpdater",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)
                $('#updateBtn').show();
                $('#loader').hide();

                if (data.trim() == 'done') {
                    swal({
                        title: "Stock added Successfully ! ",
                        icon: "success",
                    }).then((value) => {
                        window.location = "adminBloodStock.jsp";
                    });
                } else {
                    swal({
                        title: "Login Failed ! ",
                        text: "Please try again later.",
                        icon: "error"
                    });
                    $('#exampleInputPassword1').val("");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#updateBtn').show();
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