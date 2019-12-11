<!--#include file="../../config/conexao.asp"-->

<%
    Dim id
    id = request.querystring("id")
    
    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    upl.Path = "E:\Home\abmbrasilkbrtec\Web\vinicius\asp\admin\assets\images\logotipos\"

    SQL = "SELECT logotipo FROM lojistas WHERE id_lojista = " & id & ";"
    Set req = getConsulta(SQL)

    upl.Delete upl.Path & req("logotipo") 'Deleta a imagem'
    SQL = "DELETE FROM lojistas WHERE id_lojista = " & id & ";" 
    execQuery(SQL) 'Deleta o registro no banco'
    
    Set upl = Nothing 
    
    Session("status") = "Sucesso"
    Session("message") = "A empresa foi removida com sucesso."
    Response.Redirect("../empresas.asp")
%>