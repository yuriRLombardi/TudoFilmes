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

                $comando2 = $connection->prepare("select * from usuario");
                $comando2->execute();
                $valido = true;
                
                while($array = $comando2->fetch(PDO::FETCH_ASSOC)) {
                    if($email == $array['email']) {
                        $valido = false;
                        break;
                    }
                }

                if($valido == true) {
                    $string = "insert into usuario (nome, email, senha, dataNasc) values (:nome, :email, :senha, :dataNasc)";
                    $comando = $connection->prepare($string);
                    $comando->execute([':nome' => $nome, ':email' => $email, ':senha' => $senha, ':dataNasc' => $dataNascConv]);

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
            
            $sqlSession = $connection->prepare('select * from usuario where email = :email;');
            $sqlSession->execute([':email' => $email]);
            $array = $sqlSession->fetch(PDO::FETCH_ASSOC);
            $id = $array['id'];

            session_start();
            $_SESSION['id'] = $id;
            $_SESSION['nome'] = $array['nome'];
            $_SESSION['email'] = $array['email'];
            $_SESSION['senha'] = $array['senha'];
            $_SESSION['path'] = $array['caminho_img'];
            $dataNasc = substr($array['dataNasc'], 0, 4);

            $_SESSION['dataNasc'] = $dataNasc;
            
            $stringCriaPlaylist = "insert into playlist (nome, descricao, id_usuario) values ('Assistidos', 'Filmes já assistidos', :id_usuario)";
            $stringCriaPlaylist2 = "insert into playlist (nome, descricao, id_usuario) values ('Favoritos', 'Filmes favoritos', :id_usuario)";
            $comandoCriaPlaylist = $connection->prepare($stringCriaPlaylist);
            $comandoCriaPlaylist2 = $connection->prepare($stringCriaPlaylist2);
            $comandoCriaPlaylist->execute([':id_usuario' => $id]);
            $comandoCriaPlaylist2->execute([':id_usuario' => $id]);
            ?>
    </body>
</html>