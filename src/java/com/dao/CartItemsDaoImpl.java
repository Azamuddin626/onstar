/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

/**
 *
 * @author MySystem
 */
import com.model.CartItem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartItemsDaoImpl implements CartItemsDao {
    private final String DB_URL = "jdbc:mysql://localhost:3306/onstar";
    private final String DB_USERNAME = "root";
    private final String DB_PASSWORD = "admin";

    @Override
    public List<CartItem> getCartItems() {
        List<CartItem> cartItems = new ArrayList<>();

        try {
            // Create a database connection
            Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Prepare the SQL statement to retrieve cart items
            String sql = "SELECT * FROM cart";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Execute the query and retrieve the result set
            ResultSet resultSet = statement.executeQuery();

            // Iterate over the result set and create CartItem objects
            while (resultSet.next()) {
                int cartID = resultSet.getInt("Cart_ID");
                String customerID = resultSet.getString("Cust_ID");
                int productID = resultSet.getInt("Prod_ID");
                int quantity = resultSet.getInt("Order_Quantity");

                CartItem cartItem = new CartItem(cartID, customerID, productID, quantity);
                cartItems.add(cartItem);
            }

            // Close the resources
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle any errors that may occur during database interaction
        }

        return cartItems;
    }
}
