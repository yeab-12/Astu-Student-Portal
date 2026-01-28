package com.servlet;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class studentservlet extends HttpServlet {
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    // This tells the servlet to use the same logic for GET as it does for POST
    doPost(request, response); 
}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // 1. SESSION CHECK (Assignment Requirement)
        // Checks if user came from the registration page
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("savedName") == null) {
            response.sendRedirect("register.html");
            return;
        }

        // 2. INCLUDE COMMON HEADER (RequestDispatcher Requirement)
        out.println("<div style='background: #333; color: white; padding: 10px;'>ASTU STUDENT SYSTEM HEADER</div>");

        String action = request.getParameter("action");
        String message = "";

        try (Connection conn = DBConnection.getConnection()) {
            if ("create".equals(action)) {
                // INSERT (Using PreparedStatement as required)
                String sql = "INSERT INTO student (id, name, department) VALUES (?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(request.getParameter("id")));
                ps.setString(2, request.getParameter("name"));
                ps.setString(3, request.getParameter("dept"));
                ps.executeUpdate();
                message = "Student Added Successfully!";
            } 
            else if ("delete".equals(action)) {
                // DELETE (Using PreparedStatement as required)
                String sql = "DELETE FROM student WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(request.getParameter("id")));
                int rows = ps.executeUpdate();
                message = (rows > 0) ? "Student Deleted!" : "Student ID not found.";
            }

            // 3. FORWARD TO RESULT PAGE (RequestDispatcher Requirement)
            request.setAttribute("msg", message);
            RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}