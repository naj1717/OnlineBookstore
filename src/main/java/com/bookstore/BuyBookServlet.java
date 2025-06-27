package com.bookstore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class BuyBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String[] selectedBookIds = request.getParameterValues("bookIds");

        if (selectedBookIds != null && selectedBookIds.length > 0) {
            try {
                Connection conn = DBConnection.getConnection();
                HttpSession session = request.getSession();
                List<String[]> cart = (List<String[]>) session.getAttribute("cart");
                if (cart == null) cart = new ArrayList<>();

                for (String bookId : selectedBookIds) {
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
                    ps.setInt(1, Integer.parseInt(bookId));
                    ResultSet rs = ps.executeQuery();

                    if (rs.next()) {
                        String[] book = new String[3];
                        book[0] = rs.getString("title");
                        book[1] = rs.getString("author");
                        book[2] = String.valueOf(rs.getDouble("price"));
                        cart.add(book);
                    }
                }

                session.setAttribute("cart", cart);
                response.sendRedirect("cart.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred: " + e.getMessage());
            }
        } else {
            // If no books selected, redirect with a message (optional)
            response.sendRedirect("bookSuggestions.jsp");
        }
    }
}
