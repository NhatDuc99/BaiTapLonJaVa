/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Order;
import model.Product;

/**
 *
 * @author admin
 */
public class Cart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Cart</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Cart at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
            OrderDAO odb = new OrderDAO();
            Customer cs = (Customer) request.getSession().getAttribute("customer");
            ArrayList<Order> unpaidOrders = odb.getShoppingCartByUsername(cs.getUsername());
            ArrayList<Order> paidOrders = odb.getPaidShoppingCartByUsername(cs.getUsername());
            ArrayList<Product> unpaidProducts = new ArrayList<>();
            for (Order o : unpaidOrders) {
                unpaidProducts.add(o.getProduct());
            }
            
            ArrayList<Product> paidProducts = new ArrayList<>();
            for (Order o : paidOrders) {
                paidProducts.add(o.getProduct());
            }
            request.setAttribute("orders", unpaidOrders);
            request.setAttribute("unpaidProducts", unpaidProducts);
            request.setAttribute("paidProducts", paidProducts);
            request.getRequestDispatcher("cart.jsp").forward(request, response);

        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
