function disabledForm() {
    if($("#arqConsultar").val() == "") {
        $("#arqConsultar").prop("disabled", true);
        $("#fileLabel").css("background-color", "gray")
        $("#fileLabel").css("cursor", "default")
        $("#codigos").prop("disabled", false);
    }
    if($("#codigos").val() == "") {
        $("#arqConsultar").prop("disabled", false);
        $("#fileLabel").css("background-color", "")
        $("#fileLabel").css("cursor", "")
        $("#codigos").prop("disabled", true);
        //$("#fileLabel").css("background-color", "gray")
        //$("#fileLabel").css("cursor", "default")
    }
}