package com.controller;

import com.dao.PatientDao;
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
public class editProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));
            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String address = request.getParameter("address");
            String bloodgroup = request.getParameter("bloodgroup");
            String userType = request.getParameter("userType");

            String query = "";
            int r = 0;
            Connection con = DBClass.getConnection();
            PreparedStatement psmt = null;
            Patient patient = null;
            HttpSession session = request.getSession();
            PatientDao dao = new PatientDao(DBClass.getConnection());

            if (userType.equals("patient")) {
//                query = "update patient_info_tb set fName = ?, lName = ?, address = ?, bloodgroup = ? where id = ?";
//                psmt = con.prepareStatement(query);
//                psmt.setString(1, fName);
//                psmt.setString(2, lName);
//                psmt.setString(3, address);
//                psmt.setString(4, bloodgroup);
//                psmt.setInt(5, id);
//                r = psmt.executeUpdate();
                patient = (Patient) session.getAttribute("cPatient");
                patient = new Patient(fName, lName, address, bloodgroup);
                out.print(1);
                r = dao.updatePatient(patient);
                out.print(2);
                if (r > 0) {
                    out.println("done");
//                    session.setAttribute("currentPatient", patient);
                } else {
                    out.println("error");
                }
            } else {
                query = "update donar_info_tb set fName = ?, lName = ?, address = ?, bloodgroup = ? where id = ?";
                psmt = con.prepareStatement(query);
                psmt.setString(1, fName);
                psmt.setString(2, lName);
                psmt.setString(3, address);
                psmt.setString(4, bloodgroup);
                psmt.setInt(5, id);
                r = psmt.executeUpdate();
                if (r > 0) {
                    out.println("done");
                } else {
                    out.println("error");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(editProfile.class.getName()).log(Level.SEVERE, null, ex);
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
