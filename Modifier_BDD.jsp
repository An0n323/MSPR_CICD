// Charger le pilote JDBC
Class.forName("org.mariadb.jdbc.Driver");

// Établir la connexion
Connection conn = DriverManager.getConnection(url, user, password);

// Exemple de requête SQL
String sql = "SELECT idFilm, titre, année FROM Film WHERE année >= 2000";
PreparedStatement pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

// Afficher les résultats (à adapter selon vos besoins)
while (rs.next()) {
    String idFilm = rs.getString("idFilm");
    String titre = rs.getString("titre");
    String année = rs.getString("année");

    // Faites ce que vous voulez avec les données...
    // Exemple d'affichage de 2 colonnes
    out.println("id : " + idFilm + ", titre : " + titre + ", année : " + année + "</br>");

    // Vérifier si l'ID du film correspond à celui choisi par l'utilisateur
    if (idFilm.equals(request.getParameter("idFilm"))) {
        // Afficher un formulaire pour modifier le titre du film
        out.println("<form action=\"modifierTitre.jsp\" method=\"post\">");
        out.println("<input type=\"hidden\" name=\"idFilm\" value=\"" + idFilm + "\">");
        out.println("<label for=\"nouveauTitre\">Nouveau titre : </label>");
        out.println("<input type=\"text\" name=\"nouveauTitre\">");
        out.println("<input type=\"submit\" value=\"Modifier\">");
        out.println("</form>");
    }
}

// Fermer les ressources 
rs.close();
pstmt.close();
conn.close();
%>
