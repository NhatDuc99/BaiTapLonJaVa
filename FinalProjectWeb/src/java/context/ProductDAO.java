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

public class ProductDAO extends DBContext{
    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "  FROM [Sanpham]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getString("SP_ID"));
                pd.setName(rs.getString("SP_NAME"));
                pd.setQuantity(rs.getInt("SP_SL"));
                pd.setPrice(rs.getFloat("SP_GIA"));
                TypeProduct tp = new TypeProduct();
                tp.setId(rs.getString("SP_LOAISP"));
                pd.setTp(tp);
                
                Brand br = new Brand();
                br.setId(rs.getString("SP_HANGSX"));
                pd.setBr(br);
                pd.setImage(rs.getString("SP_IMAGE"));
                products.add(pd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public Product getProductById(String id){
        Product p = new Product();
        try {
            
            String sql = "select * from SanPham\n" +
                    "where SP_ID = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
                p.setId(rs.getString("SP_ID"));
                p.setName(rs.getString("SP_NAME"));
                p.setQuantity(rs.getInt("SP_SL"));
                p.setPrice(rs.getFloat("SP_GIA"));
                TypeProduct tp = new TypeProduct();
                tp.setId(rs.getString("SP_LOAISP"));
                p.setTp(tp);
                Brand br = new Brand();
                br.setId(rs.getString("SP_HANGSX"));
                p.setBr(br);
                p.setImage(rs.getString("SP_IMAGE"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    
    public ArrayList<Product> getProductByBrand(String brand) {
        BrandDAO bd = new BrandDAO();
        Brand b = bd.getBrandByID(brand);
        ArrayList<Product> products = getAllProduct();
        ArrayList<Product> productOneBrand = new ArrayList<>();
        
        for (Product p:products){
            if (p.getBr().getId().equals(b.getId())){
                productOneBrand.add(p);
            }
        }
        return productOneBrand;  
    }
    
    public ArrayList<Product> getProductByName(String name) {
//        BrandDAO bd = new BrandDAO();
//        Brand b = bd.getBrandByID(brand);
        ArrayList<Product> products = getAllProduct();
        ArrayList<Product> productSearch = new ArrayList<>();
        
        for (Product p : products) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                productSearch.add(p);
            }
        }
        return productSearch;
    }
    
    public ArrayList<Product> getProductByIdBrand(String id){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT *\n" +
                        "FROM [Sanpham] where SP_HANGSX = ? ";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Product pd = new Product();
                pd.setId(rs.getString("SP_ID"));
                pd.setName(rs.getString("SP_NAME"));
                pd.setQuantity(rs.getInt("SP_SL"));
                pd.setPrice(rs.getFloat("SP_GIA"));
                TypeProduct tp = new TypeProduct();
                tp.setId(rs.getString("SP_LOAISP"));
                pd.setTp(tp);

                Brand br = new Brand();
                br.setId(rs.getString("SP_HANGSX"));
                pd.setBr(br);
                pd.setImage(rs.getString("SP_IMAGE"));
                products.add(pd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    

    
    public static void main(String[] args) {
        ProductDAO pd =  new ProductDAO();
        ArrayList<Product> products = pd.getProductByIdBrand("H1");
        for (Product p : products){
            System.out.println(p.getName());
        }
//        Product p = pd.getProductById("SP1");
//        System.out.println(p.getName());
    }
}
