<!--#include file="../../config/conexao.asp"-->

<%
    Dim id, razao_social, nome, logotipo, celular, email, senha, upl
    
    
    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    upl.Path = "E:\Home\abmbrasilkbrtec\Web\vinicius\asp\admin\assets\images\logotipos\"

    id = upl.form("id")
    razao_social = upl.Form("razaoSocial")
    nome = upl.Form("nome")
    logotipo = upl.UserFilename
    celular = upl.Form("celular")
    email =  upl.Form("email")
    senha = upl.Form("senha")

    

    SETSQL = "SET nome='" & nome & "', email='" & email & "', razao_social='" & razao_social & "', celular='" & celular & "'"

    If logotipo <> "" Then
        SQL = "SELECT logotipo FROM lojistas WHERE id_lojista = " & id & ";"
        Set req = getConsulta(SQL)

        upl.Delete upl.Path & req("logotipo")
        SETSQL = SETSQL & ", logotipo='" & logotipo & "'" 

        upl.Save        
    End if

    If senha <> "" Then
        SETSQL = SETSQL & ", senha=md5('" & senha & "')"
    End iF

    SQL = "UPDATE lojistas " & SETSQL & " WHERE id_lojista = " & id & ";"

    execQuery(SQL)
    
    Set upl = Nothing 
    Response.Redirect("../empresas.asp")
%>