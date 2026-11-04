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
        <title>Esercizio 3 - Salvataggio auto</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../connessione.jsp" %>
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 3 - Salvataggio nuova auto</h2>
                <%
                    String targa = request.getParameter("targa");
                    String modello = request.getParameter("Modello");
                    String marca = request.getParameter("Marca");
                    String anno = request.getParameter("anno");
                    if (targa == null) targa = "";
                    if (modello == null) modello = "";
                    if (marca == null) marca = "";
                    if (anno == null) anno = "";
                    targa = targa.trim();
                    modello = modello.trim();
                    marca = marca.trim();
                    anno = anno.trim();
                    if (targa.equals("") || modello.equals("") || marca.equals("") || anno.equals("")) {
                        out.println("<p class='msg-errore'>Errore: tutti i campi devono essere compilati.</p>");
                        out.println("<a class='bottone' href='inserisci.jsp'>Torna al modulo</a>");
                    } else if (funzioni.verificaEsistente("SELECT * FROM auto WHERE targa=" + funzioni.fc(targa))) {
                        out.println("<p class='msg-errore'>Errore: esiste gia' un'auto con targa " + targa + ".</p>");
                        out.println("<a class='bottone' href='inserisci.jsp'>Torna al modulo</a>");
                    } else {
                        String[] campi = {"targa", "Modello", "Marca", "anno"};
                        String[] valori = {funzioni.fc(targa), funzioni.fc(modello), funzioni.fc(marca), funzioni.fc(anno)};
                        boolean inserito = funzioni.update(campi, valori, "auto", true, false);
                        if (inserito) {
                            out.println("<p class='msg-ok'>Auto con targa " + targa + " inserita correttamente.</p>");
                            out.println("<a class='bottone' href='inserisci.jsp'>Inserisci un'altra auto</a> ");
                        } else {
                            out.println("<p class='msg-errore'>Errore durante l'inserimento. Controllare error.log.</p>");
                            out.println("<a class='bottone' href='inserisci.jsp'>Torna al modulo</a>");
                        }
                    }
                %>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
