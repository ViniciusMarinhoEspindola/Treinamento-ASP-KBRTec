<%
    Session.Abandon
%>
<!--#include file="includes/header.asp"-->
    <nav class="navbar navbar-expand-lg navbar-dark py-4 bg-dark">
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
            <h1 class="mr-auto navbar-brand">No Mosquito - Eventos</h1>
        </div>
    </nav>

    <div class="row mt-5" >
        <h1 class="text-info col-12 text-center mt-5">Login</h1>
        <div class="col-4"></div>        
        <form class="col-6 ml-5 mt-5" method="POST" action="login.asp">
            <div class="row">
                <div class="form-group col-7">
                    <label for="email">E-mail</label>
                    <input class="form-control"  placeholder="Coloque seu E-mail" name="email" id="email" required type="text" class="validate">
                    
                </div>

                <div class="form-group col-7">
                    <label for="senha">Senha</label>
                    <input class="form-control" placeholder="Coloque sua senha" name="senha" id="senha" required type="password" class="validate">
                </div>

                <div class="form-group col-7">
                    <input class="form-control btn btn-info" type="submit" name="submit" id="submit" value="Enviar">
                </div>
            </div>   
        </form>
    </div>
<!--#include file="includes/footer.asp"-->