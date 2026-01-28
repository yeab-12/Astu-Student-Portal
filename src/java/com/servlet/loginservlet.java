package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class loginservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // In a real app, you'd check the DB here. For now, let's just "login" the user.
        HttpSession session = request.getSession();
        session.setAttribute("user", "admin"); // This proves the user is logged in
        
        response.sendRedirect("student_management.jsp"); // Go to the CRUD page
    }
}