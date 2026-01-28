package com.servlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get data from form
        String id = request.getParameter("studentID");
        String name = request.getParameter("studentName");
        String course = request.getParameter("courseCode");

        // 2. Store name in Session
        HttpSession session = request.getSession();
        session.setAttribute("savedName", name);

        // 3. Use RequestDispatcher to forward to ConfirmationServlet
        RequestDispatcher dispatcher = request.getRequestDispatcher("ConfirmationServlet");
        dispatcher.forward(request, response);
    }
}