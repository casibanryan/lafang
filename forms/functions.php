<?php
  
  $con = new mysqli("localhost","root","","lafang");

  function book_a_table($name, $email, $phone, $date, $time, $no_people, $message) {
    global $con;
    $query = 'call reserved_book(?, ?, ?, ?, ?, ?, ?)';
    $sql = $con->prepare($query);
    $sql->bind_param('ssissis', $name, $email, $phone, $date, $time, $no_people, $message);
    $sql->execute();
    $con->close();
    $sql->close();
  }

  function display_reservation() {
    global $con;
    $query = 'call show_reserved()';
    $sql = $con->prepare($query);
    $sql->execute();

    $result = $sql->get_result();
        if($result)
        {
            $data = array();
            while($r = $result->fetch_array())
            {
                $data[] = $r;
            }
            echo json_encode($data);
        }
        else
        {
            echo json_encode(mysqli_error($con));
        }

    $con->close();
    $sql->close();
  }


  function delete_reservation($id) {
    global $con;
    $query = "DELETE FROM reserved WHERE reserved_id = ?";
    $stmt = $con->prepare($query);
    $stmt -> bind_param('i', $id);
    if($stmt->execute()) {
      echo 1;
    } 
    else {
      echo 0;
    }
    $con->close();
    $stmt->close();
  }


  function update_reservation($id, $name, $email, $phone, $date, $time, $no_people, $message) {
    global $con;
    $query = "call update_reserved(?,?,?,?,?,?,?,?)";
    $stmt = $con->prepare($query);
    $stmt->bind_param('ississis',$id, $name, $email, $phone, $date, $time, $no_people, $message);
    if($stmt->execute()) {
        echo 1;
    }
    else {
        echo 0;
    }

    $con->close();
    $stmt->close();
  }

?>
