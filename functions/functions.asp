<!--#include file="../config/email.asp"-->
<%

Function consultarParticipantes(codigos)
    codigos = split(codigos, Chr(13))
    codigos(0) = " "&codigos(0)

    cd = "'"
    For Each codigo In codigos
        cd = cd & right(codigo, (len(codigo)-1)) & "','"
    Next
    cd = left(cd, (len(cd)-2))
    SET consultarParticipantes = cd
End Function

function sqlInjection(string)

    'Palavras que serão barradas caso encontradas nos request

    'palavrasDoMal = array("insert", "drop", " or ", "update", "cast", "'")
    palavrasDoMal = array("'", "´", " or ", "select", "insert", "delete", "drop", "update", "cast", ";", "--", "xp_", "order", "desc", "asc", "where", ".", ",", " ", "%20", "%")

    ' Verificando o que é passado pelo request.queryString

    for each x in palavrasDoMal
        if instr(lcase(string), x) Then
            'replace(string, )
           response.write("Injection")
        End if
    next
End function

function retornaNumeroAleatorio(qtd)
    str_aleatorio = ""
    if qtd="" or not isnumeric(qtd) then qtd=0
    for var_i=1 to qtd
        Randomize
        num_aleatorio = Int((10 * Rnd) + 1)
        num_aleatorio = num_aleatorio + 47
        str_aleatorio = str_aleatorio & chr( num_aleatorio )
    next
    retornaNumeroAleatorio = str_aleatorio
end function	

function geraNomeArquivo( ByVal extensao )
    dataRef = Now
    geraNomeArquivo =   Year(dataRef)   & "_" &_
                        Month(dataRef)  & "_" &_
                        Day(dataRef)    & "_" &_
                        Hour(dataRef)   & "_" &_
                        Minute(dataRef) & "_" &_
                        Second(dataRef) & "_" &_
                        retornaNumeroAleatorio(2) &_
                        retornaNumeroAleatorio(3) &_ 
                        "." &   extensao
end function

Sub enviaEmail(email, header, body)
    Set Mail = Server.CreateObject("Persits.MailSender")

    Mail.Host = HOST
    Mail.Port = 587
    Mail.Username = USERNAME
    Mail.Password = PASSWORD
    Mail.From = FROM
    'Mail.FromName = Mail.EncodeHeader("Nome", "iso-8859-1")
    Mail.AddAddress email
    Mail.Subject = Mail.EncodeHeader(header, "iso-8859-1")
    Mail.Body = body
    Mail.IsHTML = True
    
    On Error Resume Next
    Mail.Send

    If Err <> 0 Then
        Response.Write "Ocorreu um erro: " & Err.Description
    End If

    Set Mail = Nothing
End sub

Sub getMessage()
    If lcase(Session("status")) = "sucesso" Then
        %>
            <div class="alert alert-success">
                <% response.write(Session("message")) %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <%
        session("status") = ""
        session("message") = ""
    Elseif lcase(Session("status")) = "erro" Then
        %>
            <div class="alert alert-danger">
                <% response.write(Session("message")) %>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <%
        session("status") = ""
        session("message") = ""
    End if
End sub
%>