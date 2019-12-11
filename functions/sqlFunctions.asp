<%
    Function getConection()
        Set Conn = Server.CreateObject("AdoDb.Connection")
        Conn.CursorLocation = 3
        Conn.Open ConfigConn
        Set getConection = Conn
    End Function

    Function getConsulta(query) 
        Set Conn = getConection()
        Set req = Server.CreateObject("AdoDb.RecordSet")
       'Conn.ActiveConnection = Nothing
        req.Open query, Conn, 3
        'Conn.Close
        Set Conn = Nothing
        Set getConsulta = req
    End Function

    Function execQuery(query)
        Set Conn = getConection()

        on error resume next
        Conn.Execute query
    End Function
%>