package com.bookstore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            Connection conn = DBConnection.getConnection();
            System.out.println("📌 Servlet - Is connection null? " + (conn == null));
            PreparedStatement ps = conn.prepareStatement("INSERT INTO books (title, author, price, quantity) VALUES (?, ?, ?, ?)");
            ps.setString(1, title);
            ps.setString(2, author);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);

            ps.executeUpdate();
           response.sendRedirect("viewBooks.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
