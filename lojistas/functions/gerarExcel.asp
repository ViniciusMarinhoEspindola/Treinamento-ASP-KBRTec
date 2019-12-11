<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
    Response.AddHeader "Content-disposition", "attachment; filename=participantes.xls"
    Response.ContentType = "application/vnd.ms-excel"
%>
<!--#include file="../../config/conexao.asp"-->
<%
    If request.queryString("id") <> "" Then
        codigos = request.queryString("id")
        codigos = split(codigos, ",")
        cd = "'" & join(codigos, "','") & "'"
        id = replace(cd, "'", "")    
        SQL = "SELECT * FROM participantes WHERE id_participante in (" & cd & ");"
    'Else
    End if
    SET req = getConsulta(SQL)
%>



<meta charset="UTF-8">
<table border='1'>
    <thead>
    <tr>
        <th>Nome</th>
        <th>Tipo de Ingresso</th>
        <th>E-mail</th>
        <th>Telefone</th>
        <th>Data do Evento</th>
        <th>Fase de Planejamento</th>
    </tr>
    <%
        If not req.EOF Then
            do until req.EOF    
                response.write("<tr>")
                    response.write("<td>" & req("nome") & " " & req("sobrenome") & "</td>")
                    response.write("<td>" & req("tipo_de_ingresso") & "</td>")
                    response.write("<td>" & req("email") & "</td>")
                    response.write("<td>" & req("telefone") & "</td>")
                    response.write("<td>" & req("data_evento") & "</td>")
                    response.write("<td>" & req("fase_planejamento") & "</td>")
                response.write("</tr>")
                req.moveNext
            loop
        End if
    %>
</table>
