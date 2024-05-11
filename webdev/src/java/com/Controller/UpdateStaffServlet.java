package com.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateStaffServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Update the staff information in the database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/onstar";
            String dbUsername = "root";
            String dbPassword = "admin";
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            String query = "UPDATE staff SET Staff_FName=?, Staff_LName=?, Staff_PhoneNo=?, Staff_Role=?, Staff_Username=?, Staff_Psw=? WHERE Staff_ID=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, fname);
            stmt.setString(2, lname);
            stmt.setString(3, phone);
            stmt.setString(4, role);
            stmt.setString(5, username);
            stmt.setString(6, password);
            stmt.setString(7, id);

            stmt.executeUpdate();
            stmt.close();
            conn.close();

            response.sendRedirect("ProfileStaff.jsp"); // Redirect to the profile page after successful update
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if an exception occurs
        }
    }
}
