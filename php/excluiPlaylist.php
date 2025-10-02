<?php

include "./connection.php";

if(isset($_POST['id_playlist'])) {
    $id_playlist = $_POST['id_playlist'];

    $string = "delete from playlist where id=$id_playlist";
    $sql = mysqli_query($connection, $string);

    header("Location: ../index.php");
}

?>