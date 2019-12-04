<!--#include file="../../config/conexao.asp"-->

<%
    Dim razao_social, nome, logotipo, celular, email, senha, upl

    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    upl.Path = "E:\Home\abmbrasilkbrtec\Web\vinicius\asp\admin\assets\images\logotipos\"

    razao_social = upl.Form("razaoSocial")
    nome = upl.Form("nome")
    logotipo = upl.UserFilename
    celular = upl.Form("celular")
    email =  upl.Form("email")
    senha = upl.Form("senha")
    
    SQL = "INSERT INTO lojistas (razao_social, nome, email, senha, celular, logotipo) VALUES ('" & razao_social &"', '" & nome &"', '" & email &"', md5('" & senha &"'), '" & celular &"', '" & logotipo &"');"
    execQuery(SQL)
    
    upl.Save
    Set upl = Nothing 


    Response.Redirect("../empresas.asp")
%>