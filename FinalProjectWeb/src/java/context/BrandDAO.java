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
import model.Brand;
import model.Customer;
import model.Product;
import model.TypeProduct;

public class BrandDAO extends DBContext{
    
    public Brand getBrandByID(String name) {
        Brand br = new Brand();
        try {
            String sql = "select * from HangSanXuat where HSX_NAME = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                
                br.setId(rs.getString("HSX_ID"));
                br.setName(rs.getString("HSX_NAME"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return br;
    }
    
    public Brand getBrandByID1(String name) {
        Brand br = new Brand();
        try {
            String sql = "select * from HangSanXuat where HSX_ID = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                
                br.setId(rs.getString("HSX_ID"));
                br.setName(rs.getString("HSX_NAME"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return br;
    }
    
    public static void main(String[] args) {
        BrandDAO b = new BrandDAO();
        Brand brands = b.getBrandByID("Apple");
        System.out.println(brands.getId());
    }
}
