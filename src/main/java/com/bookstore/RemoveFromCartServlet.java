package com.bookstore;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class RemoveFromCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        int index = Integer.parseInt(request.getParameter("index"));
        HttpSession session = request.getSession();
        List<String[]> cart = (List<String[]>) session.getAttribute("cart");

        if(cart != null && index >= 0 && index < cart.size()) {
            cart.remove(index);
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}
