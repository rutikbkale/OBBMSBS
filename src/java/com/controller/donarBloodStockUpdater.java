package com.controller;

import com.helper.BloodStockUpdater;
import com.helper.DBClass;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class donarBloodStockUpdater extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));
            int unit = Integer.parseInt(request.getParameter("unit"));
            String bloodgroup = request.getParameter("bloodgroup");
            int r = BloodStockUpdater.updateStock(bloodgroup, unit);
            if (r > 0) {
                Connection con = DBClass.getConnection();
                String query = "update blood_donation_list_tb set status = ? where id = ?";
                PreparedStatement psmt = con.prepareStatement(query);
                psmt.setString(1, "Donated");
                psmt.setInt(2, id);
                psmt.executeUpdate();
            }
            response.sendRedirect("template/admin/adminDonationReqHistory.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(donarBloodStockUpdater.class.getName()).log(Level.SEVERE, null, ex);
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
