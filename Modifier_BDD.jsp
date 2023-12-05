<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>Modification titre film</title>
</head>
<body>

<%
//Formulaire de modification  
%>
<form method="post">
ID film: <input type="text" name="id">  
Nouveau titre: <input type="text" name="titre">
<input type="submit" value="Modifier">
</form>

<%
//Récupération des paramètres
String id = request.getParameter("id");
String nouveauTitre = request.getParameter("titre");

if(id != null && nouveauTitre != null) {

//Connexion à la BD  
try(Connection conn = DriverManager.getConnection(...)) {

//Requête de mise à jour
String sql = "UPDATE Film SET titre=? WHERE idFilm=?";

try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
  
pstmt.setString(1, nouveauTitre);  
pstmt.setInt(2, Integer.parseInt(id));

int nbRows = pstmt.executeUpdate();

//Message de confirmation
if(nbRows > 0) out.println("Titre modifié"); 
else out.println("Echec modification");

}
}
}
%>

</body>
</html>
