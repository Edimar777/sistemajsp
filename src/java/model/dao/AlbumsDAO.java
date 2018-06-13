package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.bean.AlbumsBean;
import model.factory.ConnectionFactory;

public class AlbumsDAO {

    private Connection con;

    public AlbumsDAO() {
        this.con = new ConnectionFactory().getConnection();
    }

    public List<AlbumsBean> SelectAll() {
        List<AlbumsBean> AlbumsList = new ArrayList<>();
        String sql = "SELECT * FROM ALBUMS";
        try 
        {
            PreparedStatement lprepared = con.prepareStatement(sql);
            
            ResultSet lresult = lprepared.executeQuery();
            
            while (lresult.next()) 
            {
                AlbumsBean lalbum = new AlbumsBean();
                
                lalbum.setID(lresult.getString("ID"));
		lalbum.setArtist(lresult.getString("ARTIST"));
		lalbum.setAlbumName(lresult.getString("ALBUMNAME"));
		lalbum.setAlbumDate(lresult.getString("ALBUMDATE"));
                lalbum.setComment(lresult.getString("COMMENT"));
		lalbum.setRegDate(lresult.getString("REGDATE"));
                lalbum.setUser(lresult.getString("USER"));
                lalbum.setQntTracks(lresult.getString("QNTTRACKS"));
                
                AlbumsList.add(lalbum);
            }
            
            lresult.close();
            lprepared.close();
            
            con.close();
        } 
        
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return AlbumsList;
    }
    
    public String SelectMaxID() {
        
        String lquery = "SELECT MAX(ID) AS ID FROM ALBUMS";
        String lmaxID = "";
        try 
        {
            con = new ConnectionFactory().getConnection();
            PreparedStatement lprepared = con.prepareStatement(lquery);
            ResultSet lresult = lprepared.executeQuery();
            while (lresult.next()) 
            {
                lmaxID = lresult.getString("ID");
            }
            
            lresult.close();
            lprepared.close();
            
            con.close();
            con = null;
            
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lmaxID;
    }

    public void RegisterAlbum(AlbumsBean palbum) {
        
        String lquery;
        lquery = "INSERT INTO ALBUMS (ARTIST, ALBUMNAME, ALBUMDATE, QNTTRACKS, COMMENT, REGDATE, USER) VALUES (?,?,?,?,?,CURRENT_DATE,?)";
        
        try 
        {
            PreparedStatement lprepared = con.prepareStatement(lquery);
            lprepared.setString(1, palbum.getArtist());
            lprepared.setString(2, palbum.getAlbumName());
            lprepared.setString(3, palbum.getAlbumDate());
            lprepared.setString(4, palbum.getQntTracks());
            lprepared.setString(5, palbum.getComment());
            lprepared.setString(6, palbum.getUser());
            
            lprepared.execute();
            lprepared.close();
            con.close();
            con = null;
        } 
        
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void RegisterMusic(AlbumsBean pmusic) {
        
        String lquery = "INSERT INTO MUSICS (IDALBUM, MUSICNAME, TRACK) VALUES (?, ?, ?)";
        
        try 
        {   
            String lID = SelectMaxID();
            con = new ConnectionFactory().getConnection();
            PreparedStatement lprepared = con.prepareStatement(lquery);
            lprepared.setString(1, lID);
            lprepared.setString(2, pmusic.getMusicName());
            lprepared.setString(3, pmusic.getTrack());
            
            lprepared.execute();
            lprepared.close();
            con.close();
        } 
        
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<AlbumsBean> SelectDetails(String pid) {
        
        String lquery = "SELECT ID, ARTIST, ALBUMNAME, ALBUMDATE, COMMENT, REGDATE, USER, TRACK, MUSICNAME FROM ALBUMS INNER JOIN MUSICS ON ID = IDALBUM WHERE ID  = ? ORDER BY TRACK";
        List<AlbumsBean> AlbumsList = new ArrayList<>();
        
        List<String> MusicsAlbum = new ArrayList<>();
        
        AlbumsBean lalbum = new AlbumsBean();
        try 
        {
            PreparedStatement lprepared = con.prepareStatement(lquery);
            lprepared.setString(1, pid);
            ResultSet lresult = lprepared.executeQuery();
            while (lresult.next()) 
            {
                
                lalbum.setID(lresult.getString("ID"));
		lalbum.setArtist(lresult.getString("ARTIST"));
		lalbum.setAlbumName(lresult.getString("ALBUMNAME"));
		lalbum.setAlbumDate(lresult.getString("ALBUMDATE"));
                lalbum.setComment(lresult.getString("COMMENT"));
		lalbum.setRegDate(lresult.getString("REGDATE"));
                lalbum.setUser(lresult.getString("USER"));
                
                MusicsAlbum.add(lresult.getString("MUSICNAME"));
                
                AlbumsList.add(lalbum);
            }
                lalbum.setMusics(MusicsAlbum);
            
            lresult.close();
            lprepared.close();
            
            con.close();
            
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return AlbumsList;
    }
    
    public void DeleteAlbum(String pid) {
        
        String lquery;
        lquery = "DELETE FROM ALBUMS WHERE ID = ?";
        
        try 
        {
            PreparedStatement lprepared = con.prepareStatement(lquery);
            lprepared.setString(1, pid);
            
            lprepared.execute();
            lprepared.close();
            con.close();
            con = null;
        } 
        
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void DeleteMusic(String pid) {
        
        String lquery;
        lquery = "DELETE FROM MUSICS WHERE IDALBUM = ?";
        
        try 
        {
            con = new ConnectionFactory().getConnection();
            PreparedStatement lprepared = con.prepareStatement(lquery);
            lprepared.setString(1, pid);
            
            lprepared.execute();
            lprepared.close();
            con.close();
            con = null;
        } 
        
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
