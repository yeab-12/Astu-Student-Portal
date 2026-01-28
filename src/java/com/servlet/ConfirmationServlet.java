package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ConfirmationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 1. Read University Name from web.xml (init parameter)
        String univ = getServletContext().getInitParameter("universityName");

        // 2. Get name from Session
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("savedName");

        // 3. Get registration details from request
        String id = request.getParameter("studentID");
        String course = request.getParameter("courseCode");

        // 4. Display output
        out.println("<html><body>");
        out.println("<h1>Registration Successful!</h1>");
        out.println("<p>University: " + univ + "</p>");
        out.println("<p>Welcome, " + name + " (ID: " + id + ")</p>");
        out.println("<p>You have registered for: " + course + "</p>");
        out.println("<br><a href='student_manager.jsp'>Go to Student Management System</a>");
        out.println("</body></html>");
        
    }
}