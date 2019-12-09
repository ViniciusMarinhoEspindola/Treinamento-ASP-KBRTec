<%

Function consultarParticipantes(codigos)
    codigos = split(codigos, Chr(13))
    codigos(0) = " "&codigos(0)

    cd = "'"
    For Each codigo In codigos
        cd = cd & right(codigo, (len(codigo)-1)) & "','"
    Next
    cd = left(cd, (len(cd)-2))
    consultarParticipantes = cd
End Function


%>