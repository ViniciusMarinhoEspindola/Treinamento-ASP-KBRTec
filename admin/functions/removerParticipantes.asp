<!--#include file="../../config/conexao.asp"-->
<%
    Dim deletados
    deletados = request.form("deletados")
    SQL = "Delete From participantes where id_participante in (" & deletados & ");"
    execQuery(SQL) 'Deleta o registro no banco'
    response.write("Deletado com sucesso!")
%>