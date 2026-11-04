<%@page import="java.sql.*" %>
<%@page import="com.example.esercizisemplici.FunzioniDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 2 - Dettaglio auto</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../connessione.jsp" %>
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 2 - Dettaglio dell'auto</h2>
                <%
                    String targa = request.getParameter("targa");
                    if (targa == null) targa = "";
                    targa = targa.trim();
                    if (targa.equals("")) {
                        out.println("<p class='msg-errore'>Errore: nessuna targa selezionata.</p>");
                        out.println("<a class='bottone' href='index.jsp'>Torna all'elenco delle targhe</a>");
                    } else {
                        String sql = "SELECT * FROM auto WHERE targa=" + funzioni.fc(targa);
                        ResultSet rs = funzioni.select(sql);
                        if (rs == null) {
                            out.println("<p class='msg-errore'>Errore di accesso al database. Controllare il file error.log.</p>");
                        } else if (!rs.next()) {
                            out.println("<p class='msg-errore'>Errore: nessuna auto con targa " + targa + ".</p>");
                            out.println("<a class='bottone' href='index.jsp'>Torna all'elenco delle targhe</a>");
                            funzioni.closeResultSet(rs);
                        } else {
                %>
                <p class="msg-info">Dettagli dell'auto con targa <%= rs.getString("targa") %>:</p>
                <table class="dati">
                    <tr><th>Campo</th><th>Valore</th></tr>
                    <tr><td>Targa</td><td><%= rs.getString("targa") %></td></tr>
                    <tr><td>Modello</td><td><%= rs.getString("Modello") %></td></tr>
                    <tr><td>Marca</td><td><%= rs.getString("Marca") %></td></tr>
                    <tr><td>Anno</td><td><%= rs.getString("anno") %></td></tr>
                </table>
                <%
                            funzioni.closeResultSet(rs);
                        }
                    }
                %>
                <a class="bottone" href="index.jsp">Torna all'elenco delle targhe</a>
            </div>
        </div>
    </body>
</html>
