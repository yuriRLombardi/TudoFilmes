<?php
include "../php/connection.php";
session_start();
if(isset($_POST["botao_clicado"])) {
    $id_clicado = $_POST["botao_clicado"];

    $comando = $connection->prepare("select * from diretor where id = :id");
    $comando->execute([':id' => $id_clicado]);
    $result = $comando->fetch(PDO::FETCH_ASSOC);
    $nome = $result['nome'];
    $biografia = $result['biografia'];
    $num_avaliacoes = 0;
    $soma_avaliacoes = 0;

    $selectFilme = $connection->prepare("select * from filme where id_diretor=:id");
    $selectFilme->execute([':id' => $id_clicado]);
    
    while($arrayEstrelas = $selectFilme->fetch(PDO::FETCH_ASSOC)) {
        $soma_avaliacoes = $soma_avaliacoes + $arrayEstrelas['media_estrelas'];
        $num_avaliacoes++;
    }
    if($num_avaliacoes == 0) {
        $media_estrelas = 0;
    }else {
        $media_estrelas = $soma_avaliacoes / $num_avaliacoes;
        $media_estrelas = substr($media_estrelas, 0, 3);
    }
}else {
    echo  "Não carregou nd.";
}


?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title><?php echo $nome?> | TudoFilmes</title>
    <link rel="stylesheet" href="../css/diretor.css">
    <link rel="icon" href="../img/icon.png">
</head>
<body>
    <header>
        <h1><?php echo $nome ?> | TudoFilmes</h1>
        <div>
            <a href="javascript:history.back()" style="height:30px"><img src="../img/seta.png" alt="" style="transform: rotate(90deg)" width="30px"></a>
            <a href="../index.php">Voltar ao início</a>
        </div>
    </header>
    <main>
        <div id="principal">
            <div id="primeira_parte">
                <div id="infos">
                    <div id="primeira_linha">
                        <h1><?php echo $nome?></h1>
                        <div id="conjunto_estrelas">
                            <div id="estrelas">
                                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e1">
                                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e2">
                                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e3">
                                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e4">
                                <img src="../img/imgEstrela/estrela.png" alt="" width="20px" id="e5">
                            </div>
                            <h3><?php echo $media_estrelas ?> estrelas</h3>
                        </div>
                    </div>
                    <p><?php echo $biografia?></p>
                </div>
            </div>
            <div id="filmes">
                <form action="./filme.php" method="post">
                <?php
                    $select = $connection->prepare("select * from filme where id_diretor= :id");
                    $select->execute([':id' => $id_clicado]);
                    while($arrayFilmes = $select->fetch()) {
                        echo "
                        <button type='submit' value='" . $arrayFilmes['id'] . "' name='botao_clicado' class='filmes'>
                                <img src='" . $arrayFilmes['caminho_img'] . "' alt=''>
                                <div><h3>" . $arrayFilmes['nomeFilme'] . "</h3></div>
                        </button>";
                    }

                ?>
                </form>
            </div>
    </main>
    <footer>
        &copy; TudoFilmes tem todos seus direitos reservados a seus criadores | Hiran, Kevin, Yago e Yuri
    </footer>
    <?php
    echo "<script>
        var numeroEstrelas = $media_estrelas;
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