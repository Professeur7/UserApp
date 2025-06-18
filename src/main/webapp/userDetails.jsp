<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:if test="${empty currentUser or empty users}">
<c:redirect url="userForm.jsp"/>
</c:if>




<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails Utilisateur</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .details-container {
            background-color: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 900px;
        }

        h2, h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        .user-info p {
            font-size: 18px;
            margin: 8px 0;
        }

        .user-count {
            text-align: center;
            margin-bottom: 20px;
            font-size: 18px;
            font-weight: bold;
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .actions button {
            background-color: #ff7e5f;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 8px 12px;
            margin-left: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .actions button:hover {
            background-color: #e74c3c;
        }

        .back-btn {
            display: block;
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            background-color: #2ecc71;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

        @media (max-width: 480px) {
            .user-list li {
                flex-direction: column;
                align-items: flex-start;
            }

            .actions {
                width: 100%;
                display: flex;
                justify-content: flex-end;
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
        <div class="user-count">
            Total enregistrés : <strong>${fn:length(users)}</strong>
        </div>

        <div class="user-list">
            <ul>
                <c:forEach var="u" items="${users}" varStatus="loop">
                    <li>
                        <div>
                            <strong>#${loop.index + 1}</strong> — <strong>Nom :</strong> ${u.nom} <br/>
                            <strong>Email :</strong> ${u.email}
                        </div>
                        <div class="actions">
						    <form action="servlet/EditUserServlet" method="get" style="display:inline;">
						        <input type="hidden" name="index" value="${loop.index}" />
						        <button type="submit">Modifier</button>
						    </form>
						    <form action="${pageContext.request.contextPath}/DeleteUserServlet" method="post" style="display:inline;">
						        <input type="hidden" name="index" value="${loop.index}" />
						        <button type="submit">Supprimer</button>
						    </form>

                            
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <!-- 🔙 Bouton retour vers le formulaire -->
        <form method="post" action="UserServlet">
            <input type="hidden" name="action" value="clear" />
            <input type="submit" class="back-btn" value="Retour au formulaire" />
        </form>
    </div>
</body>
</html>
