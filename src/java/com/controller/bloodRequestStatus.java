package com.controller;

import com.helper.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class bloodRequestStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection con = DBClass.getConnection();
            PreparedStatement pstmt = null;
            String query = null;
            String status = request.getParameter("status");
            int id = Integer.parseInt(request.getParameter("id"));

            if (status.equals("Approved")) {
                int unit = Integer.parseInt(request.getParameter("unit"));
                String bloodgroup = request.getParameter("bloodgroup");

                int r = BloodStockUpdater.updateStock1(bloodgroup, unit);
                LocalDate currentDate = LocalDate.now();
                Date cDate = Date.valueOf(currentDate);

                if (r > 0) {
                    query = "UPDATE blood_request_list_tb SET status = ?, approval_date = ? WHERE id = ?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, status);
                    pstmt.setDate(2, cDate);
                    pstmt.setInt(3, id);
                    pstmt.executeUpdate();
                    out.println("success");
                } else {
                    String reason = request.getParameter("rejectionReason");
                    query = "UPDATE blood_request_list_tb SET status = ?, rejection_reason = ? WHERE id = ?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, "Rejected");
                    pstmt.setString(2, "Blood Stock Not Available.");
                    pstmt.setInt(3, id);
                    pstmt.executeUpdate();
                    out.println("reject");
                }
            } else {
                String reason = request.getParameter("rejectionReason");
                query = "UPDATE blood_request_list_tb SET status = ?, rejection_reason = ? WHERE id = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, status);
                pstmt.setString(2, reason);
                pstmt.setInt(3, id);
                pstmt.executeUpdate();
                response.sendRedirect("template/admin/adminDashboard.jsp");
            }
            pstmt.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(bloodRequestStatus.class.getName()).log(Level.SEVERE, null, ex);
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
