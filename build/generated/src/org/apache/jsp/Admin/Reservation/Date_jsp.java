package org.apache.jsp.Admin.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public final class Date_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write(" \n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        ");

                 
               try{

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cef502", "godlove", "godlove");
            
            if(request.getParameter("reserveBut") != null){
                String check_in, check_out;
                int number_of_days, amount_due, one_day_cost;
                
                

                check_in =request.getParameter("check_in");
                check_out=request.getParameter("check_out");

                PreparedStatement preparestmnt = null; //Create statement
                String querry1 = "insert into reserve";
                preparestmnt = con.prepareStatement(querry1);
                

                String date1 =request.getParameter("check_in");

                String date2 =request.getParameter("check_out");

                SimpleDateFormat dateformat = new SimpleDateFormat ("E    yyyy.MM.dd"); //SDF to display output with day of week

                Date displaydate1=new Date(Long.parseLong(date1)); //Turning the inputed date from string
                                                   //to date format to be used for the output
                Date displaydate2=new Date(Long.parseLong(date2));

                  int differenceInDays = (int) ((displaydate2.getTime() - displaydate1.getTime())/(1000*60*60*24));//common method to calculate number of days

                out.println("Between " +dateformat.format(displaydate1)+ " and " +dateformat.format(displaydate2)+ " there are " +differenceInDays+ " days");


                
                preparestmnt.setString(1, check_in);
                preparestmnt.setString(2, check_out);

                preparestmnt.executeUpdate(); //execute query
                
                String message = "Reservation made successfully";
                request.setAttribute("msg", message);
                response.sendRedirect("./view_reserved.jsp");
                
                con.close();
            }
            }catch(Exception e){
                out.println(e);
            }
                 
              
      out.write("\n");
      out.write("              \n");
      out.write("              <form>\n");
      out.write("                  <input type=\"date\" name=\"check_in\">\n");
      out.write("                  <input type=\"date\" name=\"check_in\">\n");
      out.write("                  <input type=\"text\" name=\"number_of_days\" value=\"number_of_days\">\n");
      out.write("\n");
      out.write("              </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
