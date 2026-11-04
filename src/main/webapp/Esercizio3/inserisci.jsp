<%@page import="java.sql.*" %>
<%@page import="com.example.esercizisemplici.FunzioniDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("utenteAuto") == null) {
        response.sendRedirect("errore.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 3 - Inserimento nuova auto</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../connessione.jsp" %>
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 3 - Inserimento di una nuova auto</h2>
                <p class="msg-info">Utente loggato: <%= session.getAttribute("utenteAuto") %> (<a href="login.jsp?logout=1">Logout</a>)</p>
                <form class="modulo" action="salva.jsp" method="post">
                    <label for="targa">Targa</label>
                    <input type="text" id="targa" name="targa" maxlength="50" required>
                    <label for="modello">Modello</label>
                    <input type="text" id="modello" name="Modello" maxlength="50" required>
                    <label for="marca">Marca</label>
                    <input type="text" id="marca" name="Marca" maxlength="50" required>
                    <label for="anno">Anno (4 cifre)</label>
                    <input type="text" id="anno" name="anno" maxlength="4" required>
                    <br>
                    <input type="submit" value="Inserisci auto">
                </form>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
