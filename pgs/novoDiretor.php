<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Novo Diretor | TudoFilmes</title>
    <link rel="icon" href="../img/icon.png">
    <link rel="stylesheet" href="../css/novoDiretor.css">
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
                        $sql = mysqli_query($connection, $string);

                        while($array = mysqli_fetch_array($sql)) {
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
        <form action="../php/cadastroDiretor.php" method="POST" id="diretor">
            <h2>Cadastrar Novo Diretor</h2>

            <label for="nome">Nome</label>
            <div class="input" for="nome">
                <input type="text" name="nome" id="nome" placeholder="Nome Completo" required/>
            </div>
            
            <label for="bio">Biografia</label>
            <textarea name="bio" id="bio" required></textarea>

            <button type="submit">CADASTRAR</button>
        </form>
    </main>
</body>
</html>