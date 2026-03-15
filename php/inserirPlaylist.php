<?php
include "./connection.php";

if(isset($_POST['id_playlist']) && isset($_POST['id_filme'])) {
    $id_playlist = $_POST['id_playlist'];
    $id_filme = $_POST['id_filme'];

    $stringSelect = "select id_filmes from playlist where id=$id_playlist";
    $sqlSelect = $connection->prepare($stringSelect);
    $sqlSelect->execute();
    $resultado = $sqlSelect->fetch(PDO::FETCH_ASSOC);
    if($resultado['id_filmes'] == null) {
        
        $stringInsert = "update playlist set id_filmes= :string where id= :playlist";
        $sql = $connection->prepare($stringInsert);
        $sql->execute([':string' => $id_filme, ':playlist' => $id_playlist]);
        header("Location: ../pgs/filme.php?botao_clicado=$id_filme");
    }else {
        $filmesCadastrados = $resultado['id_filmes'];
        if(!str_contains($filmesCadastrados, ', ' . $id_filme . ', ') && !str_contains($filmesCadastrados, $id_filme) && !str_contains($filmesCadastrados, ', ' . $id_filme)) {
            $stringConcatenada = $filmesCadastrados . ", " . $id_filme;

            $stringInsert2 = "update playlist set id_filmes= :string where id= :playlist";
            $sql = $connection->prepare($stringInsert2);
            $sql->execute([':string' => $stringConcatenada, ':playlist' => $id_playlist]);
            header("Location: ../pgs/filme.php?botao_clicado=$id_filme");
        }else {
            echo "<script>
                window.alert('Filme já adiciona à essa playlist');
                window.location = '../pgs/filme.php?botao_clicado=$id_filme';
            </script>";
        }
    }

    
}

?>