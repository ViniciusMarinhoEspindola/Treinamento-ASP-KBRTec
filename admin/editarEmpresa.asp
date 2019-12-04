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
                <h5><a class="nav-link mx-3" href="clientes.asp">Participantes</a></h5>
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


<%
    SQL = "SELECT id_lojista, razao_social, nome, email, senha, celular, logotipo FROM lojistas WHERE id_lojista = " & request.querystring("id") & ";"
    Set req = getConsulta(SQL)
%>

<div class="container" style="display: flex; justify-content: center; align-items: center; height: 10vh;"></div>
    <h1 class='text-info text-center'>Editar dados da empresa</h1>
    <form class="mt-5" style="display: flex; justify-content: center; align-items: center; flex-direction: column;" action="functions/editarEmpresa.asp" method="POST">
        <input type="hidden" name="id" value='<% =request.querystring("id") %>' id="id">
        <div class="form-row">
            <div class="form-group">
                <input type="text" value='<% =req("razao_social") %>' name="razaoSocial" id="razaoSocial" placeholder="Razão Social" class="form-control">
            </div>
            <div class="form-group">
                <input type="text" value='<% =req("nome") %>' name="nome" id="nome" placeholder="Nome" class="form-control">
            </div>
            <div class="form-group">
                <label id="logoLabel" class="btn btn-info logoLabel" for="logoEmpresas">Logotipo</label>
                <input id="logoEmpresas" onchange="mudarLabel('logoEmpresas', 'logoLabel', true,false);" accept="image/*" placeholder="Selecione o arquivo" class="form-control display" type="file" name="logo">
                <!-- <input type="text" value='<% ''=req("logotipo") %>' class="form-control" name="logo" id="logo"> -->
            </div>
            
        </div>
        <div class="form-row">
            <div class="form-group">
                <input type="text" value='<% =req("celular") %>' name="celular" id="celular" placeholder="Celular" class="form-control">
            </div>
            <div class="form-group">
                <input type="email" value='<% =req("email") %>' name="email" id="email" placeholder="E-mail" class="form-control">
            </div>
            <div class="form-group">
                <input type="password" name="senha" id="senha" placeholder="Senha" class="form-control">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group ml-auto">
                <input type="reset" name="reset" id="reset" value="Limpar" class="btn btn-outline-info">
                <input type="submit" name="enviar" id="enviar" value="Enviar" class="btn btn-info">
            </div>
        </div>
    </form>
</div>

<!--#include file="includes/footer.asp"-->