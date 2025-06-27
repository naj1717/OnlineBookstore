package com.bookstore;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class PayNowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.setContentType("text/html");
            response.getWriter().println("<h3 style='color:red;'>❌ Your cart is empty.</h3>");
            return;
        }

        // Calculate total
        double totalAmount = 0;
        for (String[] book : cart) {
            try {
                totalAmount += Double.parseDouble(book[2]);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // Save total temporarily (you may also save it in DB if needed)
        session.setAttribute("paymentAmount", totalAmount);

        // Redirect to bill view page (we'll clear cart there after display)
        response.sendRedirect("viewBill.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().println("<h3>GET not supported</h3>");
    }
}
