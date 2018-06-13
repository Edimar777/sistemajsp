
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.UsersBean;
import model.dao.UsersDAO;


@WebServlet(name = "Signup", urlPatterns = {"/Signup"})
public class Signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doPost(request, response);
        response.sendRedirect("Signup.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            UsersDAO user = new UsersDAO();

            String lnickname         = request.getParameter("nickname");
            String lpassword      = request.getParameter("password");
            String lname          = request.getParameter("name");
            String lsurname       = request.getParameter("surname");
            
            String lreenterpassword = request.getParameter("reenterpassword");

            HttpSession session = request.getSession();

            if (lpassword.equals(lreenterpassword))
            {   
                UsersBean lUsersBean = new UsersBean();
                
                lUsersBean.setNickname(lnickname);
                lUsersBean.setPassword(lpassword);
                lUsersBean.setName(lname);
                lUsersBean.setSurname(lsurname);
                
                user.Signup(lUsersBean);
                response.sendRedirect("login.jsp");
            }
            
            else 
            {
                response.sendRedirect("signup.jsp");
                session.invalidate();
            }
        } 
        
        catch (NullPointerException e) 
        {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // DICA: https://www.javatpoint.com/servlet-http-session-login-and-logout-example
}
