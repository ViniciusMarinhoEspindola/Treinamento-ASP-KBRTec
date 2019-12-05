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
        WHILE NOT RS.eof
            SQL = "INSERT INTO participantes (id_participante, nome, sobrenome, tipo_de_ingresso, email, telefone, data_evento, fase_planejamento) VALUES ("
            FOR EACH Column IN RS.Fields
                If Column.Name = "Informe seu telefone celular: Ex: 13 99999-9999" Then
                    telefone = RS(Column.Name)
                Else 
                    If Column.Name = "Informe seu telefone celular: Ex: 13 99999-99991" Then
                        telefone = telefone & RS(Column.Name)
                        SQL = SQL & "'" & telefone & "',"
                    Else
                        If IsDate(RS(Column.Name)) Then
                            SQL = SQL & "STR_TO_DATE('" & RS(Column.Name) & "','%d/%m/%Y'),"
                        Else
                            SQL = SQL & "'" & RS(Column.Name) & "',"
                        End If
                    End If
                End If
            NEXT
            telefone = ""
            
            SQL = left(SQL,(len(SQL)-1))
            SQL = SQL & ");"
            execQuery(SQL)
            RS.movenext
        WEND
    END IF

    RS.close
    ExcelConnection.Close
    
    upl.Delete
    
    Set upl = Nothing 

    'Response.Redirect("../clientes-cadastrar.asp")
%>