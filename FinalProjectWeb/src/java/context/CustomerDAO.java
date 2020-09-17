package context;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

public class CustomerDAO extends DBContext {

    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> customers = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "  FROM [Khachhang]";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Customer cs = new Customer();
                cs.setName(rs.getString("KH_Name"));
                cs.setEmail(rs.getString("KH_Email"));
                cs.setUsername(rs.getString("KH_Acount"));
                cs.setPassword(rs.getString("KH_Pass"));
                cs.setGender(rs.getBoolean("KH_Gender"));
                cs.setDob(rs.getDate("KH_Dob"));
                cs.setPhone(rs.getString("KH_Sdt"));
                customers.add(cs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public Customer getCustomer(String username) {
        Customer cs = new Customer();
        try {
            String sql = "SELECT * FROM [Khachhang] where KH_Acount = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                cs.setName(rs.getString("KH_Name"));
                cs.setEmail(rs.getString("KH_Email"));
                cs.setUsername(rs.getString("KH_Acount"));
                cs.setPassword(rs.getString("KH_Pass"));
                cs.setGender(rs.getBoolean("KH_Gender"));
                cs.setDob(rs.getDate("KH_Dob"));
                cs.setPhone(rs.getString("KH_Sdt"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cs;
    }

    public void insertCustomer(Customer s) {
        try {
            String sql = "INSERT INTO [Khachhang]\n"
                    + "      ([KH_Acount]\n"
                    + "      ,[KH_Name]\n"
                    + "      ,[KH_Dob]\n"
                    + "      ,[KH_Gender]\n"
                    + "      ,[KH_Sdt]\n"
                    + "      ,[KH_Email]\n"
                    + "      ,[KH_Pass])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getUsername());
            statement.setString(2, s.getName());
            statement.setDate(3, s.getDob());
            statement.setBoolean(4, s.isGender());
            statement.setString(5, s.getPhone());
            statement.setString(6, s.getEmail());
            statement.setString(7, s.getPassword());

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        CustomerDAO cd = new CustomerDAO();
        ArrayList<Customer> cs = cd.getCustomers();
        for (Customer cs1 : cs) {
            System.out.println(cs1.getUsername());
        }
//        Customer cs2 = new Customer();
//        cs2.setName("tuyen");
//        cs2.setEmail("tuyen21");
//        cs2.setUsername("tuyen12345");
//        cs2.setPassword("tuyen");
//        cs2.setDob(Date.valueOf("1999-01-01"));
//        cs2.setGender(true);
//        cs2.setPhone("123456");
//        cd.insertCustomer(cs2);
    }
}
