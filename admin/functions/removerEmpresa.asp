<!--#include file="../../config/conexao.asp"-->

<%
    Dim id
    id = request.querystring("id")
    SQL = "DELETE FROM lojistas WHERE id_lojista = " & id & ";"
    execQuery(SQL)
    Response.Redirect("../empresas.asp")
%>