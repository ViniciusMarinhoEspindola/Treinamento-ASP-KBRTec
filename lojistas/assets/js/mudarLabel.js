function mudarLabel(inputFile, labelFile, short = false,submitFile = true){
    let label = document.getElementById(labelFile);
    let file = document.getElementById(inputFile);
    if(short){
        label.innerHTML = file.value;
    } else{
        label.innerHTML = "Arquivo selecionado: " + file.value;
    }
}