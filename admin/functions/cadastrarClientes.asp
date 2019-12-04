<%
    
    'Response.write(clientes)

    'ExcelFile = "c:\temp\unlocodes.xlsx"

    SET upl = Server.CreateObject("SoftArtisans.FileUp") 
    upl.Path = Server.MapPath("../uploads/")
    clientes = upl.Form("clientes")
    upl.Save

    ExcelFile = upl.Path & clientes
    SQL = "SELECT * FROM [Planilha1$]"
    
    Set ExcelConnection = Server.createobject("ADODB.Connection")
    ExcelConnection.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & ExcelFile & ";Extended Properties=""Excel 12.0 Xml;HDR=YES;IMEX=1"";"
    
    SET RS = Server.CreateObject("ADODB.Recordset")
    RS.Open SQL, ExcelConnection
    
    Response.Write "<table border=""1""><thead><tr>"
    
    FOR EACH Column IN RS.Fields
        Response.Write "<th>" & Column.Name & "</th>"
    NEXT
    
    Response.Write "</tr></thead><tbody>"
    
    IF NOT RS.EOF THEN
        WHILE NOT RS.eof
            Response.Write "<tr>"
            FOR EACH Field IN RS.Fields
                Response.Write "<td>" & Field.value & "</td>"
            NEXT
            Response.Write "</tr>"
            RS.movenext
        WEND
    END IF

    Response.Write "</tbody></table>"
    
    Set upl = Nothing 
    RS.close
    ExcelConnection.Close
%>