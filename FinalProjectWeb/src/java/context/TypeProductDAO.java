/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package context;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;
import model.TypeProduct;

public class TypeProductDAO extends DBContext{
    public TypeProduct getTypeById (String id ){
        TypeProduct tp = new TypeProduct();
        try {
            
            String sql = "select LSP_NAME \n" +
                    "from LoaiSanPham where LSP_ID = ? ";
            
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()){
//                tp.setId(rs.getString("LSP_ID"));
                tp.setName(rs.getString("LSP_NAME"));
            }
           
            
        } catch (SQLException ex) {
            Logger.getLogger(TypeProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tp;
    }
    
    
    public static void main(String[] args) {
        TypeProductDAO tp = new TypeProductDAO();
        TypeProduct type = tp.getTypeById("L1");
        System.out.println(type.getName());
    }
}
