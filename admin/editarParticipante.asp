<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
                <h5><a class="nav-link mx-3" href="participantes.asp">Participantes</a></h5>
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
    SQL = "SELECT id_participante, nome, sobrenome, tipo_de_ingresso, email, telefone, DATE_FORMAT(data_evento, '%Y-%m-%d') as data_evento, fase_planejamento FROM participantes WHERE id_participante = '" & request.querystring("id") & "';"
    Set req = getConsulta(SQL)   
%>

<div class="container" style="display: flex; justify-content: center; align-items: center; height: 10vh;"></div>
    <h1 class='text-info text-center'>Editar dados da empresa</h1>
    
    <form class="mt-5" style="display: flex; justify-content: center; align-items: center; flex-direction: column;" action="functions/editarParticipante.asp" method="POST">
        <input type="hidden" name="id" value='<% =request.querystring("id") %>' id="id">
        <div class="form-row">
            <div class="form-group">
                <input type="text" value='<% =req("nome") & " " & req("sobrenome") %>' name="nome" id="nome" placeholder="Nome" class="form-control">
            </div>
            <div class="form-group">
                <select class="form-control" name="tipo_de_ingresso" id="tipo_de_ingresso">
                    <option <% If req("tipo_de_ingresso") = "Debutante" Then %>selected <%End if%> value="Debutante">Debutante</option>
                    <option <% If req("tipo_de_ingresso") = "Acompanhante" Then %>selected <%End if%> value="Acompanhante">Acompanhante</option>
                    <option <% If req("tipo_de_ingresso") = "Noivo (a)" Then %>selected <%End if%> value="Noivo (a)">Noivo (a)</option>
                    <option <% If req("tipo_de_ingresso") = "Profissional de Evento" Then %>selected <%End if%> value="Profissional de Evento">Profissional de Evento</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" value='<% =req("email") %>' class="form-control" name="email" id="email">
            </div>
            
        </div>
        <div class="form-row">
            <div class="form-group">
                <input type="text" value='<% =req("telefone") %>' name="telefone" id="telefone" placeholder="Telefone" class="form-control">
            </div>
            <div class="form-group">
                <input type="date" value='<% =req("data_evento") %>' style="width: 200px;" name="data_evento" id="data_evento" placeholder="Data do Evento" class="form-control">
            </div>
            <div class="form-group">
                <select class="form-control" name="fase_planejamento" style="width: 200px;" id="fase_planejamento">
                    <option <% If req("fase_planejamento") = "" Then %>selected <%End if%> ></option>
                    <option <% If req("fase_planejamento") = "Estou bem no início, ainda não tenho data e local" Then %>selected <%End if%>>Estou bem no início, ainda não tenho data e local</option>
                    <option <% If req("fase_planejamento") = "Estou bem no início, mas já tenho data definida" Then %>selected <%End if%>>Estou bem no início, mas já tenho data definida</option>
                    <option <% If req("fase_planejamento") = "Estou bem no início da organização da festa, ainda não tenho nem data e local" Then %>selected <%End if%>>Estou bem no início da organização da festa, ainda não tenho nem data e local</option>
                    <option <% If req("fase_planejamento") = "Estou bem no início da organização da festa, mas já tenho data definida" Then %>selected <%End if%> >Estou bem no início da organização da festa, mas já tenho data definida</option>
                    <option <% If req("fase_planejamento") = "Estou no meio, já contratei algumas empresas" Then %>selected <%End if%>>Estou no meio, já contratei algumas empresas</option>
                    <option <% If req("fase_planejamento") = "Estou no meio da organização da festa, já contratei algumas empresas" Then %>selected <%End if%> >Estou no meio da organização da festa, já contratei algumas empresas</option>
                    <option <% If req("fase_planejamento") = "Estou no final, faltando pouca coisa para contratar" Then %>selected <%End if%>>Estou no final, faltando pouca coisa para contratar</option>
                    <option <% If req("fase_planejamento") = "Estou somente pesquisando" Then %>selected <%End if%>>Estou somente pesquisando</option>
                </select>
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