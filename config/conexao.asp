<%
    ConfigConn 		=	"Driver={MySQL ODBC 5.1 Driver};"&_
						"Server=bddev52.mysql.dbaas.com.br;"&_
						"Database=bddev52;"&_
						"User=bddev52;"&_
						"Password=dV38t@tsj251;"
    
    'If not req.EOF Then
        'for each x in req.Fields
            'response.write("<p>" & x.Value & "</p>")
        'next
    'Else
        'response.write("Nunhum usuário encontrado")
    'End if
%>
<!--#include file="../functions/sqlFunctions.asp"-->