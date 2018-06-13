package model.bean;

import java.util.Date;
import java.util.List;

public class AlbumsBean {
 
    String id;
    String artist;
    String albumname;
    String qnttracks;
    String albumdate;
    String comment;
    String regdate;
    String user;
    
    String musicname;
    String track;
    
    List<String> musics;
    
    public List<String> getMusics() {
        return musics;
    }

    public void setMusics (List<String> musics) {
        this.musics = musics;
    }

    public String getID() {
        return id;
    }

    public void setID(String id) {
        this.id = id;
    }
    
    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }    
    
    public String getAlbumName() {
        return albumname;
    }

    public void setAlbumName(String albumname) {
        this.albumname = albumname;
    }    
    
    public String getQntTracks() {
        return qnttracks;
    }

    public void setQntTracks(String qnttracks) {
        this.qnttracks = qnttracks;
    }    
    
    public String getAlbumDate() {
        return albumdate;
    }

    public void setAlbumDate(String albumdate) {
        this.albumdate = albumdate;
    }    
    
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public String getMusicName() {
        return musicname;
    }

    public void setMusicName(String musicname) {
        this.musicname = musicname;
    }
    
    public String getTrack() {
        return track;
    }

    public void setTrack(String track) {
        this.track = track;
    }
    
    
    public String getRegDate() {
        return regdate;
    }

    public void setRegDate(String regdate) {
        this.regdate = regdate;
    }
    
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
