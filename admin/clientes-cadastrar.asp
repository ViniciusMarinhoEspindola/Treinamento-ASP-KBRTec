<!--#include file="includes/header.asp"-->
<nav class="navbar navbar-expand-lg navbar-dark py-4 bg-dark">    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <h1 class="mr-auto navbar-brand"><i class="fa fa-ticket"></i></h1>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <h5><a class="nav-link text-info mx-3" href="clientes-cadastrar.asp">Cadastrar Clientes <span class="sr-only">(página atual)</span></a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="#">Clientes</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="#">Cadastrar Empresas</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="#">Empresas</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link text-danger mx-3" href="#">Sair</a></h5>
            </li>
        </ul>    
    </div>
</nav>

<div style="display: flex; justify-content: center; flex-direction: column; height: 70vh;">
    <h1 class="text-info text-center mt-5">INSTRUÇÕES</h1>
    <h3 class="text-muted text-center mt-4">Carregue o arquivo com a lista de inscritos no evento.</h3>
    
    <div class="container" style="display: flex; justify-content: center;">
        <form action="" class="mt-5">
            <div class="form-group">
                <label id="fileLabel" class="btn btn-info px-5 py-2 fileLabel" for="arqClientes">Procurar</label>
                <input id="arqClientes" onchange="mudarLabel();" placeholder="Selecione o arquivo" class="form-control" type="file" name="clientes">
            </div>
        </form>
    </div>
</div>

<!--#include file="includes/footer.asp"-->
<script src="assets/js/mudarLabel.js"></script>