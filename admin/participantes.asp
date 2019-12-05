<!--#include file="includes/header.asp"-->
<!--#include file="../config/conexao.asp"-->
<nav class="navbar navbar-expand-lg navbar-dark py-4 bg-dark">    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <h1 class="mr-auto navbar-brand"><i class="material-icons">store_mall_directory</i></h1>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="clientes-cadastrar.asp">Cadastrar Participantes</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link text-info mx-3" href="clientes.asp">Participantes <span class="sr-only">(página atual)</span></a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="empresas-cadastrar.asp">Cadastrar Empresas</a></h5>
            </li>
            <li class="nav-item active">
                <h5><a class="nav-link mx-3" href="empresas.asp">Empresas</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link text-danger mx-3" href="functions/logout.asp">Sair</a></h5>
            </li>
        </ul>    
    </div>
</nav>