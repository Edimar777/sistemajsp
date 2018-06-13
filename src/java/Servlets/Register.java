
package Servlets;

import static java.awt.SystemColor.window;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javafx.scene.control.Alert;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import model.bean.AlbumsBean;
import model.bean.UsersBean;
import model.dao.AlbumsDAO;
import model.dao.UsersDAO;


@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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

        try
        {
            
            String lfunction = request.getParameter("function");

            AlbumsDAO album = new AlbumsDAO();
            UsersDAO user = new UsersDAO();
            
            HttpSession session = request.getSession();
            
            if (lfunction.equals("ALTERAR SENHA")) 
            {
                String lnickname = request.getParameter("nickname");
                String lpassword = request.getParameter("password");
                String lnewpassword = request.getParameter("newpassword");
                String lrepeatpassword = request.getParameter("repeatpassword");
                
                if(lnewpassword.equals(lrepeatpassword))
                {
                    user.UpdatePassword(lnewpassword, lnickname);
                    response.sendRedirect("user.jsp");
                }
            }
                    
            else if (lfunction.equals("DELETAR ALBUM")) 
            {
                String lid = request.getParameter("albumid");
                
                album.DeleteAlbum(lid);
                album.DeleteMusic(lid);
                
                response.sendRedirect("album.jsp");
            }

            else if (lfunction.equals("PUBLICAR ALBUM")) 
            {
            
                String lartist      = request.getParameter("artistreq");
                String lalbumname   = request.getParameter("albumnamereq");
                String lalbumdate   = request.getParameter("albumdatereq");
                String lcomment     = request.getParameter("commentreq");
                String luser        = request.getParameter("userreq");
                
                String lqnttracks   = request.getParameter("qnttracksreq");
                
                AlbumsBean lAlbumBean = new AlbumsBean();
                
                lAlbumBean.setArtist(lartist);
                lAlbumBean.setAlbumName(lalbumname);
                lAlbumBean.setAlbumDate(lalbumdate);
                lAlbumBean.setComment(lcomment);
                lAlbumBean.setUser(luser);
                lAlbumBean.setQntTracks(lqnttracks);
                
                album.RegisterAlbum(lAlbumBean);
                
                for(int i = 1; i <= Integer.parseInt(lqnttracks); i++)
                {
                    String lmusicname = request.getParameter("track" + "_" + i);
                    
                    lAlbumBean.setMusicName(lmusicname);
                    lAlbumBean.setTrack(Integer.toString(i));
                    
                    album.RegisterMusic(lAlbumBean);
                }
                
                response.sendRedirect("album.jsp");
            }
            
            else if (lfunction.equals("INSERIR MÚSICAS")) 
            {
                String ltracks = request.getParameter("tracks");
                
                response.sendRedirect("publicmusic.jsp");
            }
            
            
            
            /*else if (funcao.equals("Musics"))
            {
                session.setAttribute("qnttracks", (String)request.getParameter("qntmusics"));
                response.sendRedirect("cliente.jsp");
            }*/
        }
        
        catch (NullPointerException e) 
        {
            response.sendRedirect("aa.jsp");
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
