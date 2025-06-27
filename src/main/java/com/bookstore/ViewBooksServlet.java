package com.bookstore;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

public class ViewBooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        List<String[]> bookList = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM books");

            while (rs.next()) {
                String[] book = new String[6];
                book[0] = String.valueOf(rs.getInt("id"));
                book[1] = rs.getString("title");
                book[2] = rs.getString("author");
                book[3] = String.valueOf(rs.getDouble("price"));
                book[4] = String.valueOf(rs.getInt("quantity"));
                book[5] = rs.getString("category");
                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("bookList", bookList);
        RequestDispatcher rd = request.getRequestDispatcher("viewBooks.jsp");
        rd.forward(request, response);
    }
}
