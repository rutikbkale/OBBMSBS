package com.controller;

import com.dao.*;
import com.entities.*;
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
            int r = 0;
            Connection con = DBClass.getConnection();
            PreparedStatement psmt = null;
            Patient patient = null;
            Donar donar = null;
            HttpSession session = request.getSession();
            PatientDao dao = new PatientDao(con);
            DonarDao dao1 = new DonarDao(con);

            if (userType.equals("patient")) {
                patient = (Patient) session.getAttribute("currentPatient");
                if (bloodgroup.equals("Choose option")) {
                    bloodgroup = patient.getBloodgroup();
                }
                patient = new Patient(fName, lName, address, patient.getDate(), bloodgroup, patient.getMobno(), patient.getPassword());
                r = dao.updatePatient(patient, id);
                if (r == 1) {
                    out.println("done");
                    session.setAttribute("currentPatient", patient);
                } else {
                    out.println("error");
                }
            } else {
                donar = (Donar) session.getAttribute("currentDonar");
                if (bloodgroup.equals("Choose option")) {
                    bloodgroup = donar.getBloodgroup();
                }
                donar = new Donar(fName, lName, address, donar.getDate(), bloodgroup, donar.getMobno(), donar.getPassword());
                r = dao1.updateDonar(donar, id);
                if (r == 1) {
                    out.println("done");
                    session.setAttribute("currentDonar", donar);
                } else {
                    out.println("error");
                }
            }
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
