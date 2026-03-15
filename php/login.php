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

    $comando = $connection->prepare("select * from usuario");
    $comando->execute();

    while($array = $comando->fetch(PDO::FETCH_ASSOC)) {
        if($email == $array['email'] && $senha == $array['senha']) {
            $valido = true;
            break;
        }
    }
    
    if($valido == true) {
        $sql = $connection->prepare('select * from usuario where email = :email;');
        $sql->execute([':email' => $email]);
        $array = $sql->fetch(PDO::FETCH_ASSOC);

        session_start();
        $_SESSION['id'] = $array['id'];
        $_SESSION['nome'] = $array['nome'];
        $_SESSION['email'] = $array['email'];
        $_SESSION['senha'] = $array['senha'];
        $_SESSION['path'] = $array['caminho_img'];
        $dataNasc = substr($array['dataNasc'], 0, 4);

        $_SESSION['dataNasc'] = $dataNasc;

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