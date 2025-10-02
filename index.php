<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Início | TudoFilmes</title>
    <link rel="stylesheet" href="./css/index.css">
    <link rel="icon" href="./img/icon.png">
</head>
<body>
    <header>
        <h1>Bem-vindo ao TudoFilmes</h1>
        <form action="./pgs/resultadoPesquisa.php" method="post">
            <label for="barraPesquisa" class="barraPesquisa">
                <button type="submit" id="lupa"><img src="./img/lupa.png" width="20px"></button>
                <input type="text" id="barraPesquisa" name="barraPesquisa" placeholder="Faça sua pesquisa">
                <img src="./img/icon-filter.png" alt="" width="30px" id="filtro-icon" onclick="mostraFiltro()">
                <div id="generooudiretor">
                    <button type="button" onclick="mostraGenero()" class="opcoes">Gêneros <img src="./img/setaDireita.png" alt="" width="10px"></button>
                    <ul id="genero">
                        <?php
                        include "./php/connection.php";

                        $string = "select * from genero";
                        $sql = mysqli_query($connection, $string);

                        while($array = mysqli_fetch_array($sql)) {
                            echo "<button type='submit' name='genero' value='" . $array['id'] . "'><li>" . $array['genero'] . "</li></button>";
                        }
                        ?>
                    </ul>
                    <button type="button" class="opcoes" href="./pgs/diretores" onclick="diretores()">Diretores <img src="./img/setaDireita.png" alt="" width="10px"></button>
                    <script>
                        function diretores() {
                            window.location = "./pgs/diretores.php";
                        }    
                    </script>
                </div>
            </label>
        </form>
        <a href="#" id="usuario" onclick="verificaLogin()">
            <img src="./img/person.png" alt="" width="50px">
            <figcaption>Usuário</figcaption>
        </a>
        <script>
            var lsUser = localStorage.getItem("user");    
            function verificaLogin() {
                if(lsUser == null) {
                    window.location = "./pgs/login.html";
                }else {
                    window.location = "./pgs/usuario.php";
                }
            }
        </script>
    </header>
    <main>
        <?php

            $stringTop3 = "select * from filme where ano_publicacao = 2025 order by media_estrelas desc";
            $sqlTop3 = mysqli_query($connection, $stringTop3);
            $cont = 1;

            while($arrayTop3 = mysqli_fetch_array($sqlTop3)) {
                
                switch($cont) {
                    case 1:
                        $nomeTop1 = $arrayTop3['nomeFilme'];
                        $caminhoTop1 = $arrayTop3['caminho_img'];
                        $caminhoCertoTop1 = substr($caminhoTop1, 1);
                        $idTop1 = $arrayTop3['id'];
                        break;
                    case 2:
                        $nomeTop2 = $arrayTop3['nomeFilme'];
                        $caminhoTop2 = $arrayTop3['caminho_img'];
                        $caminhoCertoTop2 = substr($caminhoTop2, 1);
                        $idTop2 = $arrayTop3['id'];
                        break;
                    case 3:
                        $nomeTop3 = $arrayTop3['nomeFilme'];
                        $caminhoTop3 = $arrayTop3['caminho_img'];
                        $caminhoCertoTop3 = substr($caminhoTop3, 1);
                        $idTop3 = $arrayTop3['id'];
                        break;
                }

                $cont++;
            }

        ?>
        <form action="./pgs/filme.php" method="post">
            <div id="top3Filmes">
                <button type="submit" value="<?php echo $idTop3 ?>" name="botao_clicado">
                    <div class="tops">
                        <img src="<?php echo $caminhoCertoTop3 ?>" alt="">
                        <h3><?php echo $nomeTop3 ?></h3>
                        <h2 style="color: rgb(175, 98, 53)">TOP 3🥉</h2>
                    </div>
                </button>

                <button type="submit" value="<?php echo $idTop1 ?>" name="botao_clicado">
                    <div class="tops">
                        <img src="<?php echo $caminhoCertoTop1 ?>" alt="">
                        <h3><?php echo $nomeTop1 ?></h3>
                        <h2 style="color: gold">TOP 1🥇</h2>
                    </div>
                </button>

                <button type="submit" value="<?php echo $idTop2 ?>" name="botao_clicado">
                    <div class="tops">
                        <img src="<?php echo $caminhoCertoTop2 ?>" alt="">
                        <h3><?php echo $nomeTop2 ?></h3>
                        <h2 style="color: silver">TOP 2🥈</h2>
                    </div>
                </button>

            </div>

            <h1 id="filmes2025title">Filmes 2025</h1>
            <div id="filmes2025">
                <button type="submit" value="2" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme2.jpg" alt="">
                        <h3>Lilo & Stitch</h3>
                    </div>
                </button>

                <button type="submit" value="3" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme3.jpg" alt="">
                        <h3>Um Filme Minecraft</h3>
                    </div>
                </button>

                <button type="submit" value="1" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme1.jpg" alt="">
                        <h3>F1: The Movie</h3>
                    </div>
                </button>

                <button type="submit" value="4" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme4.jpg" alt="">
                        <h3>O Macaco</h3>
                    </div>
                </button>

                <button type="submit" value="5" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme5.jpg" alt="">
                        <h3>Capitão América</h3>
                    </div>
                </button>

                <button type="submit" value="6" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme6.jpg" alt="">
                        <h3>Anora</h3>
                    </div>
                </button>

                <button type="submit" value="7" name="botao_clicado">
                    <div class="filmes2025">
                        <img src="./img/imgFilmes/filme7.jpg" alt="">
                        <h3>Paddington</h3>
                    </div>
                </button>
            </div>
            
            <h1 id="acaoTitle">Ficção Científica</h1>
            <div id="acao">
                <?php
                    $comando = mysqli_query($connection, "select * from filme where genero like '6, %' or genero like '%, 6, %' or genero like '%, 6'");
                    while($array = mysqli_fetch_array($comando)) {
                        $caminho = substr($array['caminho_img'], 1);
                        echo "<button type='submit' value='" . $array['id'] ."' name='botao_clicado'>
                                <div class='filmes'>
                                    <img src='" . $caminho . "' alt=''>
                                    <h3>" . $array['nomeFilme'] . "</h3>
                                </div>
                            </button>";
                    }
                
                ?>
            </div>
            
            <h1 id="dramaTitle">Drama</h1>
            <div id="drama">
                <?php
                    $comando = mysqli_query($connection, "select * from filme where genero like '4, %' or genero like '%, 4, %' or genero like '%, 4'");
                    while($array = mysqli_fetch_array($comando)) {
                        $caminho = substr($array['caminho_img'], 1);
                        echo "<button type='submit' value='" . $array['id'] ."' name='botao_clicado'>
                                <div class='filmes'>
                                    <img src='" . $caminho . "' alt=''>
                                    <h3>" . $array['nomeFilme'] . "</h3>
                                </div>
                            </button>";
                    }
                
                ?>
            </div>
            
            <h1 id="animacaoTitle">Ação</h1>
            <div id="animacao">
                <?php
                include "./php/connection.php";
                    $comando = mysqli_query($connection, "select * from filme where genero like '1, %' or genero like '%, 1, %' or genero like '%, 1'");
                    while($array = mysqli_fetch_array($comando)) {
                        $caminho = substr($array['caminho_img'], 1);
                        echo "<button type='submit' value='" . $array['id'] ."' name='botao_clicado'>
                                <div class='filmes'>
                                    <img src='" . $caminho . "' alt=''>
                                    <h3>" . $array['nomeFilme'] . "</h3>
                                </div>
                            </button>";
                    }
                
                ?>
            </div>
        </form>
    </main>
    <footer>
        &copy; TudoFilmes tem todos seus direitos reservados a seus criadores | Hiran, Kevin, Yago e Yuri
    </footer>
    <script src="./js/mostrar.js" defer></script>
</body>
</html>