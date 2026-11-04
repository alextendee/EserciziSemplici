<%@page import="java.sql.*" %>
<%@page import="com.example.esercizisemplici.FunzioniDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 5 - Nuova auto con marca da lista</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../connessione.jsp" %>
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 5 - Inserimento nuova auto</h2>
                <form class="modulo" action="salva.jsp" method="post">
                    <label for="targa">Targa</label>
                    <input type="text" id="targa" name="targa" maxlength="50" required>
                    <label for="modello">Modello</label>
                    <input type="text" id="modello" name="Modello" maxlength="50" required>
                    <label for="marca">Marca</label>
                    <select name="Marca" id="marca" required>
                        <option value="">--- seleziona una marca ---</option>
                        <%
                            ResultSet rs = funzioni.select("SELECT descrizione FROM marche ORDER BY descrizione");
                            while (rs.next()) {
                        %>
                        <option value="<%= rs.getString("descrizione") %>"><%= rs.getString("descrizione") %></option>
                        <%
                            }
                            funzioni.closeResultSet(rs);
                        %>
                    </select>
                    <label for="anno">Anno</label>
                    <input type="text" id="anno" name="anno" maxlength="4" required>
                    <br>
                    <input type="submit" value="Inserisci auto">
                </form>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
