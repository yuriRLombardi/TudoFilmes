<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diretores | TudoFilmes</title>
    <link rel="icon" href="../img/icon.png">
    <link rel="stylesheet" href="../css/diretores.css">
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
    <div id="diretores">
    <?php
        
        $string = "select * from diretor";
        
        $query = $connection->prepare($string);
        $query->execute();

        echo "<form action='./diretor.php' id='resultado' method='post'>";
        while($array = $query->fetch(PDO::FETCH_ASSOC)) {
            echo "
            <button type='submit' value='" . $array['id'] . "' name='botao_clicado'>
                <div class='diretor'>
                    <h3>" . $array['nome'] . "</h3>
                </div>
            </button>";
        }
    ?>
    <a href="./novoDiretor.php" id="novoDiretor">
        <button type='button'>
            <div class='diretor'>
                <h3>Adicionar Novo Diretor</h3>
            </div>
        </button>
    </a>
    <script>
        var novoDiretor = document.getElementById("novoDiretor");

        if(localStorage.getItem("user") == null) {
            novoDiretor.style.display = "none";
        }else {
            console.log(localStorage.getItem("user"));
            if(localStorage.getItem("user") != "admin") {
                novoDiretor.style.display = "none";
                
            }else {
                novoDiretor.style.display = "block";
                console.log(localStorage.getItem("user"));
            }
        }

    </script>
    </form>
    </div>
    <footer>
        &copy; TudoFilmes tem todos seus direitos reservados a seus criadores | Hiran, Kevin, Yago e Yuri
    </footer>
</body>
</html>