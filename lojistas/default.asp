<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="includes/header.asp"-->
<!--#include file="../functions/functions.asp"-->
<div class="mt-5" style="display: flex; justify-content: center; flex-direction: column; height: 70vh;">
    <%
        call getMessage()
    %>
    <h1 class="text-info text-center mt-5">INSTRUÇÕES</h1>
    
    <h4 class="text-muted text-center my-3">Digite o código do ingresso dos participantes do evento.</h4>
    <form action="consultarParticipantes.asp" method="POST" class="" enctype="multipart/form-data">
        <div class="form-group" style="display: flex; justify-content: center;">
            <textarea id="codigos" required onchange="disabledForm('fileLabel');" name="codigos" class="col-2 form-control" placeholder="Separe os códigos por Enter ou ponto e virgula ( ; )"></textarea>
        </div>
        <div class="container" style="display: flex; justify-content: center;">
            <div class="form-group">
                <input type="submit" id="enviar" class="btn btn-outline-info ml-auto mr-auto" value="Enviar Códigos">
            </div>
        </div>
    </form>
        <h4 class="text-muted text-center mt-4">Ou</h4>
        <h4 class="text-muted text-center my-4">Carregue o arquivo .csv com a lista de participantes do evento.</h4>
    
    <form action="consultarParticipantesArq.asp" id="formArq" method="POST" class="" enctype="multipart/form-data">
        <div class="container" style="display: flex; justify-content: center;">
            <div class="form-group">
                <label id="fileLabel" class="btn btn-info px-5 py-2 fileLabel" for="arqConsultar">Procurar</label>
                <input id="arqConsultar" onchange="mudarLabel('arqConsultar', 'fileLabel'); disabledForm('codigos');" accept=".csv" placeholder="Selecione o arquivo" class="form-control display" type="file" name="consultar">
            </div>
        </div>
        <div class="container" style="display: flex; justify-content: center;">
            <div class="form-group">
                <input type="submit" id="enviar" class="btn btn-outline-info ml-auto mr-auto" value="Enviar Arquivo">
            </div>
        </div>
    </form>
    
</div>

<!--#include file="includes/footer.asp"-->
<script src="assets/js/mudarLabel.js"></script>
<script src="assets/js/disabledForm.js"></script>
<script>
    $("#formArq").submit(function (e) {
        if($("#arqConsultar").val() == ""){
            e.preventDefault()
            $("#fileLabel").css("box-shadow", "0px 0px 10px #0275d8")
        }   
    });
</script>