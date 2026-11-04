<%@page import="java.sql.*" %>
<%@page import="com.example.esercizisemplici.FunzioniDB"%>
<%
    //come in ProvaAppartamenti: la connessione e' tenuta in sessione
    //database verifica con tabelle auto, dipendenti, marche
    FunzioniDB funzioni=(FunzioniDB)session.getAttribute("funzioni");
    if(funzioni==null){
        funzioni=new FunzioniDB("jdbc:mysql://localhost/verifica","root","");
        session.setAttribute("funzioni", funzioni);
    }
%>
