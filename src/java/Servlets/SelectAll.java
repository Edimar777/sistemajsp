
package Servlets;

import beans.SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.bean.AlbumsBean;
import model.bean.UsersBean;
import model.dao.AlbumsDAO;
import model.dao.UsersDAO;


@WebServlet(name = "SelectAll", urlPatterns = {"/SelectAll"})
public class SelectAll extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        AlbumsDAO lselect = new AlbumsDAO();
		
	List<AlbumsBean> AlbumsList = lselect.SelectAll();
	
	request.setAttribute("AlbumsList", AlbumsList);
	request.getRequestDispatcher("v_produto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {            
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // DICA: https://www.javatpoint.com/servlet-http-session-login-and-logout-example
}
