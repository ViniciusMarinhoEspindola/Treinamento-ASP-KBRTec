function mudarLabel(inputFile, labelFile, short = false,submitFile = true){
    let label = document.getElementById(labelFile);
    let file = document.getElementById(inputFile);
    if(submitFile) {
        let submit = document.getElementById("enviarArq");
        submit.style.display = "block";
    }
    if(short){
        label.innerHTML = file.value;
    } else{
        label.innerHTML = "Arquivo selecionado: " + file.value;
    }
}