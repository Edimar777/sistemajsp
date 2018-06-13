
package Servlets;

import beans.SendMail;
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


@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {    
        try {
            
            UsersDAO user = new UsersDAO();
            UsersBean luserinformation = new UsersBean();
            
            String lnickname = request.getParameter("nickname");
            String lpassword = request.getParameter("password");
            
            HttpSession session = request.getSession();

            if (user.Authenticate(lnickname, lpassword))
            {   
                
                UsersDAO lselect = new UsersDAO();
                UsersBean luser = lselect.Select(lnickname, lpassword);
		
                String lusername = luser.getName() + " " + luser.getSurname();
                
                request.setAttribute("user", luser);
                session.setAttribute("nickname", lnickname);
                session.setAttribute("username", lusername);
                
                response.sendRedirect("user.jsp");
                session.setMaxInactiveInterval(60 * 5);
            } 
            
            else 
            {
                response.sendRedirect("login.jsp");
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
