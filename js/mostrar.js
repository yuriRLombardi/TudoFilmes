

var z = 0;
var ul = document.getElementById("generooudiretor");
var genero = document.getElementById("genero");
var lsUser = localStorage.getItem("user");


function mostraFiltro() {
    if(z == 0) {
        ul.style.display = "flex";
        z++;
    }else {
        ul.style.display = "none";
        z = 0;
    }
}

var i = 0;
function mostraGenero() {
    if(i == 0) {
        genero.style.display = "block";
        i++;
    }else {
        genero.style.display = "none";
        i--;
    }
}
