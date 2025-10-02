<?php
include "./connection.php";

if(isset($_POST['id_playlist']) && isset($_POST['id_filme'])) {
    $id_playlist = $_POST['id_playlist'];
    $id_filme = $_POST['id_filme'];

    $stringSelect = "select id_filmes from playlist where id=$id_playlist";
    $resultado = mysqli_fetch_array(mysqli_query($connection, $stringSelect));
    $filmesCadastrados = $resultado['id_filmes'];

    if(!str_contains($filmesCadastrados, ', ' . $id_filme . ', ') && !str_contains($filmesCadastrados, $id_filme) && !str_contains($filmesCadastrados, ', ' . $id_filme)) {
        $stringConcatenada = $filmesCadastrados . ", " . $id_filme;

        $stringInsert = "update playlist set id_filmes='$stringConcatenada' where id=$id_playlist";
        $sql = mysqli_query($connection, $stringInsert);
        header("Location: ../pgs/filme.php?botao_clicado=$id_filme");
    }else {
        echo "<script>
            window.alert('Filme já adiciona à essa playlist');
            window.location = '../pgs/filme.php?botao_clicado=$id_filme';
        </script>";
    }
}

?>