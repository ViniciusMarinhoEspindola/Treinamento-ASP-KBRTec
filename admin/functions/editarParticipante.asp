<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../../config/conexao.asp"-->
<!--#include file="../../functions/functions.asp"-->
<%
    Dim id, nome, tipo_de_ingresso, email, telefone, data_evento, fase_planejamento
    arrayNome = split(request.Form("nome"), " ")

    id = request.form("id")
    nome = arrayNome(0)
    sobrenome = replace(request.Form("nome"), arrayNome(0)& " ", "")
    tipo_de_ingresso = request.Form("tipo_de_ingresso")
    email = request.Form("email")
    telefone = request.Form("telefone")
    data_evento =  request.Form("data_evento")
    fase_planejamento = request.Form("fase_planejamento")


    SQL = "UPDATE participantes SET sobrenome='" & sobrenome & "',  tipo_de_ingresso='" & tipo_de_ingresso & "', data_evento='" & data_evento & "', nome='" & nome & "', telefone='" & telefone & "', email='" & email & "', fase_planejamento='" & fase_planejamento & "' WHERE id_participante = '" & id & "';"

    execQuery(SQL)

    Session("status") = "Sucesso"
    Session("message") = "O participante foi editado com sucesso."
    Response.Redirect("../participantes.asp")
%>