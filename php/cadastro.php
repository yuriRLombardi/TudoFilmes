<html>
<head>
<link rel="stylesheet" href="../css/cadastro.css">
<title>Cadastro | TudoFilmes</title>
    <link rel="icon" href="../img/icon.png">
</head>
    <body>
            <?php
            include "connection.php";

            if(isset($_POST["nome"]) && isset($_POST["email"]) && isset($_POST["senha"]) && isset($_POST["confSenha"]) && isset($_POST["dataNasc"]) && $_POST["senha"] == $_POST["confSenha"] ) {
                $nome = $_POST["nome"];
                $email = $_POST["email"];
                $senha = $_POST["senha"];
                $dataNasc = $_POST["dataNasc"];

                $dataNascConv = date('Y-m-d', strtotime(str_replace('/', '-', $dataNasc)));

                $comando = "insert into usuario (nome, email, senha, dataNasc) values ('$nome', '$email', '$senha', '$dataNascConv')";
                $comando2 = mysqli_query($connection, "select * from usuario");
                $valido = true;
                
                while($array = mysqli_fetch_array($comando2)) {
                    if($email == $array['email']) {
                        $valido = false;
                        break;
                    }
                }

                if($valido == true) {
                    mysqli_query($connection, $comando);

                    echo "<script>
                        localStorage.setItem('user', '$nome');

                        alert('Cadastro realizado com sucesso, redirecionando para a página inicial do site.');
                        window.location = '../index.php';
                    </script>";
                }else {
                    echo "<script defer>
                    alert('E-mail Inserido já foi cadastrado. Por favor, insira um e-mail diferente');
                    window.location = '../pgs/cadastro.html';
                    </script>";
                }
            }else {
                echo "<script defer>
                alert('Campos não foram preenchidos corretamente, redirecionando para a página anterior para correção.');
                window.location = '../pgs/cadastro.html';
                </script>";
            }
            
            $array = mysqli_fetch_array(mysqli_query($connection,'select * from usuario where email = "' . $email . '";'));

            session_start();
            $_SESSION['id'] = $array['id'];
            $_SESSION['nome'] = $array['nome'];
            $_SESSION['email'] = $array['email'];
            $_SESSION['senha'] = $array['senha'];
            $_SESSION['path'] = $array['caminho_img'];
            ?>
    </body>
</html>