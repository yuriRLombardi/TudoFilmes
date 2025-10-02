<?php
include "connection.php";

if(isset($_POST['nome']) && isset($_POST['bio'])) {
    $nome = $_POST['nome'];
    $bio = $_POST['bio'];

    $string = "insert into diretor (nome, biografia) values ('$nome', '$bio')";
    $sql = mysqli_query($connection, $string);

    header("Location: ../index.php");
}

?>