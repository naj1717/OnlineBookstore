package com.bookstore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection conn = DBConnection.getConnection();

            // Check if username already exists
            PreparedStatement check = conn.prepareStatement("SELECT * FROM users WHERE username=?");
            check.setString(1, username);
            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                request.setAttribute("error", "Username already taken!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Insert user
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users (name, email, username, password) VALUES (?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password); // For production, hash this

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
