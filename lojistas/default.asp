<!--#include file="includes/header.asp"-->
<nav class="navbar navbar-expand-lg navbar-dark py-4 bg-info">     
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <h1 class="ml-auto mr-auto navbar-brand">Página do Lojista</h1>
    </div>
</nav>

<div style="display: flex; justify-content: center; flex-direction: column; height: 70vh;">
    <h1 class="text-info text-center mt-5">INSTRUÇÕES</h1>
    
    <h4 class="text-muted text-center my-3">Digite o código do ingresso dos participantes do evento.</h4>
    <form action="functions/consultarParticipantes.asp" method="POST" class="">
        <div class="form-group" style="display: flex; justify-content: center;">
            <textarea id="codigos" onblur="disabledForm();" name="codigos" class="col-2 form-control" placeholder="Separe os códigos por Enter ou ponto e virgula ( ; )"></textarea>
        </div>
    
        <h4 class="text-muted text-center mt-4">Ou</h4>
        <h4 class="text-muted text-center my-4">Carregue o arquivo .csv com a lista de participantes do evento.</h4>
    
        <div class="container" style="display: flex; justify-content: center;">
            <div class="form-group">
                <label id="fileLabel" class="btn btn-info px-5 py-2 fileLabel" for="arqConsultar">Procurar</label>
                <input id="arqConsultar" onchange="mudarLabel('arqConsultar', 'fileLabel'); disabledForm();" accept=".csv" placeholder="Selecione o arquivo" class="form-control display" type="file" name="consultar">
            </div>
        </div>
        <div class="container" style="display: flex; justify-content: center;">
            <div class="form-group">
                <input type="submit" id="enviar" class="btn btn-outline-info ml-auto mr-auto" value="Enviar">
            </div>
        </div>
    </form>
    
</div>

<!--#include file="includes/footer.asp"-->
<script src="assets/js/mudarLabel.js"></script>
<script src="assets/js/disabledForm.js"></script>