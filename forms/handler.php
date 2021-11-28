<?php

    require_once('./functions.php');
 
$method = isset($_POST['method']) ? $_POST['method'] : '';

switch($method){
    case 'book_a_table':
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        $date = $_POST['date'];
        $time = $_POST['time'];
        $no_people = $_POST['no_people'];
        $message = $_POST['message'];
        book_a_table($name, $email, $phone, $date, $time, $no_people, $message);
        break;

    case 'display_reservation':
        display_reservation();
        break;

    case 'delete_reservation':
        $reservation_id = $_POST['reservation_id'];
        delete_reservation($reservation_id);
        break;

    case 'update_reservation':
        $id = $_POST['id']; 
        $name = $_POST['update_name'];
        $email = $_POST['update_email'];
        $phone = $_POST['update_phone'];
        $date = $_POST['update_date'];
        $time = $_POST['update_time'];
        $no_people = $_POST['update_people'];
        $message = $_POST['update_message'];
        update_reservation($id, $name, $email, $phone, $date, $time, $no_people, $message);
        break;
}

?>