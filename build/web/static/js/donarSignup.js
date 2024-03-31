$(document).ready(function () {
    function validateForm() {
        var fName = $('#fName').val();
        var lName = $('#lName').val();
        var address = $('#inputAddress').val();
        var mobno = $('#mobno').val();
        var dob = $('#dob').val();
        var bloodgroup = $('#bloodgroup').val();
        var password = $('#password').val();
        var checkpass = $('#checkpass').val();

        var fieldNames = ["First Name", "Last Name", "Address", "Mobile No.", "Password", "Re-Enter Password"];
        var arrFields = [fName, lName, address, mobno, password, checkpass];

        for (var i = 0; i < arrFields.length; i++) {
            if (isEmpty(arrFields[i])) {
                showError("Please enter your " + fieldNames[i]);
                if (fieldNames[i] === "Mobile No.") {
                    var mobnoPattern = /^\d{10}$/;
                    if (!mobnoPattern.test(mobno)) {
                        showError("Please enter a valid 10-digit mobile number");
                        $('#mobno').focus();
                        return false;
                    }
                }
                return false;
            }
        }

        // Validate password match
        if (password !== checkpass) {
            showError('Passwords do not match.');
            return false;
        }

        // Validate Date of Birth
        if (!dob) {
            showError("Please select Date of Birth");
            return false;
        }

        // Validate Blood Group
        if (bloodgroup === "Choose option") {
            showError("Please select Blood Group");
            return false;
        }
        return true;
    }
    
    //Showing error massage
    function showError(errorMessage) {
        swal({
            title: "Validation Error!",
            text: errorMessage,
            icon: "error"
        });
    }

    // Cheacking for empty fields
    function isEmpty(field) {
        return !field.trim();
    }

    $('#donarForm').on('submit', function (event) {
        event.preventDefault();
        if (validateForm()) {
            let form = new FormData(this);
            $('#login-btn').hide();
            $('#sign-btn').hide();
            $('#loader').show();
            $.ajax({
                url: "donarSignup",
                type: 'POST',
                data: form,
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $('#login-btn').show();
                    $('#sign-btn').show();
                    $('#loader').hide();
                    if (data.trim() === 'done') {
                        swal({
                            title: "Successfully Registered!",
                            icon: "success"
                        }).then((value) => {
                            window.location = "donarLogin.jsp";
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
        }
    });
});
