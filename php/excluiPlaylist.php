<?php

include "./connection.php";

if(isset($_POST['id_playlist'])) {
    $id_playlist = $_POST['id_playlist'];

    $string = "delete from playlist where id= :id";
    $sql = $connection->prepare($string);
    $sql->execute([':id' => $id_playlist]);

    header("Location: ../index.php");
}

?>