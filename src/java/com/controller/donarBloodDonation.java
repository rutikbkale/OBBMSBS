package com.controller;

import com.dao.DonarDonationDao;
import com.entities.DonarDonation;
import com.helper.DBClass;
import com.helper.PreviousReqProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class donarBloodDonation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Thread.sleep(2000);

            // fetching information from donar
            int id = Integer.parseInt(request.getParameter("id"));
            String dName = request.getParameter("dName");
            String bloodgroup = request.getParameter("bloodgroup");
            int unit = Integer.parseInt(request.getParameter("unit"));
            int age = Integer.parseInt(request.getParameter("age"));
            String disease = request.getParameter("disease");

            int r = 0;
            String s = "warning";
            r = PreviousReqProvider.isHavingPendingReqDonar(id);
            if (r > 0) {
                out.print(s);
                return;
            }

            DonarDonation donation = new DonarDonation(id, dName, bloodgroup, unit, age, disease);

            DonarDonationDao dao = new DonarDonationDao(DBClass.getConnection());

            if (dao.insertDonarDonation(donation)) {
                s = "done";
                out.print(s);
            } else {
                s = "Error";
                out.print(s);
            }

        } catch (InterruptedException ex) {
            Logger.getLogger(donarBloodDonation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(donarBloodDonation.class.getName()).log(Level.SEVERE, null, ex);
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
