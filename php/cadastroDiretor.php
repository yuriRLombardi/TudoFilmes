<?php
include "connection.php";

if(isset($_POST['nome']) && isset($_POST['bio'])) {
    $nome = $_POST['nome'];
    $bio = $_POST['bio'];

    $string = "insert into diretor (nome, biografia) values (:nome, :bio)";
    $sql = $connection->prepare($string);
    $sql->execute([':nome' => $nome, ':bio' => $bio]);

    header("Location: ../index.php");
}

?>