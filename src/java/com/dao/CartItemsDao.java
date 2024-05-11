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
import java.util.List;

public interface CartItemsDao {
    List<CartItem> getCartItems();
}

