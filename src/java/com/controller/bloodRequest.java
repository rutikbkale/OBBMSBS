package com.controller;

import com.dao.PatientDao;
import com.dao.BloodRequestDao;
import com.entities.BloodRequest;
import com.helper.DBClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class bloodRequest extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Thread.sleep(2000);
            String pName = request.getParameter("pName");
            int age = Integer.parseInt(request.getParameter("age"));
            String reason = request.getParameter("reason");
            String bloodgroup = request.getParameter("bloodgroup");
            int unit = Integer.parseInt(request.getParameter("unit"));
            boolean isPatient = Boolean.parseBoolean(request.getParameter("isPatient"));
            int patient_id = 0;
            if (isPatient) {
                patient_id = Integer.parseInt(request.getParameter("patient_id"));
            } else {
                patient_id = Integer.parseInt(request.getParameter("donar_id"));
            }

            BloodRequest prequest = new BloodRequest(pName, age, reason, bloodgroup, unit, patient_id);

            BloodRequestDao dao = null;
            if (isPatient) {
                dao = new BloodRequestDao(DBClass.getConnection(), "patient_id");
            } else {
                dao = new BloodRequestDao(DBClass.getConnection(), "donar_id");
            }

            if (dao.insertBloodReq(prequest)) {
                out.print("done");
            } else {
                out.print("Error");
            }
        } catch (InterruptedException ex) {
            Logger.getLogger(bloodRequest.class.getName()).log(Level.SEVERE, null, ex);
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
