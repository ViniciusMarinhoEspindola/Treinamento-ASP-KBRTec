
<!--#include file="includes/header.asp"-->
<!--#include file="../config/conexao.asp"-->
<!--#include file="../functions/functions.asp"-->
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
                <h5><a class="nav-link text-info mx-3" href="empresas.asp">Empresas <span class="sr-only">(página atual)</span></a></h5>
            </li>
            <li class="nav-item">
                <h5><a class="nav-link text-danger mx-3" href="functions/logout.asp">Sair</a></h5>
            </li>
        </ul>    
    </div>
</nav>

<div class="container mt-5">
    <%
        call getMessage()
    %>
    <table id="table-empresas" class="table table-hover">
        <thead class="bg-info text-light">
            <tr class='text-center'>
                <th>Logotipo</th>
                <th>Nome</th>
                <th>E-mail</th>
                <th>Razão Social</th>
                <th>Telefone</th>
                <th>Editar</th>
                <th>Remover</th>
            </tr>
        </thead>  
        <tbody>
            <%
                SQL = "SELECT id_lojista, razao_social, nome, email, celular, logotipo FROM lojistas WHERE permissao = 0 ORDER BY id_lojista DESC;"
                Set req = getConsulta(SQL)

                If not req.EOF Then
                    do until req.EOF
                        response.write("")

                        response.write("<tr class='text-center'>")
                            response.write("<td><img class='img-logo' src='assets/images/logotipos/" & req("logotipo") & "'></td>")
                            response.write("<td><span class='d-inline-block' style='max-width: 200px; word-wrap: break-word;'>" & req("nome") & "</span></td>")
                            response.write("<td><span class='d-inline-block' style='max-width: 200px; word-wrap: break-word;'>" & req("email") & "</span></td>")
                            response.write("<td><span class='d-inline-block' style='max-width: 200px; word-wrap: break-word;'>" & req("razao_social") & "</span></td>")
                            response.write("<td>" & req("celular") & "</td>")
                            response.write("<td><a href='editarEmpresa.asp?id=" & req("id_lojista") & "'><i class='tamanho-icone fa fa-pencil-square-o' aria-hidden='true'></i></a></td>")
                            response.write("<td><a href='functions/removerEmpresa.asp?id=" & req("id_lojista") & "'><i class='tamanho-icone fa fa-minus-square-o' aria-hidden='true'></i></a></td>")
                        response.write("</tr>")
                        req.moveNext
                    loop
                End if
            %>
        </tbody>
    </table>
</div>

<!--#include file="includes/footer.asp"-->
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/r-2.2.3/datatables.min.js"></script>
<script>
    // DataTable
    $(document).ready(function () {
        $('#table-empresas').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Portuguese-Brasil.json"
            },
            "order": [],
            "lengthMenu": [[5, 10], [5, 10]],
            
        });
    });
</script>