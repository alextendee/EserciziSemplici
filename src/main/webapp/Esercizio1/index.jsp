<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int v1 = 0, v2 = 0, v3 = 0;
    double media = 0;
    String errore = null;
    String s1 = request.getParameter("v1");
    String s2 = request.getParameter("v2");
    String s3 = request.getParameter("v3");
    if (s1 != null || s2 != null || s3 != null) {
        if (s1 == null) s1 = "";
        if (s2 == null) s2 = "";
        if (s3 == null) s3 = "";
        s1 = s1.trim(); s2 = s2.trim(); s3 = s3.trim();
        try {
            int t1 = Integer.parseInt(s1);
            int t2 = Integer.parseInt(s2);
            int t3 = Integer.parseInt(s3);
            if (t1 < 1 || t1 > 10 || t2 < 1 || t2 > 10 || t3 < 1 || t3 > 10) {
                errore = "Errore: i tre valori devono essere interi compresi tra 1 e 10.";
            } else {
                v1 = t1; v2 = t2; v3 = t3;
                media = (v1 + v2 + v3) / 3.0;
            }
        } catch (NumberFormatException e) {
            errore = "Errore: i tre valori devono essere interi compresi tra 1 e 10.";
        }
    }
%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 1 - Media di tre valori</title>
    </head>
    <body>
        <div class="container">
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 1 - Media di tre valori da 1 a 10</h2>
                <p>Inserire tre valori interi compresi tra 1 e 10.</p>

                <form class="modulo" method="post" action="index.jsp">
                    <label for="v1">Primo valore</label>
                    <select name="v1" id="v1" required>
                        <option value="">--- scegli ---</option>
                        <% for (int i = 1; i <= 10; i++) { %>
                        <option value="<%= i %>"<%= (i == v1 ? " selected" : "") %>><%= i %></option>
                        <% } %>
                    </select>

                    <label for="v2">Secondo valore</label>
                    <select name="v2" id="v2" required>
                        <option value="">--- scegli ---</option>
                        <% for (int i = 1; i <= 10; i++) { %>
                        <option value="<%= i %>"<%= (i == v2 ? " selected" : "") %>><%= i %></option>
                        <% } %>
                    </select>

                    <label for="v3">Terzo valore</label>
                    <select name="v3" id="v3" required>
                        <option value="">--- scegli ---</option>
                        <% for (int i = 1; i <= 10; i++) { %>
                        <option value="<%= i %>"<%= (i == v3 ? " selected" : "") %>><%= i %></option>
                        <% } %>
                    </select>

                    <br>
                    <input type="submit" value="Calcola media">
                </form>

                <% if (errore != null) { %>
                <p class='msg-errore'><%= errore %></p>
                <% } %>
                <p class='msg-ok'>Valori inseriti: <%= v1 %>, <%= v2 %>, <%= v3 %><br>Media: <%= String.format("%.2f", media) %></p>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
