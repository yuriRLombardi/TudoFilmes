

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Resultado da pesquisa | TudoFilmes</title>
    <link rel="stylesheet" href="../css/resultadoPesquisa.css">
    <link rel="icon" href="../img/icon.png">
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
        <a href="#" id="usuario" onclick="logado()">
            <img src="../img/person.png" alt="" width="50px">
            <figcaption>Usuário</figcaption>
        </a>
        <script>
            function logado() {
                if(localStorage.getItem("user") != null) {
                    window.location = "../pgs/usuario.php";
                }else {
                    window.location = "../pgs/login.html";
                }
            }
        </script>
    </header>
    <div id="aviso" style="margin-top: 170px;"><h1>Resultado(s) da pesquisa</h1></div>

    <div id="filmes">
    <?php
        include "../php/connection.php";
        
        if(isset($_POST['barraPesquisa']) && !isset($_POST['genero'])) {
            $nomeFilme = $_POST['barraPesquisa'];
            $string = "select * from filme where nomeFilme like :nome";
            
            $query = $connection->prepare($string);
            $query->execute([':nome' => "$nomeFilme%"]);
            echo "<form action='./filme.php' id='resultado' method='post'>";
                while($array = $query->fetch(PDO::FETCH_ASSOC)) {
                    echo "
                    <button type='submit' value='" . $array['id'] . "' name='botao_clicado'>
                        <div class='filmes'>
                            <img src='" . $array['caminho_img'] . "' alt=''>
                            <h3>" . $array['nomeFilme'] . "</h3>
                        </div>
                    </button>";
                }
        }else {
            $id = $_POST['genero'];
            $string2 = "select * from filme WHERE genero LIKE :id OR genero LIKE :id2 OR genero LIKE :id3 OR genero = :id4;";
            
            $query2 = $connection->prepare($string2);
            $query2->execute([':id' => "$id, %", ':id2' => "%, $id, %", ':id3' => "%, $id", ':id4' => $id]);
            echo "<form action='./filme.php' id='resultado' method='post'>";
            while($array2 = $query2->fetch(PDO::FETCH_ASSOC)) {
                echo "
                <button type='submit' value='" . $array2['id'] . "' name='botao_clicado' class='filmes'>
                    <img src='" . $array2['caminho_img'] . "' alt=''>
                    <h3>" . $array2['nomeFilme'] . "</h3>
                </button>";
            }
        }
    ?>
        <a href="./novoFilme.php" id="adicionar">
            <div class='filmes' style="height:275px; width: 160px">
                <div>
                    <img src="../img/add.png" alt=''>
                </div>
                <h3 style="font-size: 12px">Adicionar Novo Filme</h3>
            </div>
        </a>
    </form>
        <script>
            var adicionar = document.getElementById("adicionar");

            if(localStorage.getItem("user") != "admin") {
                adicionar.style.display = "none";
            }else {
                adicionar.style.display = "block";
            }
        </script>
    </form>    
    </div>
    <footer>
        &copy; TudoFilmes tem todos seus direitos reservados a seus criadores | Hiran, Kevin, Yago e Yuri
    </footer>
</body>
</html>