package com.controller;

import com.helper.DBClass;
import java.sql.*;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public class ReportGenerator extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = null;
        OutputStream outStream = null;
        String fileName = request.getParameter("fileName");
        
        try {
            response.setContentType("application/pdf");
            
            conn = DBClass.getConnection();
            JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("/WEB-INF/") + "/" + fileName + ".jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);
            Map<String, Object> parameters = new HashMap<>();
            
            byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
            
            response.setContentLength(byteStream.length);
            outStream = response.getOutputStream();
            outStream.write(byteStream, 0, byteStream.length);
        } catch (JRException e) {
            throw new ServletException("Error in generating PDF report", e);
        } finally {
            if (outStream != null) {
                outStream.flush();
                outStream.close();
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    // Handle or log the exception
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
