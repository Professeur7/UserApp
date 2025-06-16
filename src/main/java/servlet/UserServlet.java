package servlet;

import model.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String action = request.getParameter("action");

        // ✅ Si l'action est "clear", on vide la session
        if ("clear".equals(action)) {
            HttpSession session = request.getSession();
            session.invalidate(); // ou session.removeAttribute("users"); uniquement
            response.sendRedirect("userForm.jsp");
            return;
        }

        // ✅ Sinon, on continue avec l'ajout de l'utilisateur
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");

        if (nom == null || nom.trim().isEmpty() || email == null || email.trim().isEmpty()) {
            request.setAttribute("message", "Nom et Email sont obligatoires !");
            request.getRequestDispatcher("userForm.jsp").forward(request, response);
            return;
        }

        User user = new User(nom, email);
        HttpSession session = request.getSession();

        // Gestion de la liste en session
        List<User> users = (List<User>) session.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>();
        }
        users.add(user);

        session.setAttribute("currentUser", user);
        session.setAttribute("users", users);

        response.sendRedirect("userDetails.jsp");
    }
}
