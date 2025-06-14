<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("currentUser");
    List<User> users = (List<User>) session.getAttribute("users");

    if (user == null || users == null) {
        response.sendRedirect("userForm.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails Utilisateur</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #fff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .details-container {
            background-color: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 600px;
        }

        h2, h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .user-info, .user-list {
            margin-bottom: 20px;
        }

        .user-info p {
            font-size: 18px;
            margin: 8px 0;
        }

        .user-list ul {
            list-style: none;
            padding: 0;
        }

        .user-list li {
            background-color: rgba(255, 255, 255, 0.1);
            margin: 10px 0;
            padding: 12px 16px;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            display: flex;
            justify-content: space-between;
        }

        @media (max-width: 480px) {
            .details-container {
                padding: 20px;
            }

            .user-list li {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <div class="details-container">
        <h2>Détails de l'utilisateur connecté</h2>
        <div class="user-info">
            <p><strong>Nom :</strong> ${currentUser.nom}</p>
            <p><strong>Email :</strong> ${currentUser.email}</p>
        </div>

        <h3>Liste des utilisateurs enregistrés</h3>
        <div class="user-list">
            <ul>
                <c:forEach var="u" items="${users}">
                    <li>
                        <span><strong>Nom:</strong> ${u.nom}</span>
                        <span><strong>Email:</strong> ${u.email}</span>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</body>
</html>
