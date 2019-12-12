<!--#include file="../../config/conexao.asp"-->
<!--#include file="../../functions/functions.asp"-->

<%
    Dim id, razao_social, nome, logotipo, celular, email, senha, upl
    
    
    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    upl.Path = "E:\Home\abmbrasilkbrtec\Web\vinicius\asp\admin\assets\images\logotipos\"

    id = upl.form("id")
    razao_social = limpar(upl.Form("razaoSocial"))
    nome = limpar(upl.Form("nome"))
    logotipo = upl.UserFilename
    celular = limpar(upl.Form("celular"))
    email =  limpar(upl.Form("email"))
    senha = limpar(upl.Form("senha"))

    SQL = "SELECT id_lojista FROM lojistas WHERE email = '" & email & "' AND id_lojista != '" & id & "';"
    Set req = getConsulta(SQL)

    If not req.EOF Then
        Session("status") = "Erro"
        Session("message") = "Esse e-mail já foi cadastrado."
        Response.Redirect("../empresas.asp")
    End if

    
    SETSQL = "SET nome='" & nome & "', email='" & email & "', razao_social='" & razao_social & "', celular='" & celular & "'"

    If logotipo <> "" Then
        validExt = Array("png", "jpeg", "jpg", "gif")
        fileNameArray = Split(upl.UserFilename, ".")
        ext           = fileNameArray(UBound(fileNameArray))
        If UBound(Filter(validExt, ext)) = -1 Then
            Session("status") = "Erro"
            Session("message") = "A extensão " & ext & " não é uma extensão de imagem válida."
            Response.Redirect("../editarEmpresa.asp?id="&id)
        Else    
            SQL = "SELECT logotipo FROM lojistas WHERE id_lojista = " & id & ";"
            Set req = getConsulta(SQL)

            upl.Delete upl.Path & req("logotipo")
            SETSQL = SETSQL & ", logotipo='" & logotipo & "'" 

            upl.Save
        End if
    End if

    If senha <> "" Then
        SETSQL = SETSQL & ", senha=md5('" & senha & "')"
    End iF

    
    SQL = "UPDATE lojistas " & SETSQL & " WHERE id_lojista = " & id & ";"
    execQuery(SQL)
    
    Set upl = Nothing 
    
    Session("status") = "Sucesso"
    Session("message") = "A empresa foi alterada com sucesso."
    Response.Redirect("../empresas.asp")
%>