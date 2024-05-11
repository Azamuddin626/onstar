/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

/**
 *
 * @author MySystem
 */
import com.model.Staff;
import java.sql.*;

public class StaffDAO {
    private final String url = "jdbc:mysql://localhost/onstar";
    private final String username = "root";
    private final String password = "admin";

    public Staff getStaffById(String staffId) {
        Staff staff = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            String query = "SELECT * FROM staff WHERE Staff_ID = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, staffId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                staff = new Staff();
                staff.setStaffId(rs.getString("Staff_ID"));
                staff.setStaffFName(rs.getString("Staff_FName"));
                staff.setStaffLName(rs.getString("Staff_LName"));
                staff.setStaffPhoneNo(rs.getString("Staff_PhoneNo"));
                staff.setStaffRole(rs.getString("Staff_Role"));
                staff.setStaffUsername(rs.getString("Staff_Username"));
                staff.setStaffPsw(rs.getString("Staff_Psw"));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close connections and resources
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return staff;
    }

    public void updateStaff(Staff staff) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            String query = "UPDATE staff SET Staff_FName = ?, Staff_LName = ?, Staff_PhoneNo = ?, Staff_Role = ?, Staff_Username = ?, Staff_Psw = ? WHERE Staff_ID = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, staff.getStaffFName());
            stmt.setString(2, staff.getStaffLName());
            stmt.setString(3, staff.getStaffPhoneNo());
            stmt.setString(4, staff.getStaffRole());
            stmt.setString(5, staff.getStaffUsername());
            stmt.setString(6, staff.getStaffPsw());
            stmt.setString(7, staff.getStaffId());
            stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close connections and resources
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

