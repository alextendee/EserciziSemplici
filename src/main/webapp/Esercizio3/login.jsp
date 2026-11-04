<%@page import="java.sql.*" %>
<%@page import="com.example.esercizisemplici.FunzioniDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ("1".equals(request.getParameter("logout"))) {
        session.removeAttribute("utenteAuto");
    }
%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Esercizio 3 - Login dipendenti</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../connessione.jsp" %>
            <div class="contenuto">
                <h2 class="sottotitolo">Esercizio 3 - Accesso riservato</h2>
                <%
                    if (session.getAttribute("utenteAuto") != null) {
                        response.sendRedirect("inserisci.jsp");
                        return;
                    }
                    String userid = request.getParameter("userid");
                    if (userid != null) {
                        String pwd = request.getParameter("pwd");
                        if (pwd == null) pwd = "";
                        userid = userid.trim();
                        pwd = pwd.trim();
                        if (userid.equals("") || pwd.equals("")) {
                            response.sendRedirect("erroreLogin.jsp");
                            return;
                        } else {
                            String sql = "SELECT * FROM dipendenti WHERE userid=" + funzioni.fc(userid) + " AND pwd=" + funzioni.fc(pwd);
                            ResultSet rs = funzioni.select(sql);
                            if (rs != null && rs.next()) {
                                session.setAttribute("utenteAuto", userid);
                                funzioni.closeResultSet(rs);
                                response.sendRedirect("inserisci.jsp");
                                return;
                            } else {
                                funzioni.closeResultSet(rs);
                                response.sendRedirect("erroreLogin.jsp");
                                return;
                            }
                        }
                    }
                %>
                <form class="modulo" method="post" action="login.jsp">
                    <label for="userid">Userid</label>
                    <input type="text" id="userid" name="userid" maxlength="50" required>
                    <label for="pwd">Password</label>
                    <input type="password" id="pwd" name="pwd" maxlength="50" required>
                    <br>
                    <input type="submit" value="Accedi">
                </form>
                <a class="bottone" href="../index.jsp">Torna alla home</a>
            </div>
        </div>
    </body>
</html>
