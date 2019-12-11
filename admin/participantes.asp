<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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


<div class="container mt-5">
    <%
        call getMessage()
    %>
    <div class="table-responsivee">
        <table id="table-participantes" class="table table-hover">
             <caption ><label><input type='checkbox' class="mr-auto" name='selecionar-tudo'> Selecionar tudo</label></caption>
            <thead class="bg-info text-light">
                <tr class='text-center'>
                    <th>Nome</th>
                    <th>Tipo de Ingresso</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Data do Evento</th>
                    <th>Fase de Planejamento</th>
                    <th>Editar</th>
                    <th>Excluir</th>
                </tr>
            </thead>  
            <tbody>
                <%
                    SQL = "SELECT id_participante, nome, sobrenome, tipo_de_ingresso, email, telefone, data_evento, fase_planejamento FROM participantes ORDER BY id_participante DESC;"
                    Set req = getConsulta(SQL)

                    If not req.EOF Then
                        do until req.EOF
                            response.write("")

                            response.write("<tr class='text-center'>")
                                response.write("<td>" & req("nome") & " " & req("sobrenome") & "</td>")
                                response.write("<td>" & req("tipo_de_ingresso") & "</td>")
                                response.write("<td>" & req("email") & "</td>")
                                response.write("<td>" & req("telefone") & "</td>")
                                response.write("<td>" & req("data_evento") & "</td>")
                                response.write("<td>" & req("fase_planejamento") & "</td>")
                                response.write("<td><a href='editarParticipante.asp?id=" & req("id_participante") & "'><i class='fa fa-pencil-square-o' aria-hidden='true'></i></a></td>")
                                response.write("<td><label class='checkbox'><input type='checkbox' name='remover-participante' value='" & req("id_participante") & "'></label></td>")
                            response.write("</tr>")
                            req.moveNext
                        loop
                    Else
                        response.write("Nonhum usuário encontrado")
                    End if
                %>
            </tbody>
            
        </table>
    </div>
    
    <button class="my-3 btn btn-danger" id="excluir-participantes">Excluir Registros</button>
    
</div>

<!--#include file="includes/footer.asp"-->
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/r-2.2.3/datatables.min.js"></script>
<script>
    // DataTable
    $(document).ready(function () {
        $('#table-participantes').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Portuguese-Brasil.json"
            },
            "order": [],
            "lengthMenu": [[5, 10], [5, 10]],
            
        });
       
    });

    var checkados = []
    $("#excluir-participantes").click(function () {
        $("input[name=remover-participante]:checked").each(function () {
            checkados.push("'" + $(this).val() + "'")
        });
        checkados = checkados.toString();
        //console.log(checkados)
        $.ajax({
            url: "functions/removerParticipantes.asp",
            method: "POST",
            data: {deletados: checkados},
            beforeSend : function(){
                $("#excluir-participantes").html("EXCLUINDO...");
                $("#excluir-participantes").attr("disabled", true);
                //$('#msg-status').html('<div class="alert alert-info col-12">Recebendo inscrição...</div>');
            },
            success: function(res){
                console.log(res)
            },
            error: function(res) {
                console.log(res);
            },
            complete: function() {
                $("#excluir-participantes").html("Excluido");
                $("#excluir-participantes").attr("disabled", false);
                setTimeout($("#excluir-participantes").html("Excluir Registros"), 2000)
                location.reload();
            }
        });
    });

    $("input[name=selecionar-tudo]").change(function () {
        if ($("input[name=selecionar-tudo]").is(":checked")) {
            $("input[name=remover-participante]").prop("checked", true)
        }
        else {
            $("input[name=remover-participante]").prop("checked", false)
        }
    });

</script>