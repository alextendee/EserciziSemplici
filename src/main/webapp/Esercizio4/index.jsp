<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 4 - Contatore visite</title>
    </head>
    <body>
        <div class="container">
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 4 - Numero di visualizzazioni totali</h2>
                <%! private int visiteTotali = 0; %>
                <%
                    //NON si usano servlet, database e file: solo una semplice variabile.
                    //Ogni volta che qualcuno apre la pagina, la variabile aumenta di 1.
                    //Si azzera solo quando l'applicazione viene riavviata.
                    visiteTotali = visiteTotali + 1;
                    out.println("<p class='msg-ok'>Questa pagina e' stata visualizzata " + visiteTotali + " volte.</p>");
                %>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
