package com.servlet;

import com.dao.ProductDAO;
import com.model.Product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {

    private Connection connection;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            // Initialize database connection
            String jdbcURL = "jdbc:mysql://localhost:3306/onstar";
            String jdbcUsername = "root";
            String jdbcPassword = "admin";
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Initialize ProductDAO
            productDAO = new ProductDAO(connection);
        } catch (SQLException ex) {
            throw new ServletException("Error initializing database connection", ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve all products from the database
            List<Product> products = productDAO.getAllProducts();

            // Set the products as a request attribute
            request.setAttribute("products", products);

            // Forward the request to the product.jsp page for displaying the products
            request.getRequestDispatcher("catalog.jsp").forward(request, response);
        } catch (SQLException ex) {
            throw new ServletException("Error retrieving products from the database", ex);
        }
    }

    @Override
    public void destroy() {
        super.destroy();
        try {
            // Close the database connection
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException ex) {
            System.err.println("Error closing database connection: " + ex.getMessage());
        }
    }
}
