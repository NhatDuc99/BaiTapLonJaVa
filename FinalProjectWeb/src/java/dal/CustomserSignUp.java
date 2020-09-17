/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.CustomerDAO;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

public class CustomserSignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        processRequest(request, response);
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean checkExist = false;
        CustomerDAO cd = new CustomerDAO();
        ArrayList<Customer> cs = cd.getCustomers();
        String name = request.getParameter("name");
        String mail = request.getParameter("email");
        String user = request.getParameter("user");
        String pass = request.getParameter("password");
        String gender = request.getParameter("gender");
        String date = request.getParameter("date");
        String tel = request.getParameter("telephone");
        boolean gen;
        user = user.toLowerCase();
        for (Customer c : cs) {
            if (c.getUsername().equals(user)) {
                checkExist = true;
                break;
            }
        }

        if (gender.equals("1")) {
            gen = true;
        } else {
            gen = false;
        }

        if (checkExist == false) {
            Customer cs1 = new Customer(name, mail, user, pass, gen, Date.valueOf(date), tel);
            cd.insertCustomer(cs1);
            response.getWriter().println("Sign up successful!");
            request.getRequestDispatcher("signin.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
