<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | TudoFilmes</title>
    <link rel="icon" href="../img/icon.png">
</head>

<?php
include "connection.php";

if(isset($_POST["email"]) && isset($_POST["senha"])){
    $email = $_POST["email"];
    $senha = $_POST["senha"];
    $valido = false;

    $comando = mysqli_query($connection, "select * from usuario");

    while($array = mysqli_fetch_array($comando)) {
        if($email == $array['email'] && $senha == $array['senha']) {
            $valido = true;
            break;
        }
    }
    
    if($valido == true) {
        $array = mysqli_fetch_array(mysqli_query($connection,'select * from usuario where email = "' . $email . '";'));

        session_start();
        $_SESSION['id'] = $array['id'];
        $_SESSION['nome'] = $array['nome'];
        $_SESSION['email'] = $array['email'];
        $_SESSION['senha'] = $array['senha'];
        $_SESSION['path'] = $array['caminho_img'];

        $nome = $array['nome'];
        echo "<script>
            localStorage.setItem('user', '$nome');

            alert('Login realizado com sucesso, redirecionando para a página inicial do site.');
            window.location = '../index.php';
        </script>";
    }else {
        echo "<script defer>
        alert('E-mail ou senha incorretos. Por favor, preencha os campos corretamente.');
        window.location = '../pgs/login.html';
        </script>";
    }
}


?>