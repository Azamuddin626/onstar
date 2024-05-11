/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;

import com.Model.Staff;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditStaffServlet extends HttpServlet {

    private StaffDAO staffDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        staffDAO = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the staff ID from the request parameter
        String staffId = request.getParameter("id");

        // Retrieve the staff information from the DAO
        Staff staff = staffDAO.getStaffById(staffId);

        // Set the staff object as an attribute in the request
        request.setAttribute("staff", staff);

        // Forward the request to the JSP page for rendering the edit form
        request.getRequestDispatcher("editStaff.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the updated staff information from the request parameters
        String staffId = request.getParameter("id");
        String staffFName = request.getParameter("fname");
        String staffLName = request.getParameter("lname");
        String staffPhoneNo = request.getParameter("phone");
        String staffRole = request.getParameter("roles");
        String staffUsername = request.getParameter("username");
        String staffPsw = request.getParameter("password");

        // Create a staff object with the updated information
        Staff staff = new Staff();
        staff.setStaffId(staffId);
        staff.setStaffFName(staffFName);
        staff.setStaffLName(staffLName);
        staff.setStaffPhoneNo(staffPhoneNo);
        staff.setStaffRole(staffRole);
        staff.setStaffUsername(staffUsername);
        staff.setStaffPsw(staffPsw);

        // Update the staff information in the database
        staffDAO.updateStaff(staff);

        // Redirect the user back to the profile page
        response.sendRedirect("ProfileStaff.jsp");
    }
}
