package com.bookstore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ViewSkillServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        String skill = (String) session.getAttribute("skill");

        List<String[]> bookList = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM books WHERE category = ?");
            ps.setString(1, skill);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] book = new String[5];
                book[0] = rs.getString("title");
                book[1] = rs.getString("author");
                book[2] = String.valueOf(rs.getDouble("price"));
                book[3] = rs.getString("category");
                book[4] = String.valueOf(rs.getInt("id"));
                bookList.add(book);
            }

            request.setAttribute("bookList", bookList);
            RequestDispatcher rd = request.getRequestDispatcher("bookSuggestions.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
