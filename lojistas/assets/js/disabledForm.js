function disabledForm(campo = null) {
    if(campo == "fileLabel") {
        if ($("#codigos").val() == "") {
            $("#arqConsultar").prop("disabled", false);
            $("#fileLabel").css("background-color", "")
            $("#fileLabel").css("cursor", "")  
        } else {
            $("#arqConsultar").prop("disabled", true);
            $("#fileLabel").css("background-color", "gray")
            $("#fileLabel").css("cursor", "default")
        }
    }
    else if(campo == "codigos") {
        if ($("#arqConsultar").val() == "") {
            $("#codigos").prop("disabled", false);
        } else {
            $("#codigos").prop("disabled", true);
        }
    }
}