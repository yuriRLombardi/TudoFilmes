<?php
include "../php/connection.php";
session_start();
if(isset($_POST["botao_clicado"]) || isset($_GET['botao_clicado'])) {
    if(isset($_POST['botao_clicado']) && !isset($_GET['botao_clicado'])) {
        $id_clicado = $_POST["botao_clicado"];
    }else {
        $id_clicado = $_GET["botao_clicado"];
    }

    if(isset($_POST["resenha"]) && isset($_POST["estrelas"])) {
        $resenha = $_POST["resenha"];
        $estrelas = $_POST["estrelas"];

        if(isset($_SESSION["id"])) {
            $id_usuario = $_SESSION["id"];

        
            $agora = new DateTime();
            $data = $agora->format('Y-m-d');
            $hora = $agora->format('H:i');

            $string = "insert into avaliacao(num_estrelas, id_usuario, resenha, id_filme, data, hora) values ($estrelas, $id_usuario, '$resenha', $id_clicado, '$data', '$hora')";
            $comando = mysqli_query($connection, $string);

            $pegaEstrelas = "select num_estrelas from avaliacao where id_filme=$id_clicado";
            $query = mysqli_query($connection, $pegaEstrelas);

            if(mysqli_num_rows($query) != 0) {
                $numAvaliacoes = 0;
                $somaAvaliacoes = 0;
                while($arrayEstrelas = mysqli_fetch_array($query)) {
                    $numAvaliacoes++;
                    $somaAvaliacoes = $somaAvaliacoes + $arrayEstrelas['num_estrelas'];
                }

                $avaliacoes = $somaAvaliacoes / $numAvaliacoes;
                $avaliacoes = substr($avaliacoes, 0, 3);
                $insereEstrelas = "update filme set media_estrelas=$avaliacoes where id=$id_clicado";
                $query = mysqli_query($connection, $insereEstrelas);
            }
        }
        
    }

    $comando = mysqli_query($connection, "select * from filme where id = $id_clicado");
    $result = mysqli_fetch_array($comando);
    $nome = $result['nomeFilme'];
    $media_estrelas = $result['media_estrelas'];
    $genero = $result['genero'];
    $duracao = $result['duracao'];
    $sinopse = $result['sinopse'];
    $caminho = $result['caminho_img'];
    $link = $result['link_trailer'];
    $streamings = $result['streamings'];
    $streamArray = explode(", ", $streamings);
    $ano = $result['ano_publicacao'];
    
    $generoArray = explode(", ", $genero);
    $generoPesquisa1 = $generoArray[0];
    $generoPesquisa2 = $generoArray[1];
    $generoPesquisa3 = $generoArray[2];
    $comandoGenero1 = mysqli_fetch_array(mysqli_query($connection, "select genero from genero where id = $generoPesquisa1"));
    $comandoGenero2 = mysqli_fetch_array(mysqli_query($connection, "select genero from genero where id = $generoPesquisa2"));
    $comandoGenero3 = mysqli_fetch_array(mysqli_query($connection, "select genero from genero where id = $generoPesquisa3"));

    $genero1 = $comandoGenero1['genero'];
    $genero2 = $comandoGenero2['genero'];
    $genero3 = $comandoGenero3['genero'];

    $generoConcat = $genero1 . ", " . $genero2 . ", " . $genero3;

    
    $horas = $duracao / 60;
    $minutos = $duracao%60;
    $horas = floor($horas);

    if($duracao%60 == 0) {
        $duracaoString = $horas . "h00";
    }else {
        $duracaoString = $horas . "h" . $minutos;
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
    <link rel="stylesheet" href="../css/filme.css">
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
                <img src="<?php echo $caminho?>" alt="" height="400px">
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
                            <h2><?php
                            if($media_estrelas != 0) {
                                echo $media_estrelas;
                            }else {
                                echo "N/A";
                            }
                            ?> estrelas</h2>
                        </div>
                    </div>
                    <p><?php echo $sinopse?></p>
                    <div id="gendur">
                        <div>
                            <h3>Gênero</h3>
                            <i> <?php echo $generoConcat?></i>
                        </div>
                        <div>
                            <h3>Duração</h3>
                            <i> <?php echo $duracaoString?></i>
                        </div>
                        <div>
                            <h3>Ano de Lançamento</h3>
                            <i> <?php echo $ano?></i>
                        </div>
                    </div>
                </div>
            </div>
            <div id="segunda_parte">
                <iframe src="<?php echo $link?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                <div id="streamings">
                    <h2>Onde Assistir</h2>
                    <div id="streaming">
                        <?php
                            for($i = 0; $i < count($streamArray); $i++) {
                                echo "<div><p>";
                                echo $streamArray[$i];
                                echo "</p></div>";
                                if(empty($streamArray[$i + 1])) {
                                    
                                }else {
                                    echo "<div class='separacao'></div>";
                                }
                            }
                        ?>
                    </div>
                </div>
            </div>
            <form action="../php/adicionaPlaylist.php" method="post">
                
            </form>

            <div id="comentarioPlaylist">
                <form action="filme.php" method="post" id="inserirComentario">
                    <h2>Comentários</h2>

                    <div id="divEstrelas">
                        <label for="estrelasAvaliacao">Número de estrelas: </label>
                        <div id="stars">
                            <img src="../img/imgEstrela/estrela.png" alt="" width="30px" id="e1">
                            <img src="../img/imgEstrela/estrela.png" alt="" width="30px" id="e2">
                            <img src="../img/imgEstrela/estrela.png" alt="" width="30px" id="e3">
                            <img src="../img/imgEstrela/estrela.png" alt="" width="30px" id="e4">
                            <img src="../img/imgEstrela/estrela.png" alt="" width="30px" id="e5">
                        </div>
                        <input type="range" step="1" id="estrelasAvaliacao" name="estrelas" min="1" max="5" required>
                    </div>
                    <textarea name="resenha" id="resenha" rows="5" cols="100" placeholder="Escreva um comentário" required style="width:90%"></textarea>
                    <div>
                        <button type="submit" name="botao_clicado" value="<?php echo $id_clicado?>" style="color: white; background-color: rgb(88, 88, 196);">Enviar</button>
                        <button type="button" onclick="cancelar()">Cancelar</button>
                        <script defer>
                            function cancelar() {
                                var texto = document.getElementById("resenha");
                                texto.value = "";
                            }
                        </script>
                    </div>
                </form>
                <div id="playlist">
                    <h3>Adicionar à Playlist</h3>
                    <div id="playlists">
                        <div id="add-playlist" onclick="criarPlaylist()">
                            <img src="../img/add-playlist.png" alt="add-playlist" width="40px">
                            <div class="playlist-infos">
                                <h4>Criar Playlist</h4>
                                <h5 style="color:rgba(173, 173, 173)"><i>Criar uma nova playlist</i></h5>
                            </div>
                        </div>
                        <form action="../php/inserirPlaylist.php" method="post">
                            <?php
                                if($_SESSION['id'] == "") { 
                                    echo "<script>
                                        var inserirComentario = document.getElementById('inserirComentario');
                                        var playlist = document.getElementById('playlist');

                                        inserirComentario.style.display = 'none';
                                        playlist.style.display = 'none';
                                    </script>";
                                }else {
                                    echo "<script>
                                        var inserirComentario = document.getElementById('inserirComentario');
                                        var playlist = document.getElementById('playlist');

                                        inserirComentario.style.display = 'block';
                                        playlist.style.display = 'block';
                                    </script>";
                                        
                                    $id_logado = $_SESSION['id'];
                                    $stringPlaylists = "select * from playlist where id_usuario=$id_logado";
                                    $sqlPlaylists = mysqli_query($connection, $stringPlaylists);

                                    while($arrayPlaylist = mysqli_fetch_array($sqlPlaylists)) {
                                        $id_playlist = $arrayPlaylist['id'];
                                        $nome = $arrayPlaylist['nome'];
                                        $descricao = $arrayPlaylist['descricao'];
                                        
                                        echo "<button type='submit' name='id_playlist' class='playlist' value='$id_playlist'>
                                            <img src='../img/add-playlist.png' alt='add-playlist' width='40px'>
                                            <div class='playlist-infos'>
                                                <h4>$nome</h4>
                                                <h5 style='color:rgba(173, 173, 173)'><i>$descricao</i></h5>
                                                <input type='number' name='id_filme' value='$id_clicado' style='display:none'/>
                                            </div>
                                        </button>";
                                    }
                                }
                            ?>
                        </form>
                    </div>
                </div>
            </div> 


            <form action="usuarioForeign.php" method="post" id="comentarios">
                <?php 
                
                    $string2 = "select * from avaliacao where id_filme=$id_clicado";
                    $sql = mysqli_query($connection, $string2);


                    while($array = mysqli_fetch_array($sql)) {
                        $id_usuario2 = $array['id_usuario'];
                        $num_estrelas2 = $array['num_estrelas'];
                        $resenha2 = $array['resenha'];
                        $data2 = $array['data'];

                        $ano = substr($data2, 0, 4);
                        $mes = substr($data2, 5, 2);
                        $dia = substr($data2, 8, 2);

                        $hora2 = $array['hora'];

                        $string3 = "select nome, caminho_img from usuario where id=$id_usuario2";
                        $array2 = mysqli_fetch_array(mysqli_query($connection, $string3));
                        $nomeUsuario = $array2['nome'];
                        $img = $array2['caminho_img'];

                        echo 
                        "<div class='comentario'>
                            <div class='infos'>
                                <h2><button type='submit' name='id_clicado' value='$id_usuario2' class='nomeAvaliacao'>$nomeUsuario</button> | $num_estrelas2 estrelas</h2>
                                <h3>$dia/$mes/$ano às $hora2</h3>
                            </div>
                            <h4>$resenha2</h4>
                        </div>";
                    }
                
                ?>
            </form>
        </div>
    </main>
    <div id="criaPlaylist">
        <form action="../php/cadastraPlaylist.php" id="criaPlaylistForm" method="post">
            <img src="../img/add.png" alt="" width="20px" id="sair" onclick="sairCriaPlaylist()">
            <script>
                var criaPlaylist = document.getElementById("criaPlaylist");
                function sairCriaPlaylist() {
                    criaPlaylist.style.display = "none";
                }
            </script>
            
            <label for="nome">Nome da Playlist</label><br>
            <input type="text" name="nome" id="nome" placeholder="Nome da Playlist" required/>
            <br><br>
            
            <label for="descricao">Descrição da Playlist</label><br>
            <input type="text" name="descricao" id="descricao" placeholder="Descrição da Playlist" required/>
            <br><br>

            <button type="submit" name="botao_clicado" value="<?php echo $id_clicado ?>">Adicionar</button>
        </form>
    </div>

    <footer>
        &copy; TudoFilmes tem todos seus direitos reservados a seus criadores | Hiran, Kevin, Yago e Yuri
    </footer>
    
    <script>
        var criaPlaylist = document.getElementById("criaPlaylist");
        function criarPlaylist() {
            criaPlaylist.style.display = "flex";
        }
    </script>

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