<!--#include file="includes/header.asp"-->
<nav class="navbar navbar-expand-lg navbar-dark py-4 bg-dark">    
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <h1 class="mr-auto navbar-brand"><i class="fa fa-handshake-o"></i></h1>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="clientes-cadastrar.asp">Cadastrar Participantes</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="participantes.asp">Participantes</a></h5>
            </li>
            <li class="nav-item active">
                <h5><a class="nav-link text-info mx-3" href="empresas-cadastrar.asp">Cadastrar Empresas <span class="sr-only">(página atual)</span></a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link mx-3" href="empresas.asp">Empresas</a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link text-danger mx-3" href="functions/logout.asp">Sair</a></h5>
            </li>
        </ul>    
    </div>
</nav>


<div style="display: flex; justify-content: center; flex-direction: column; height: 60vh;">
    <h1 class="text-info text-center mt-5">INSTRUÇÕES</h1>
    <h3 class="text-muted text-center mt-4">Insira as informações de cadastro no formulario abaixo.</h3>
    
    <div class="container" style="display: flex; justify-content: center;">
        <form action="functions/cadastrarEmpresa.asp" method="POST" class="mt-5" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group">
                    <input type="text" name="razaoSocial" id="razaoSocial" placeholder="Razão Social" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" name="nome" id="nome" placeholder="Nome" class="form-control">
                </div>
                <div class="form-group">
                    <label id="logoLabel" class="btn btn-info logoLabel" for="logoEmpresas">Logotipo</label>
                    <input id="logoEmpresas" onchange="mudarLabel('logoEmpresas', 'logoLabel', true,false);" accept="image/*" placeholder="Selecione o arquivo" class="form-control display" type="file" name="logo">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <input type="text" name="celular" id="celular" placeholder="Celular" class="form-control">
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="email" placeholder="E-mail" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" name="senha" id="senha" placeholder="Senha" class="form-control">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group ml-auto">
                    <input type="submit" name="enviar" id="enviar" value="Enviar" class="btn btn-info">
                </div>
            </div>
        </form>
    </div>
</div>

<!--#include file="includes/footer.asp"-->
<script src="assets/js/mudarLabel.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script>
     // Mascara
    $("input[name=celular]").mask("(00) 00000-0009");
    $("input[name=telefone]").mask("(00) 0000-0000");
</script>