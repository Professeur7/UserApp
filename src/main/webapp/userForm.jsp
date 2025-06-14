<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Formulaire Utilisateur</title>
    <style>
        /* Structure globale */
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

        .form-container {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 26px;
            color: #ffffff;
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #f0f0f0;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: none;
            border-radius: 8px;
            background: #ffffff;
            color: #333;
            font-size: 15px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #ff7e5f;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #eb4d4b;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Formulaire Utilisateur</h2>
        <form method="post" action="UserServlet">
            <label for="nom">Nom :</label>
            <input type="text" id="nom" name="nom" placeholder="Entrez votre nom" required />

            <label for="email">Email :</label>
            <input type="email" id="email" name="email" placeholder="exemple@domaine.com" required />

            <input type="submit" value="Envoyer" />
        </form>
    </div>
</body>
</html>
