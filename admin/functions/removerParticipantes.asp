<!--#include file="../../config/conexao.asp"-->
<%
    Dim deletados
    deletados = request.form("deletados")
    SQL = "Delete From participantes where id_participante in (" & deletados & ");"
    execQuery(SQL) 'Deleta o registro no banco'
    Session("status") = "Sucesso"
    Session("message") = "O(s) participante(s) foi(foram) deletado(s) com sucesso."
%>