<%
clientes = Request.Form("clientes")
Dim Conn, RS
Dim Campos, contador

'// CONECTAMOS COM O BANCO DE DADOS
Set Conn = CreateObject("ADODB.Connection")
With Conn
.Provider = "Microsoft.Jet.OLEDB.4.0"

'// Nesta linha perca que a conexão indica que utilizaremos um arquivo do Excel
.ConnectionString = "Data Source="& clientes &";Extended Properties=Excel 8.0;"
.Open
End With

'// AO CRIAR O RECORDSET, O SELECT INDICA O NOME DA PLANILHA DO ARQUIVO
Set RS = Conn.Execute("SELECT * FROM [Plan1$] ")

'// CONTAMOS QUANTAS LINHAS EXISTEM NO ARQUIVO
Campos = RS.Fields.Count

'// INICIAMOS O LOOP
response.write "<table border=""1"">"
    Do While RS.EOF = False
        response.write "<tr>"
        '// Aqui informamos os nomes das colunas para então lista os resultados
        response.write "<td><font size=1 face=verdana><b>" & RS("c1") & "</td>"
        response.write "<td><font size=1 face=verdana><b>" & RS("c2") & "</td>"
        response.write "<td><font size=1 face=verdana><b>" & RS("c3") & "</td>"
        response.write "</tr>"

        vc1 = RS("c1")
        vc2 = RS("c2")
        vc3 = RS("c3")

        RS.MoveNext
    Loop
response.write "</table>"

%>