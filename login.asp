<!--#include file="config/conexao.asp"-->
<% 
    email =  Request.Form("email")
    senha = Request.Form("senha")

    SQL = "SELECT email, senha, permissao FROM lojistas WHERE email = '" & email & "' AND senha = md5('" & senha & "');"
    Set req = getConsulta(SQL)

    If not req.EOF Then
        If req("permissao") Then
            Session("admin") = true
            Response.Redirect("admin/")
        Else
            Session("lojistas") = true
            Response.Redirect("lojistas/")
        End if
    Else
        Session.Abandon
        Response.write("Nenhum registro encontrado")
    End if
%>