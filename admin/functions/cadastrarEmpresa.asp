<!--#include file="../../config/conexao.asp"-->
<!--#include file="../../functions/functions.asp"-->

<%
    Dim razao_social, nome, logotipo, celular, email, senha, upl, fileNameArray, ext

    SET upl = Server.CreateObject("SoftArtisans.FileUp") 

    razao_social =  sqlInjection(upl.Form("razaoSocial"))
    nome = sqlInjection(upl.Form("nome"))
    celular = sqlInjection(upl.Form("celular"))
    email =  sqlInjection(upl.Form("email"))
    senha = sqlInjection(upl.Form("senha"))
    dadosUsuario = Array(razao_social, nome, celular, email,senha)
    
    If instr(join(dadosUsuario, ","), "injection") Then
        Session("status") = ""
        Session("message") = ""
        Response.Redirect("../empresas.asp")
    End if

    validExt = Array("png", "jpeg", "jpg", "gif")
    fileNameArray = Split(upl.UserFilename, ".")
    ext           = fileNameArray(UBound(fileNameArray))
    logotipo = geraNomeArquivo(ext)

    SQL = "SELECT id_lojista FROM lojistas WHERE email = '" & email & "';"
    Set req = getConsulta(SQL)

    If not req.EOF Then
        Session("dadosUsuario") = dadosUsuario
        Session("status") = "Erro"
        Session("message") = "Esse e-mail já foi cadastrado."
        Response.Redirect("../empresas-cadastrar.asp")
    End if

    If UBound(Filter(validExt, ext)) = -1 Then
        Session("dadosUsuario") = dadosUsuario
        Session("status") = "Erro"
        Session("message") = "A extensão " & ext & " não é uma extensão de imagem válida."
        Response.Redirect("../empresas-cadastrar.asp")
    Else    
        SQL = "INSERT INTO lojistas (razao_social, nome, email, senha, celular, logotipo) VALUES ('" & razao_social &"', '" & nome &"', '" & email &"', md5('" & senha &"'), '" & celular &"', '" & logotipo &"');"
        'execQuery(SQL)
        Response.write(SQL)
        'upl.SaveAs(Server.MapPath("..\assets\images\logotipos\"&logotipo))
        Set upl = Nothing 
        
        Session("status") = "Sucesso"
        Session("message") = "A empresa foi cadastrada com sucesso."
        'Response.Redirect("../empresas.asp")
    End if
%>