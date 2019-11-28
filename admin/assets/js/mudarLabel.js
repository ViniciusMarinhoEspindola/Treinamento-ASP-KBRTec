function mudarLabel(){
    let label = document.getElementById("fileLabel");
    let file = document.getElementById("arqClientes");
    label.innerHTML = "Arquivo selecionado: " + file.value;
}