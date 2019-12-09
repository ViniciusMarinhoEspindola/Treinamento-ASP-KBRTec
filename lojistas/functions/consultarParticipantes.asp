<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../config/conexao.asp"-->
<!--#include file="../includes/header.asp"-->

<nav class="navbar navbar-expand-lg navbar-dark py-4 bg-info">     
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
        <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <h1 class="ml-auto mr-auto navbar-brand">Página do Lojista</h1>
    </div>
</nav>
<%
    'SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    'upl.Path = Server.MapPath("../uploads/")
    'clientes = upl.userFilename
    'upl.Save
    If request.Form("codigos") <> "" Then
        Dim codigos, SQL
        codigos = request.Form("codigos")
        codigos = split(codigos, Chr(13))
        codigos(0) = " "&codigos(0)

        cd = "'"
        For Each codigo In codigos
            cd = cd & right(codigo, (len(codigo)-1)) & "','"
        Next
        cd = left(cd, (len(cd)-2))
        
        SQL = "SELECT * FROM participantes WHERE id_participante in (" & cd & ");"
    End if
    SET req = getConsulta(SQL)

%>

<div class="container mt-5">
    <div class="table-responsivee">
        <table id="table-consulta-participantes" class="table table-hover">
            <thead class="bg-info text-light">
                <tr class='text-center'>
                    <th>Nome</th>
                    <th>Tipo de Ingresso</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Data do Evento</th>
                    <th>Fase de Planejamento</th>
                </tr>
            </thead>  
            <tbody>
                <%
                    If not req.EOF Then
                        do until req.EOF    
                            response.write("<tr class='text-center'>")
                                response.write("<td>" & req("nome") & " " & req("sobrenome") & "</td>")
                                response.write("<td>" & req("tipo_de_ingresso") & "</td>")
                                response.write("<td>" & req("email") & "</td>")
                                response.write("<td>" & req("telefone") & "</td>")
                                response.write("<td>" & req("data_evento") & "</td>")
                                response.write("<td>" & req("fase_planejamento") & "</td>")
                            response.write("</tr>")
                            'response.write(req("nome"))
                            req.moveNext
                        loop
                    End if
                %>
            </tbody>
        </table>
    </div>
</div>
<!--#include file="../includes/footer.asp"-->
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/r-2.2.3/datatables.min.js"></script>
<script>
    // DataTable
    $(document).ready(function () {
        $('#table-consulta-participantes').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Portuguese-Brasil.json"
            },
            "order": [],
            "lengthMenu": [[5, 10], [5, 10]],
            
        });
       
    });
</script>