function logout(fileName) {
    swal({
        title: 'Log out?',
        text: 'Are you sure you want to log out?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Log Out',
    }).then((result) => {
        if (result.value === true) {
            window.location.href = '../../' + fileName + '.jsp';
        }
    });
}