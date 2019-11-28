<%
    DataSource 		=	"Driver={MySQL ODBC 5.1 Driver};"&_
						"Server=bddev52.mysql.dbaas.com.br;"&_
						"Database=bddev52;"&_
						"User=bddev52;"&_
						"Password=dV38t@tsj251;"
                
    Set Conexao = Server.CreateObject("ADODB.Connection")
    Conexao.CursorLocation = 3
    Conexao.Open DataSource
    
    Set req = Server.CreateObject("ADODB.Recordset")
    

    SQL = "SELECT * FROM lojistas;"

    req.Open SQL, Conexao, 3
    
    If not req.EOF Then
        for each x in req.Fields
            'ESQUECE ESSE IF
            response.write("<p>" & x.Value & "</p>")
        next
    Else
        response.write("Nunhum usuário encontrado")
    End if

    
    'Set consulta = nothing
    
    'set teste = Conexao.Execute("SELECT * FROM users")

    'response.Write teste("name")
%>