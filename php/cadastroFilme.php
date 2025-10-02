<?php
include "connection.php";

if(isset($_POST['nome']) && isset($_POST['media_estrelas']) && isset($_POST['genero1']) && isset($_POST['genero2']) && isset($_POST['genero3']) && isset($_POST['duracao']) && isset($_POST['sin']) && isset($_POST['trailer']) && isset($_POST['streamings']) && isset($_POST['ano']) && isset($_POST['diretor']) && $_FILES['ftFilme']) {
    $nome = $_POST['nome'];
    $media_estrelas = $_POST['media_estrelas'];
    $generos = "" . $_POST['genero1'] . ", " . $_POST['genero2'] . ", " . $_POST['genero3'];
    $duracao = $_POST['duracao'];
    $sin = $_POST['sin'];

    $stringId = "select id from filme order by id desc";
    $sqlId = mysqli_query($connection, $stringId);
    $fetchId = mysqli_fetch_array($sqlId);
    $idSeg = $fetchId['id'];
    $idSeg++;

    $arquivo = $_FILES["ftFilme"];
    $pasta = "../img/imgFilmes/";
    $nomeArquivo = "filme" . $idSeg;
    $extensao = "jpg";

    $fez_upload = move_uploaded_file($arquivo["tmp_name"], $pasta . $nomeArquivo . "." . $extensao);
    if($fez_upload) {
        $path = $pasta . $nomeArquivo . "." . $extensao;
    }

    $link = $_POST['trailer'];
    $streamings = $_POST['streamings'];
    $ano = $_POST['ano'];
    $diretor = $_POST['diretor'];

    $string = "insert into filme (nomeFilme, media_estrelas, genero, duracao, sinopse, caminho_img, link_trailer, streamings, ano_publicacao, id_diretor) values ('$nome', $media_estrelas, '$generos', $duracao, '$sin', '$path', '$link', '$streamings', $ano, $diretor)";
    $sql = mysqli_query($connection, $string);

    header("Location: ../index.php");
}else {
    echo "Deu certo nn";
}

?>