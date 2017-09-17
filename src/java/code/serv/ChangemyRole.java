package code.serv;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logic.dao.RoleChange;

public class ChangemyRole extends HttpServlet {

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
        try 
        {
         HttpSession session=request.getSession();
            if(session==null)
            {
                response.sendRedirect("login1.jsp");
            }
            else
            {
                session.getAttribute("userId");
                String v=(String)session.getAttribute("userId");
                //out.println(v);
                String[] user=request.getParameterValues("ch");
                Boolean status=false;
                RoleChange rc=new RoleChange();
                for(int i=0;i<user.length;i++)
                {
                String newrole=rc.checkNewRole(user[i]);
                status=rc.changeRole(newrole,user[i]);
                }
                 if(status)
                 {
                    session.setAttribute("userId",v);
                   request.setAttribute("message","Role Changed!");
                RequestDispatcher rd=request.getRequestDispatcher("ChangeRoleRequest.jsp");
                rd.forward(request,response);
                 }
                 else
                 {
                    session.setAttribute("userId",v);
                   request.setAttribute("message","Failed To Change Role!");
                RequestDispatcher rd=request.getRequestDispatcher("ChangeRoleRequest.jsp");
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
