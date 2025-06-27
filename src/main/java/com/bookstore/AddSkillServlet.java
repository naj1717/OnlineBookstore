package com.bookstore;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddSkillServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String skill = request.getParameter("skill");

        HttpSession session = request.getSession();
        session.setAttribute("skill", skill);

        // Redirect to suggestion page
        response.sendRedirect("ViewSkillServlet");
    }
}
