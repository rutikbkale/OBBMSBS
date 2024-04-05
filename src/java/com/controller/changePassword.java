package com.controller;

import com.entities.Donar;
import com.entities.Patient;
import com.helper.DBClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class changePassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            String oldPassword = request.getParameter("oldPassword");
            String dbPassword = request.getParameter("dbPassword");
            String newPassword = request.getParameter("newPassword");
            String userType = request.getParameter("userType");
            String query = "";
            int r = 0;
            Connection con = DBClass.getConnection();
            PreparedStatement psmt = null;

            if (!(dbPassword.equals(oldPassword))) {
                out.println("mismatch");
            } else {
                if (userType.equals("patient")) {
                    Patient patient = (Patient) session.getAttribute("currentPatient");
                    query = "update patient_info_tb set password = ? where id = ?";
                    psmt = con.prepareStatement(query);
                    psmt.setString(1, newPassword);
                    psmt.setInt(2, id);
                    r = psmt.executeUpdate();
                    if (r > 0) {
                        out.println("done");
                        patient = new Patient(patient.getfName(), patient.getlName(), patient.getAddress(), patient.getDate(), patient.getBloodgroup(), patient.getMobno(), newPassword);
                        session.setAttribute("currentPatient", patient);
                    } else {
                        out.println("error");
                    }
                } else {
                    Donar donar = (Donar) session.getAttribute("currentDonar");
                    query = "update donar_info_tb set password = ? where id = ?";
                    psmt = con.prepareStatement(query);
                    psmt.setString(1, newPassword);
                    psmt.setInt(2, id);
                    r = psmt.executeUpdate();
                    if (r > 0) {
                        out.println("done");
                        donar = new Donar(donar.getfName(), donar.getlName(), donar.getAddress(), donar.getDate(), donar.getBloodgroup(), donar.getMobno(), newPassword);
                        session.setAttribute("currentDonar", donar);
                    } else {
                        out.println("error");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(changePassword.class.getName()).log(Level.SEVERE, null, ex);
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
