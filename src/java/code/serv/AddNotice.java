package code.serv;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logic.dao.NoticeLogic;

public class AddNotice extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session=request.getSession();
            if(session==null)
            {
                response.sendRedirect("login1.jsp");
            }
            else
            {
                session.getAttribute("userId");
                //String v=(String)session.getAttribute("userId");
                //out.println(v);
            String Heading=request.getParameter("Heading");
            String Date=request.getParameter("Date");
            String Detail=request.getParameter("Detail");
            String user=request.getParameter("user");
            NoticeLogic nl=new NoticeLogic();
            Boolean status=nl.addNotice(Heading,Date,Detail,user);
            
              if(status=true)
              {
                String v=(String)session.getAttribute("userId");
                session.setAttribute("userId",v);
                request.setAttribute("message","Notice Added !");
                RequestDispatcher rd=request.getRequestDispatcher("AddNewNotice.jsp");
                rd.forward(request,response);
              }
              else
              {
                String v=(String)session.getAttribute("userId");
                session.setAttribute("userId",v);
                request.setAttribute("message","Failed To Add Notice!");
                RequestDispatcher rd=request.getRequestDispatcher("AddNewNotice.jsp");
                rd.forward(request,response);
              }
            }
        }
        catch(Exception e)
        {
            out.println(e);
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
