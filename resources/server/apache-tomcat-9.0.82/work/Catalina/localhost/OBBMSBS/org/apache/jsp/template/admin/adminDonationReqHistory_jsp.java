/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.82
 * Generated at: 2024-05-02 12:48:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.template.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.helper.*;

public final class adminDonationReqHistory_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/template/admin/adminBase.jsp", Long.valueOf(1714229182220L));
    _jspx_dependants.put("/template/admin/../../header.jsp", Long.valueOf(1714229182147L));
    _jspx_dependants.put("/template/admin/../../footer.html", Long.valueOf(1714229182147L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("com.helper");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    ");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html><head>\n");
      out.write("        ");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>OBBMS - Save The Lifes</title>\n");
      out.write("\n");
      out.write("        <!-- font awesome -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css\"\n");
      out.write("              integrity=\"sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==\"\n");
      out.write("              crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("        <!--Bootstrap cdn-->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"../../static/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"../../static/img/logo.avif\" rel=\"icon\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav style=\"background-color: #FF0018;\" class=\"navbar navbar-expand-md navbar-dark fixed-top\">\n");
      out.write("            <div class=\"container-fluid d-flex justify-content-evenly\">\n");
      out.write("                <!-- Title -->\n");
      out.write("                <div class=\"navbar-brand fs-3 me-auto\"><i class=\"fas fa-heartbeat\"></i>&nbsp; Online Blood Bank Management System &nbsp;<i class=\"fas fa-heartbeat\"></i></div>\n");
      out.write("                <!-- Navbar Links -->\n");
      out.write("                <ul class=\"navbar-nav\">\n");
      out.write("                    <li class=\"nav-item ms-5\">\n");
      out.write("                        <a class=\"nav-link fs-5 me-5\" style=\"color: white;\" onclick=\"logout('adminLogin')\" href=\"#\"><i class=\"fas fa-sign-out-alt\"></i>&nbsp; Logout</a>\n");
      out.write("                    </li>            \n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"asider\" style=\"width: 250px;\">\n");
      out.write("            <ul class=\"list-group list-unstyled\">\n");
      out.write("                <li class=\"p-3 pt-4 d-block fs-5\"><a href=\"adminDashboard.jsp\"><i class=\"fas fa-home\"></i>&nbsp;Home</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminDonarList.jsp\"><i class=\"fas fa-user\"></i>&nbsp;Donor</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminPatientList.jsp\"><i class=\"fas fa-user-injured\"></i>&nbsp;Patient</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminDonationReq.jsp\"><i class=\"fas fa-hand-holding-medical\"></i>&nbsp;Donations</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminWaitingDonationReq.jsp\"><i class=\"fas fa-regular fa-hourglass-half\"></i>&nbsp;Waiting Donations</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminDonationReqHistory.jsp\"><i class=\"fas fa-history\"></i>&nbsp;Donation History</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminBloodReq.jsp\"><i class=\"fas fa-sync-alt\"></i>&nbsp;Blood Requests</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminWaitingWithdrawReq.jsp\"><i class=\"fas fa-regular fa-hourglass-half\"></i>&nbsp;Waiting Withdrawal</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminBloodReqHistory.jsp\"><i class=\"fas fa-history\"></i>&nbsp;Request History</a></li>\n");
      out.write("                <li class=\"p-3 d-block fs-5\"><a href=\"adminBloodStock.jsp\"><i class=\"fas fa-hand-holding-water\"></i>&nbsp;Blood Stock</a></li>\n");
      out.write("            </ul> \n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("<div class=\"bg-red text-light fixed-bottom text-center\">\n");
      out.write("    <p class=\"pt-1\"> Made In India &COPY; 2024</p>\n");
      out.write("</div>");
      out.write("\n");
      out.write("        <script src=\"https://unpkg.com/sweetalert2@7.8.2/dist/sweetalert2.all.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js\" integrity=\"sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js\" integrity=\"sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("        <script src=\"../../static/js/logout.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <div class=\"position-absolute\" style=\"left:300px\">\n");
      out.write("            <form action=\"../../ReportGenerator\">\n");
      out.write("                <input type=\"hidden\" name=\"fileName\" value=\"donation_history\">\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary\">\n");
      out.write("                    <i class=\"fas fa-print\"></i> Print\n");
      out.write("                </button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\" style=\"margin-left: 250px; margin-top: 75px;\">\n");
      out.write("            <H4 class=\"text-center\" style=\"margin-top: 6rem;\">DONATION REQUEST HISTORY</H4><br>\n");
      out.write("\n");
      out.write("            <table class=\"table table-hover table-bordered table-striped\">\n");
      out.write("                <thead class=\"bg-info t-white\">\n");
      out.write("                    <tr>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Req Id</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Donar Name</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Blood Group</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Unit (in ml)</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Age</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Disease (if any)</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Date</th>\n");
      out.write("                        <th scope=\"col\" class=\"text-center\">Status</th>\n");
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    ");

                        Connection con = DBClass.getConnection();
                        Statement smt = con.createStatement();
                        String query = "select id, name, bloodgroup, unit, age, disease,  reqdate, status from blood_donation_list_tb";
                        ResultSet set = smt.executeQuery(query);

                        if (set.next()) {
                            do {
                                out.println("<tr>");
                                out.println("<td class='text-center'>" + set.getInt("id") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("name") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("bloodgroup") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("unit") + "</td>");
                                out.println("<td class='text-center'>" + set.getInt("age") + "</td>");
                                out.println("<td class='text-center'>" + set.getString("disease") + "</td>");
                                out.println("<td class='text-center'>" + set.getDate("reqdate") + "</td>");
                                if (set.getString("status").equals("Donated")) {
                                    out.println("<td class='text-center'><span class='badge bg-success fs-5'>Donated</span></td>");
                                } else if (set.getString("status").equals("Approved")) {
                                    out.println("<td class='text-center'><span class='badge bg-primary fs-5'>Approved</span></td>");
                                } else {
                                    out.println("<td class='text-center'><span class='badge bg-danger fs-5'>Rejected</span></td>");
                                }
                                out.println("</tr>");
                            } while (set.next());
                        } else {
                            out.println("<tr><td colspan='8' class='text-center'>No Blood Donation Request History Found !</td></tr>");
                        }
                    
      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
