<?php
include "../php/connection.php";
session_start();
if($_SESSION["id"] != "" && $_SESSION["nome"] != "" && $_SESSION["email"] != "" && $_SESSION["senha"] != "") {
    $idLogado = $_SESSION["id"];
    $nomeLogado = $_SESSION["nome"];
    $emailLogado = $_SESSION["email"];
    $senhaLogado = $_SESSION["senha"];


    if(isset($_FILES["ftPerfil"])) {
        $arquivo = $_FILES["ftPerfil"];
        $pasta = "../img/imgUsuario/";
        $nomeArquivo = "user" . $idLogado;
        $extensao = "png";

        $fez_upload = move_uploaded_file($arquivo["tmp_name"], $pasta . $nomeArquivo . "." . $extensao);
        if($fez_upload) {
            $path = $pasta . $nomeArquivo . "." . $extensao;
            $result = $connection->prepare("select caminho_img from usuario where id = :id");
            $result->execute([':id' => $idLogado]);

            $comandoTrocaFoto = $connection->prepare("update usuario set caminho_img=:caminho where id=:id");
            $comandoTrocaFoto->execute([':caminho' => $path, ':id' => $idLogado]);
        }
        $_SESSION['path'] = $path;
    }

    $media_comentarios = [];
    $soma_estrelas = 0;

    $contaString = "select * from avaliacao where id_usuario=:id";
    $sql = $connection->prepare($contaString);
    $sql->execute([':id' => $idLogado]);

    while($array = $sql->fetch(PDO::FETCH_ASSOC)) {
        $soma_estrelas = $soma_estrelas + $array['num_estrelas'];
        array_push($media_comentarios, $array['num_estrelas']);
    }

    $num_comentarios = count($media_comentarios);

    if($num_comentarios > 0) {
        $mediaAvaliacoes = $soma_estrelas / $num_comentarios;
        $mediaAvaliacoes = substr($mediaAvaliacoes, 0, 3);
    }else {
        $mediaAvaliacoes = 0;
    }


    
} else {
    $_SESSION["id"] = "";
    $_SESSION["nome"] = "";
    $_SESSION["email"] = "";
    $_SESSION["senha"] = "";
    header("location: ./login.html");
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Página do usuário | TudoFilmes</title>
    <link rel="stylesheet" href="../css/usuario.css">
    <link rel="icon" href="../img/icon.png">
</head>
<body>
    <header>
        <h1><?php echo $nomeLogado?> | TudoFilmes</a></h1>
        <a href="../index.php">Voltar ao início</a>
    </header>
    <main>
        <div id="barraLateral">
            <label for="ftPerfil"><img src="<?php 
            if(isset($_SESSION['path'])) {
                echo $_SESSION['path'];
            }else {
                echo "../img/person.png";
            }
            ?>" alt="" id="imgUsuario" title="Alterar foto de usuário">
            <img src="../img/redirect.png" alt="" id="hover" onmouseover="opacidade100()" onmouseout="opacidade0()"></label>
            <script defer>
                var hover = document.getElementById("hover");

                function opacidade100() {
                    hover.setAttribute("style", "opacity:100%;");
                }
                
                function opacidade0() {
                    hover.setAttribute("style", "opacity:0%;");
                }
            </script>
            <h1><?php echo $_SESSION['nome']?></h1>
            <form method="POST" enctype="multipart/form-data">
                <input type="file" id="ftPerfil" name="ftPerfil" accept="image/*" style="display:none"/>
                <div id="divConfirma">
                    <button type="submit" id="confirmar"><img src="../img/confirmar.png" alt=""></button>
                    <button type="button" id="cancelar" onclick="cancela()">
                        <img src="../img/cancelar.png" alt="">
                    </button>
                </div>
                <script>
                    const ftPerfil = document.getElementById("ftPerfil");
                    const divConfirma = document.getElementById("divConfirma");
                    divConfirma.setAttribute("style", "display:none");

                    ftPerfil.addEventListener('change', ()=>{
                        if(ftPerfil.validity.valid) {
                            divConfirma.setAttribute("style", "display:flex");
                        }
                    });

                    function cancela() {
                        divConfirma.setAttribute("style", "display:none");
                    }
                </script>
            </form>
        </div>
        <div id="principal">
            <h1 class="titulos">Nome de Usuário:</h1>
            <h2 class="infos" id="nomeInfo"><?php echo $_SESSION['nome']?></h2>
            <h2 class="titulos">ID:</h2>
            <h2 class="infos" id="idInfo"><?php echo $_SESSION['id']?></h2>
            <h2 class="titulos">Média de avaliações:</h2>
            <h2 class="infos" id="mediaInfo">
            <div id="estrelas">
                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e1">
                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e2">
                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e3">
                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e4">
                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e5">
            </div>
            <?php echo $mediaAvaliacoes ?> estrelas</h2>

            <div id="playlists">
                <h3>Playlists</h3>
                <form action="./mostraPlaylist.php" method="post">
                    <?php
                        $id_logado = $_SESSION['id'];
                        $stringPlaylists = "select * from playlist where id_usuario=:id";
                        $sqlPlaylists = $connection->prepare($stringPlaylists);
                        $sqlPlaylists->execute([':id' => $idLogado]);

                        while($arrayPlaylist = $sqlPlaylists->fetch(PDO::FETCH_ASSOC)) {
                            $id_playlist = $arrayPlaylist['id'];
                            $nome = $arrayPlaylist['nome'];
                            $descricao = $arrayPlaylist['descricao'];
                            
                            echo "<button type='submit' name='id_playlist' class='playlist' value='$id_playlist'>
                                <img src='../img/add-playlist.png' alt='add-playlist' width='40px'>
                                <div class='playlist-infos'>
                                    <h4>$nome</h4>
                                    <h5 style='color:rgba(173, 173, 173)'><i>$descricao</i></h5>
                                </div>
                            </button>";
                        }

                    ?>
                </form>
            </div>

            <h2 class="titulos" id="avaliacaoTitulo">Avaliações:</h2>
            <div id="avaliacoes">
                <?php

                $cont = 0;
                $contaString = "select * from avaliacao where id_usuario= :id";
                $sql = $connection->prepare($contaString);
                $sql->execute([':id' => $idLogado]);
                while($array2 = $sql->fetch(PDO::FETCH_ASSOC)) {
                    $id_filme = $array2['id_filme'];
                    $resenha = $array2['resenha'];
                    $num_estrelas = $array2['num_estrelas'];
                    $data = $array2['data'];

                    $ano = substr($data, 0, 4);
                    $mes = substr($data, 5, 2);
                    $dia = substr($data, 8, 2);

                    $hora = $array2['hora'];

                    $stringAvaliacoes = "select nomeFilme, caminho_img from filme where id= :id";
                    $sql2 = $connection->prepare($stringAvaliacoes);
                    $sql2->execute([':id' => $id_filme]);
                    $filme = $sql2->fetch(PDO::FETCH_ASSOC);

                    $nomeFilme = $filme['nomeFilme'];
                    $caminho_img = $filme['caminho_img'];

                    if($cont == 0) {
                        echo "<div class='avaliacao' id='primeiro'>";
                    }else {
                        echo "<div class='avaliacao'>";
                    }
                    $cont++;
                    echo "
                        <img src='$caminho_img' alt='' height='150px' class='img_filme'>
                        <div class='resenha'>
                            <div class='infosAvaliacao'>
                                <h2>$nomeFilme | $num_estrelas estrelas</h2>
                                <h3>$dia/$mes/$ano às $hora</h3>
                            </div>
                            <h3>$resenha</h3>
                        </div>
                    </div>";
                }
                ?>
            </div>
        </div>
    </main>
    <a href="../php/sairConta.php" id="sairBtn">Sair</a>
    <?php
    echo "<script>
        var numeroEstrelas = $mediaAvaliacoes;
        const estrela1 = document.getElementById('e1');
        const estrela2 = document.getElementById('e2');
        const estrela3 = document.getElementById('e3');
        const estrela4 = document.getElementById('e4');
        const estrela5 = document.getElementById('e5');

        if(numeroEstrelas > 4.5) {
            estrela5.setAttribute('src', '../img/imgEstrela/estrela.png');
        }else {
            if(numeroEstrelas > 4) {
                estrela5.setAttribute('src', '../img/imgEstrela/estrelaHalf.png');
            }else {
                if(numeroEstrelas > 3.5) {
                    estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                }else {
                    if(numeroEstrelas > 3) {
                        estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                        estrela4.setAttribute('src', '../img/imgEstrela/estrelaHalf.png');
                    }else {
                        if(numeroEstrelas > 2.5) {
                            estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                            estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                        }else {
                            if(numeroEstrelas > 2) {
                                estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                estrela3.setAttribute('src', '../img/imgEstrela/estrelaHalf.png');
                            }else {
                                if(numeroEstrelas > 1.5) {
                                    estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                    estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                    estrela3.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                }else {
                                    if(numeroEstrelas > 1) {
                                        estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                        estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                        estrela3.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                        estrela2.setAttribute('src', '../img/imgEstrela/estrelaHalf.png');
                                    }else {
                                        if(numeroEstrelas > 0.5) {
                                            estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                            estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                            estrela3.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                            estrela2.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                        }else {
                                            if(numeroEstrelas > 0) {
                                                estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela3.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela2.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela1.setAttribute('src', '../img/imgEstrela/estrelaHalf.png');
                                            }else {
                                                estrela5.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela4.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela3.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela2.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                                estrela1.setAttribute('src', '../img/imgEstrela/estrelaGray.png');
                                            } 
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    </script>";
    ?>
</body>
</html>