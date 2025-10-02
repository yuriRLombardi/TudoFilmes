<?php
include "../php/connection.php";

if(isset($_POST['id_playlist'])) {
    $id_playlist = $_POST['id_playlist'];
    $stringPlaylist = "select * from playlist where id=$id_playlist";
    $resultado = mysqli_fetch_array(mysqli_query($connection, $stringPlaylist));
}

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Resultado da pesquisa | TudoFilmes</title>
    <link rel="stylesheet" href="../css/mostraPlaylist.css">
    <link rel="icon" href="../img/icon.png">
    <script src="../js/mostrar.js" defer></script>
</head>
<body>
    <header>
        <h1><?php echo $resultado['nome']?> | TudoFilmes</a></h1>
        <a href="../index.php">Voltar ao início</a>
        <form action="../php/excluiPlaylist.php" method="post">
            <button type="submit" name="id_playlist" value="<?php echo $id_playlist ?>">Excluir Playlist</button>
        </form>
    </header>
    <div id="aviso" style="margin-top: 170px;"><h1>Resultado(s) da pesquisa</h1></div>

    <div id="filmes">
        <form action="./filme.php" id="resultado" method="post">
            <?php
                $filmes = explode(', ', $resultado['id_filmes']);

                for($i = 0; $i < count($filmes); $i++) {
                    $id_filme = $filmes[$i];
                    $stringFilme = "select * from filme where id=$id_filme";
                    $sql = mysqli_query($connection, $stringFilme);
                    $array = mysqli_fetch_array($sql);

                    echo "<button type='submit' value='" . $array['id'] . "' name='botao_clicado'>
                        <div class='filmes'>
                            <img src='" . $array['caminho_img'] . "' alt=''>
                            <h3>" . $array['nomeFilme'] . "</h3>
                        </div>
                    </button>";
                }
            ?>
        </form>    
    </div>
    <footer>
        &copy; TudoFilmes tem todos seus direitos reservados a seus criadores | Hiran, Kevin, Yago e Yuri
    </footer>
</body>
</html>