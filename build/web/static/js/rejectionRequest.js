function rejectRequest(id) {
    var rejectionForm = document.getElementById("rejectionForm" + id);
    var reason = prompt("Enter reason for rejection:");
    if (reason !== null) {
        var reasonInput = document.createElement("input");
        reasonInput.setAttribute("type", "hidden");
        reasonInput.setAttribute("name", "rejectionReason");
        reasonInput.setAttribute("value", reason);
        rejectionForm.appendChild(reasonInput);
        rejectionForm.submit();
        alert("Request Rejected...")
    }
}
        