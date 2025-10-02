<?php
session_start();
include "./connection.php";

if(isset($_POST['botao_clicado']) && isset($_POST['nome']) && isset($_POST['descricao']) && isset($_SESSION['id'])) {
    $id_filme = $_POST['botao_clicado'];
    $nome = $_POST['nome'];
    $descricao = $_POST['descricao'];
    $id = $_SESSION['id'];

    $string = "insert into playlist (nome, descricao, id_usuario, id_filmes) values ('$nome', '$descricao', $id, '$id_filme')";
    $sql = mysqli_query($connection, $string);

    header("Location: ../pgs/filme.php?botao_clicado=$id_filme");
}else {
    echo "Houve um erro";
}

?>