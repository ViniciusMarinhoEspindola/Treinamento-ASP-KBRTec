<!--#include file="../../config/conexao.asp"-->

<%
    Dim id, razao_social, nome, logotipo, celular, email, senha
    
    id = request.form("id")
    razao_social = Request.Form("razaoSocial")
    nome = Request.Form("nome")
    logotipo = Request.Form("logo")
    celular = Request.Form("celular")
    email =  Request.Form("email")
    senha = Request.Form("senha")


    SETSQL = "SET nome='" & nome & "', email='" & email & "', razao_social='" & razao_social & "', celular='" & celular & "'"

    If logotipo <> "" Then
        SETSQL = SETSQL & ", logotipo='" & logotipo & "'" 
    End if

    If senha <> "" Then
        SETSQL = SETSQL & ", senha=md5('" & senha & "')"
    End iF

    SQL = "UPDATE lojistas " & SETSQL & " WHERE id_lojista = " & id & ";"

    execQuery(SQL)
    Response.Redirect("../empresas.asp")
%>