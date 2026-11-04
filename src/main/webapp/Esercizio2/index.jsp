<%@page import="java.sql.*" %>
<%@page import="com.example.esercizisemplici.FunzioniDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 2 - Targhe delle auto</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../connessione.jsp" %>
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 2 - Targhe delle auto</h2>
                <p>Cliccare su una targa per visualizzare i dettagli dell'auto in una nuova pagina.</p>
                <%
                    ResultSet rs = funzioni.select("SELECT targa FROM auto ORDER BY targa");
                    if (rs == null) {
                        out.println("<p class='msg-errore'>Errore di accesso al database. Controllare il file error.log.</p>");
                    } else {
                %>
                <table class="dati">
                    <tr><th>Targa</th><th>Dettaglio</th></tr>
                    <%
                        int n = 0;
                        while (rs.next()) {
                            n++;
                            String targa = rs.getString("targa");
                    %>
                    <tr>
                        <td><%= targa %></td>
                        <td><a href="dettaglio.jsp?targa=<%= java.net.URLEncoder.encode(targa, "UTF-8") %>" target="_blank">Dettagli</a></td>
                    </tr>
                    <%
                        }
                        funzioni.closeResultSet(rs);
                        if (n == 0) {
                            out.println("</table><p class='msg-info'>Nessuna auto presente in tabella.</p>");
                        } else {
                    %>
                </table>
                <p class="msg-ok">Trovate <%= n %> auto.</p>
                    <%
                        }
                    }
                %>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
