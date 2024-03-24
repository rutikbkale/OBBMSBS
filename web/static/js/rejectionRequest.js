function rejectRequest(id) {
    swal({
        title: 'Enter reason for rejection:',
        input: 'text',
        showCancelButton: true,
        confirmButtonText: 'Reject',
        cancelButtonText: 'Cancel',
        inputValidator: function (value) {
            return new Promise(function (resolve, reject) {
                if (!value) {
                    reject('You need to enter a reason!');
                } else {
                    resolve();
                }
            });
        }
    }).then((result) => {
        if (result.value) {
            var rejectionForm = document.getElementById("rejectionForm" + id);
            var reasonInput = document.createElement("input");
            reasonInput.setAttribute("type", "hidden");
            reasonInput.setAttribute("name", "rejectionReason");
            reasonInput.setAttribute("value", result.value);
            rejectionForm.appendChild(reasonInput);
            rejectionForm.submit();
            swal({
                title: "Request Rejected ! ",
                type: "success",
            }).then((value) => {
                window.location = "adminDashboard.jsp";
            })
        }
    });
}