$(document).ready(function(){
    display_reservation();
});

function book_a_table(name, email, phone, date, time, no_people, message) {
    var empty = true;
    // check if the user input is empty and if it is empty dont save it
    if(name != "" && email != "" && phone != "" && date != "" && time != "" && no_people != "" && message != "") {
        empty = false;
    }
    if(no_people > 150) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
            footer: 'only 150 people are allowed in the restaurant. Please try again!'
          })
        empty = true;
    }

    if(!empty) {
        var data = new FormData();
        data.append('method', 'book_a_table');
        data.append('name', name);
        data.append('email', email);
        data.append('phone', phone);
        data.append('date', date);
        data.append('time', time);
        data.append('no_people', no_people);
        data.append('message', message);
        axios.post('forms/handler.php', data)
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'reservation has been sent sucessfully!',
            showConfirmButton: false,
            timer: 1500
          })
    }
}

$("#reserved").click(function() {
    var name = $('#name').val();
    var email = $('#email').val();
    var phone = $('#phone').val()
    var date = $('#date').val();
    var time = $('#time').val();
    var no_people = $('#people').val();
    var message = $('#message').val();
    book_a_table(name, email, phone, date, time, no_people, message);
})


function display_reservation() {
    var data = new FormData();
    data.append('method', 'display_reservation');
    axios.post('forms/handler.php', data)
    .then(function(r) {
        if(r.data.length > 0) {
            var buffer = '';
            var notification = '';
            var count = 0;
            var capacity = 0;
            var total_customers = 0;
            $.each(r.data, function(index, value) {
                count++;
                capacity += value.no_people
                buffer += '<div class="mt-3 card card-stats">';
                buffer += '<div class="card-body ">';
                buffer += '<div class="row">';
                buffer += '<div class="col-8 col-md-8">';
                buffer += '<div><p><b>' + value.name +'</b></p>';
                buffer += '<p>' + value.email + '</p>';
                buffer += '<p>#' + value.phone + '</p>';
                buffer += '<p>' + value.message + '</p>';
                buffer += '</div></div>';
                buffer += '<div class="col-4 col-md-4">';
                buffer += '<div class="numbers">';
                buffer += '<p class="card-category mb-2 mr-2">' + value.date + '</p>';
                buffer += '<p class="card-category mb-2 mr-2">' + value.time + ' PM </p>';
                buffer += '<p class="card-category mr-2">' + value.no_people + ' People </p>';
                buffer += '<div class="card-category"><button class="btn btn-primary btn-round" style="margin-bottom: 0px;" data-toggle="modal" data-target="#updateModal" onclick="on_edit(' + value.reserved_id +')"';
                buffer += '<i class="fas fa-edit mr-2"></i>Update</button></div>';
                buffer += '<div class="card-category"><button class="btn btn-danger btn-round" onclick="delete_reservation(' + value.reserved_id + ')"><i class="fas fa-trash-alt mr-2"></i>delete</button>';
                buffer += '</div></div></div></div></div></div>';
                notification += '<a class="dropdown-item" href="dashboard.php">' + value.name + ' made a reservation..</a>';

                total_customers = value.reserved_id;
            })
            
            $('#show-reservation').html(buffer);
            $('#count-reserved').html(count);
            $('#capacity').html(150-capacity);
            $('#customers').html(total_customers);
            $('#cancel').html(total_customers-count);
            $('#notification').html(notification);
        }
    })
    .catch(function(error) {
        console.log(error);
    })
}



function delete_reservation(index) { 
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
        if (result.isConfirmed) {
            var data = new FormData();
            data.append("method", 'delete_reservation');
            data.append("reservation_id", index);
            axios.post('forms/handler.php', data)
            .then(function(response) {
            if(response.data == 1) {
                display_reservation();
            }
        })
    }
    })
}


var ID = null;
function on_edit(id) {
    ID = id;
}

function update_reservation() {
    var update_name = $('#update_name').val();
    var update_email = $('#update_email').val()
    var update_phone = $('#update_phone').val()
    var update_date = $('#update_date').val()
    var update_time = $('#update_time').val()
    var update_people = $('#update_people').val()
    var update_message = $('#update_message').val()
    
    var data = new FormData();
    data.append("method", 'update_reservation');
    data.append('id', ID);
    data.append('update_name', update_name);
    data.append('update_email', update_email);
    data.append('update_phone', update_phone);
    data.append('update_date', update_date);
    data.append('update_time', update_time);
    data.append('update_people', update_people);
    data.append('update_message', update_message);
    axios.post('forms/handler.php', data)
    .then(function(r) {
        if(r.data == 1) {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Sucessfully updated!',
                showConfirmButton: false,
                timer: 1300
              })
            display_reservation();
        }
    })

}


$('#update').click(function() {
    update_reservation();
    
})

function contact_us(event) {
    var data = new FormData(event.target);
    data.append('method', 'contact_us');
    axios.post('forms/handler.php', data)
    .then(function(r) {
        console.log(r.data);
    })
}