/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import model.Order;
import model.Product;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> getAllOrdersByUsername(String name) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "  FROM [Order]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("OD_ID"));

                Customer c = new Customer();
                c.setUsername(rs.getString("KH_Acount"));
                o.setCustomer(c);

                Product p = new Product();
                p.setId(rs.getString("SP_ID"));
                o.setProduct(p);

                o.setStatus(rs.getString("OD_Status").equals("1"));

                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getShoppingCartByUsername(String name) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Order] where OD_Status = 1 and KH_Account = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("OD_ID"));

                CustomerDAO cdb = new CustomerDAO();
                Customer c = cdb.getCustomer(name);
                o.setCustomer(c);

                ProductDAO pdb = new ProductDAO();
                Product p = pdb.getProductById(rs.getString("SP_ID"));
                o.setProduct(p);

                o.setStatus(true);

                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public ArrayList<Order> getPaidShoppingCartByUsername(String name) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Order] where OD_Status = 0 and KH_Account = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order o = new Order();

                o.setId(rs.getInt("OD_ID"));

                CustomerDAO cdb = new CustomerDAO();
                Customer c = cdb.getCustomer(name);
                o.setCustomer(c);

                ProductDAO pdb = new ProductDAO();
                Product p = pdb.getProductById(rs.getString("SP_ID"));
                o.setProduct(p);

                o.setStatus(true);

                orders.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }

    public void insertOrder(Order o) {
        try {
            String sql = "insert into [Order] (KH_Account, SP_ID, OD_Status) values(?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, o.getCustomer().getUsername());
            statement.setString(2, o.getProduct().getId());
            statement.setString(3, (o.isStatus() == true ? "1" : "0"));

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateOrder(Order o) { // (Thanh toan)
        try {
            String sql = "update [Order] set OD_Status = 0 where OD_ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, o.getId() + "");

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
