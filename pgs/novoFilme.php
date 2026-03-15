<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Novo Filme | TudoFilmes</title>
    <link rel="icon" href="../img/icon.png">
    <link rel="stylesheet" href="../css/novoFilme.css">
    <script src="../js/mostrar.js" defer></script>
</head>
<body>
    <header>
        <div>
        <h1>Bem-vindo ao <a href="../index.php">TudoFilmes</a></h1>
        <form action="./resultadoPesquisa.php" method="post">
            <label for="barraPesquisa" class="barraPesquisa">
                <button type="submit" id="lupa"><img src="../img/lupa.png" width="20px"></button>
                <input type="text" id="barraPesquisa" name="barraPesquisa" placeholder="Faça sua pesquisa">
                <img src="../img/icon-filter.png" alt="" width="30px" onclick="mostraFiltro()" id="filtro-icon">
                <div id="generooudiretor">
                    <button type="button" onclick="mostraGenero()" class="opcoes">Gêneros <img src="../img/setaDireita.png" alt="" width="10px"></button>
                    <ul id="genero">
                        <?php
                        include "../php/connection.php";

                        $string = "select * from genero";
                        $sql = $connection->prepare($string);
                        $sql->execute();

                        while($array = $sql->fetch(PDO::FETCH_ASSOC)) {
                            echo "<button type='submit' name='genero' value='" . $array['id'] . "'><li>" . $array['genero'] . "</li></button>";
                        }
                        ?>
                    </ul>
                    <button type="button" class="opcoes" onclick="diretores()">Diretores <img src="../img/setaDireita.png" alt="" width="10px"></button>
                    <script>
                        function diretores() {
                            window.location = "./diretores.php";
                        }    
                    </script>
                </div>
            </label>
        </form>
        <a href="#" id="usuario" onclick="verificaLogin()">
            <img src="../img/person.png" alt="" width="50px">
            <figcaption>Usuário</figcaption>
        </a>
        <script>
            var lsUser = localStorage.getItem("user");    
            function verificaLogin() {
                if(lsUser == null) {
                    window.location = "./login.html";
                }else {
                    window.location = "./usuario.php";
                }
            }
        </script>
    </header>
    <main>
        <form action="../php/cadastroFilme.php" method="POST" id="adicionaFilme" enctype="multipart/form-data">
            <h2>Cadastrar Novo Filme</h2>

            <label for="nome">Nome</label>
            <div class="input" for="nome">
                <input type="text" name="nome" id="nome" placeholder="Nome Completo" required/>
            </div>
            
            <label for="media_estrelas">Media de estrelas</label>
            <div class="input" for="media_estrelas">
                <input type="number" step="0.1" name="media_estrelas" id="media_estrelas" placeholder="Media de estrelas" required/>
            </div>

            <label for="genero1">1° Gênero</label><br>
            <select name="genero1" class="generos" id="genero1">
                <?php
                    $generos = "select * from genero";
                    $generosSQL = $connection->prepare($generos);
                    $generosSQL->execute();

                    while($arrayGeneros = $generosSQL->fetch(PDO::FETCH_ASSOC)) {
                        $idGenero = $arrayGeneros['id'];
                        $nomeGenero = $arrayGeneros['genero'];

                        echo "<option value='$idGenero'>$nomeGenero</option>";
                    }
                ?>
            </select><br><br>
            
            <label for="genero2">2° Gênero</label><br>
            <select name="genero2" class="generos" id="genero2">
                <?php
                    $generos = "select * from genero";
                    $generosSQL = $connection->prepare($generos);
                    $generosSQL->execute();

                    while($arrayGeneros = $generosSQL->fetch(PDO::FETCH_ASSOC)) {
                        $idGenero = $arrayGeneros['id'];
                        $nomeGenero = $arrayGeneros['genero'];

                        echo "<option value='$idGenero'>$nomeGenero</option>";
                    }
                ?>
            </select><br><br>
            
            <label for="genero3">3° Gênero</label><br>
            <select name="genero3" class="generos" id="genero3">
                <?php
                    $generos = "select * from genero";
                    $generosSQL = $connection->prepare($generos);
                    $generosSQL->execute();

                    while($arrayGeneros = $generosSQL->fetch(PDO::FETCH_ASSOC)) {
                        $idGenero = $arrayGeneros['id'];
                        $nomeGenero = $arrayGeneros['genero'];

                        echo "<option value='$idGenero'>$nomeGenero</option>";
                    }
                ?>
            </select><br><br>
            
            <label for="duracao">Duração</label>
            <div class="input" for="duracao">
                <input type="number" step="1" name="duracao" id="duracao" placeholder="Duração" required/>
            </div>

            <label for="sin">Sinopse</label>
            <textarea name="sin" id="sin" required></textarea>

            <label for="ftFilme">Capa do Filme</label>
            <input type="file" id="ftFilme" name="ftFilme" accept="image/*" required/><br>
            <i style="color: white; font-size: 11px">Por favor, coloque uma imagem na proporção 2764 x 4096(17:25)</i><br><br>
            
            <label for="trailer">Link do Trailer</label>
            <div class="input" for="trailer">
                <input type="text" name="trailer" id="trailer" placeholder="Link do trailer" required/>
            </div>
            
            <label for="streamings">Streamings</label>
            <div class="input" for="streamings">
                <input type="text" name="streamings" id="streamings" placeholder="Streamings(Separar por ', ')" required/>
            </div>
            
            <label for="ano">Ano de lançamento</label>
            <div class="input" for="ano">
                <input type="number" name="ano" id="ano" placeholder="Ano de lançamento" min="0" max="9999" required/>
            </div>
            
            <label for="diretor">Diretor</label>
            <select name="diretor" class="generos">
                <?php
                    $diretores = "select * from diretor";
                    $diretorSQL = $connection->prepare($diretores);
                    $diretorSQL->execute();

                    while($arrayDiretor = $diretorSQL->fetch(PDO::FETCH_ASSOC)) {
                        $idDiretor = $arrayDiretor['id'];
                        $nomeDiretor = $arrayDiretor['nome'];

                        echo "<option value='$idDiretor'>$nomeDiretor</option>";
                    }
                ?> 
            </select>

            <button type="submit">CADASTRAR</button>
        </form>
    </main>
</body>
</html>