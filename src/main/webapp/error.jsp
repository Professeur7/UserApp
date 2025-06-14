<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Erreur système</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .error-box {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            text-align: center;
        }

        h1 {
            font-size: 50px;
            margin-bottom: 10px;
            color: #fff;
        }

        h2 {
            margin-bottom: 20px;
            color: #ffe;
        }

        .message {
            background-color: rgba(0, 0, 0, 0.2);
            padding: 15px;
            border-radius: 10px;
            margin-top: 20px;
            font-size: 16px;
            color: #ffdddd;
        }

        .emoji {
            font-size: 60px;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 20px;
            border-radius: 8px;
            background-color: #fff;
            color: #ff4b2b;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        a:hover {
            background-color: #ff4b2b;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="error-box">
        <div class="emoji">😵</div>
        <h1>Oops !</h1>
        <h2>Une erreur est survenue</h2>
        <div class="message">
            <%= exception != null ? exception.getMessage() : "Erreur inconnue." %>
        </div>
        <a href="userForm.jsp">Retour au formulaire</a>
    </div>
</body>
</html>
