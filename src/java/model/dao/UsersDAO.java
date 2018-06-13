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
import model.bean.UsersBean;
import model.factory.ConnectionFactory;

public class UsersDAO {

    private Connection con;

    public UsersDAO() {
        this.con = new ConnectionFactory().getConnection();
    }

    public List<UsersBean> SelectAll() {
        List<UsersBean> UsersList = new ArrayList<>();
        String sql = "SELECT * FROM USERS";
        try 
        {
            PreparedStatement lprepared = con.prepareStatement(sql);
            
            ResultSet lresult = lprepared.executeQuery();
            
            while (lresult.next()) 
            {
                UsersBean luser = new UsersBean();
                
                //luser.setId(Integer.parseInt      (lresult.getString("ID")));
		luser.setName(lresult.getString("NAME"));
		luser.setSurname(lresult.getString("SURNAME"));
		luser.setNickname(lresult.getString("NICKNAME"));
                
                UsersList.add(luser);
            }
            
            lresult.close();
            lprepared.close();
            
            con.close();
        } 
        
        catch (SQLException ex) 
        {
            Logger.getLogger(AlbumsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return UsersList;
    }
    
    public UsersBean Select(String pnickname, String ppassword ){
		
		
	String lquery = "SELECT * FROM USERS WHERE NICKNAME = ? AND PASSWORD = ?";
	UsersBean luser = null;
		
	try 
	{
            PreparedStatement lprepared = con.prepareStatement(lquery);
            lprepared.setString(1, pnickname);
            lprepared.setString(2, ppassword);
	
            ResultSet lresult = lprepared.executeQuery();
	
            if(lresult.next())
            {
                luser = new UsersBean();
                
                luser.setId(lresult.getInt("ID"));
		luser.setName(lresult.getString("NAME"));
		luser.setSurname(lresult.getString("SURNAME"));
                luser.setNickname(lresult.getString("NICKNAME"));
		luser.setPassword(lresult.getString("PASSWORD"));
                
                
            }
			
            lprepared.close();
            con.close();
	} 
		
	catch (SQLException ex)
        {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
            return luser;
	}

    public void Signup(UsersBean user) {
        
        String lQuery = "INSERT INTO USERS (NICKNAME, PASSWORD, NAME, SURNAME) VALUES(?,?,?,?);";
        
        try 
        {            
            PreparedStatement lPrepared = con.prepareStatement(lQuery);
            
            lPrepared.setString(1, user.getNickname());
            lPrepared.setString(2, user.getPassword());
            lPrepared.setString(3, user.getName());
            lPrepared.setString(4, user.getSurname());
            
            lPrepared.execute();
            lPrepared.close();
            con.close();
        }
        
        catch (SQLException ex)
        {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UpdatePassword(String pnewpassword, String pnickname) {
        
        String lQuery = "UPDATE USERS SET PASSWORD = ? WHERE NICKNAME = ?";
        
        try 
        {            
            PreparedStatement lPrepared = con.prepareStatement(lQuery);
            
            lPrepared.setString(1, pnewpassword);
            lPrepared.setString(2, pnickname);
            
            lPrepared.execute();
            lPrepared.close();
            con.close();
        }
        
        catch (SQLException ex)
        {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // VALIDAR LOGIN DO USUARIO
    public boolean Authenticate(String pNickname, String pPassword) {
        
        String lQuery = "SELECT * FROM USERS WHERE NICKNAME = ? AND PASSWORD = ?";
        
        try {
            PreparedStatement lPrepared = con.prepareStatement(lQuery);
            
            lPrepared.setString(1, pNickname);
            lPrepared.setString(2, pPassword);
            
            ResultSet lReturn = lPrepared.executeQuery();
            
            if (lReturn.next())
                return true;
            
            else
                return false;
            
            
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
