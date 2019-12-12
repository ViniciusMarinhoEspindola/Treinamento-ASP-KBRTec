<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../config/conexao.asp"-->
<!--#include file="includes/header.asp"-->
<!--#include file="../functions/functions.asp"-->
<%
    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    If upl.userFilename <> "" Then
        upl.Path = Server.MapPath("../uploads/")
        clientes = upl.userFilename
    
        validExt = Array("csv")
        fileNameArray = Split(clientes, ".")
        ext           = fileNameArray(UBound(fileNameArray))
        
        If UBound(Filter(validExt, ext)) = -1 Then
            Session("status") = "Erro"
            Session("message") = "A extensão " & ext & " não é uma extensão de arquivo válida."
            Response.Redirect("./")
        End if
    
        upl.Save
        CSVFile = upl.Path & "\" & clientes

        set fso = createobject("scripting.filesystemobject")
        'On Error Resume Next
        set objFile = fso.opentextfile(server.MapPath("../uploads/" & clientes))
        'If not err = 0 Then
            'Session("status") = "Erro"
            'Session("message") = "O arquivo enviado não corresponde ao formato padrão."
            'Response.Redirect("./")
        'End if


        cd = "'"
        Do Until objFile.AtEndOfStream
            linha = split(objFile.ReadLine,",")
            cd = cd & replace(linha(2),"""", "") & "','"
        Loop
        cd = left(cd, len(cd)-2)
        objFile.Close
    End if
    id = replace(cd, "'", "")        
    SQL = "SELECT distinct * FROM participantes WHERE id_participante in (" & cd & ");"
    SET req = getConsulta(SQL)
%>
<div class="container mt-5">
    <button class="btn btn-outline-info my-2" onclick="window.location.href='./'">Voltar</button>
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
                        email = "<table border='1'><thead><tr><th>Nome</th><th>Tipo de ingresso</th><th>E-mail</th><th>Telefone</th><th>Data do Evento</th><th>Fase de planejamento</th></tr></thead><tbody>"
                        do until req.EOF    
                            response.write("<tr class='text-center'>")
                                response.write("<td>" & req("nome") & " " & req("sobrenome") & "</td>")
                                response.write("<td>" & req("tipo_de_ingresso") & "</td>")
                                response.write("<td>" & req("email") & "</td>")
                                response.write("<td>" & req("telefone") & "</td>")
                                response.write("<td>" & req("data_evento") & "</td>")
                                response.write("<td>" & req("fase_planejamento") & "</td>")
                            response.write("</tr>")
                            email = email & "<tr><td>" & req("nome") & " " & req("sobrenome") & "</td> <td>" & req("tipo_de_ingresso") & "</td><td>" & req("email") & "</td><td>" & req("telefone") & "</td><td>" & req("data_evento") & "</td><td>" & req("fase_planejamento") & "</td></tr>"
                            req.moveNext
                        loop
                        email = email & "</tbody></table>"
                        call enviaEmail(Session("emailLojistas"), "Dados dos participantes", email)
                    End if              
                %>
            </tbody>
        </table>
    </div>
    <a href='functions/gerarExcel.asp?id=<% =id %>' class="text-light my-5 btn btn-info">Gerar Excel</a>
</div>

<!--#include file="includes/footer.asp"-->
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
<% 
    req.close
    upl.Delete
    Set upl = Nothing 
%>