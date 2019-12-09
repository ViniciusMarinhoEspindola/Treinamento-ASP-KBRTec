<!--#include file="../../config/conexao.asp"-->
<%
    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    upl.Path = Server.MapPath("../uploads/")
    clientes = upl.userFilename
    upl.Save

    ExcelFile = upl.Path & "\" & clientes
    SQL = "SELECT * FROM [Lista de Participantes$]"
    
    Set ExcelConnection = Server.createobject("ADODB.Connection")
    ExcelConnection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ExcelFile & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;IMEX=1"";"

    SET RS = Server.CreateObject("ADODB.Recordset")
    RS.Open SQL, ExcelConnection
    
    IF NOT RS.EOF THEN
        Query = "SELECT id_participante FROM participantes;"
        Set req = getConsulta(Query)
        
        SQL = "INSERT INTO participantes (id_participante, nome, sobrenome, tipo_de_ingresso, email, telefone, data_evento, fase_planejamento) VALUES ("
        
        Dim campos(8)
        Dim cont
        
        WHILE NOT RS.eof
            cont = 0
            for each Field in RS.Fields
                campos(cont) = Field.value
                cont = cont + 1
            Next   
            If not req.EOF Then
                do until req.EOF
                    If campos(0) = req("id_participante") Then
                        consulta = true
                    End if
                    req.movenext
                loop
                req.movefirst
            End if
            If consulta = false Then
                telefone = campos(5) & campos(6)                
                SQL = SQL & "'" & campos(0) & "','" & campos(1) & "','" & campos(2) & "','" & campos(3) & "','" & campos(4) & "','" & telefone & "',STR_TO_DATE('" & campos(7) & "','%d/%m/%Y'), '" & campos(8) & "'"
            End if
            consulta = false
            SQL = SQL & "),("
            RS.movenext
        WEND
        SQL = left(SQL,(len(SQL)-2)) & ";"
        SQL = replace(SQL, "(),", "")
        SQL = replace(SQL, ",()", "")

        execQuery(SQL)
    END IF

    RS.close
    ExcelConnection.Close
    
    upl.Delete
    
    Set upl = Nothing 

    Response.Redirect("../clientes-cadastrar.asp")
%>