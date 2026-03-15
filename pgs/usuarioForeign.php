<?php
include "../php/connection.php";
session_start();
if(isset($_POST["id_clicado"])) {
    $id_clicado = $_POST['id_clicado'];
    $stringUsuario = "select * from usuario where id= :id";
    $pegaUsuario = $connection->prepare($stringUsuario);
    $pegaUsuario->execute(['id' => $id_clicado]);

    $array = $pegaUsuario->fetch(PDO::FETCH_ASSOC);

    $nomeClicado = $array["nome"];
    $emailClicado = $array["email"];
    $senhaClicado = $array["senha"];
    $caminho_img = $array["caminho_img"];

    $media_comentarios = [];
    $soma_estrelas = 0;

    $contaString = "select * from avaliacao where id_usuario= :id";
    $sql = $connection->prepare($contaString);
    $sql->execute(['id' => $id_clicado]);

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
        <h1><?php echo $nomeClicado?> | TudoFilmes</a></h1>
        <a href="../index.php">Voltar ao início</a>
    </header>
    <main>
        <div id="barraLateral">
            <img src="<?php 
            if(isset($caminho_img)) {
                echo $caminho_img;
            }else {
                echo "../img/person.png";
            }
            ?>" alt="" id="imgUsuario">
            <h1><?php echo $nomeClicado?></h1>
        </div>
        <div id="principal">
            <h1 class="titulos">Nome de Usuário:</h1>
            <h2 class="infos" id="nomeInfo"><?php echo $nomeClicado?></h2>
            <h2 class="titulos">ID:</h2>
            <h2 class="infos" id="idInfo"><?php echo $id_clicado?></h2>
            <h2 class="titulos">Média de avaliações:</h2>
            <h2 class="infos" id="mediaInfo">
                <div id="estrelas">
                    <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e1">
                    <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e2">
                    <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e3">
                    <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e4">
                    <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e5">
                </div>
                <?php echo $mediaAvaliacoes?> estrelas</h2>
            <h2 class="titulos" id="avaliacaoTitulo">Avaliações:</h2>
            

            <div id="avaliacoes">
                <?php

                $cont = 0;
                $contaString = "select * from avaliacao where id_usuario= :id";
                $sql = $connection->prepare($contaString);
                $sql->execute(['id' => $id_clicado]);
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
                    $sql2->execute(['id' => $id_filme]);
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