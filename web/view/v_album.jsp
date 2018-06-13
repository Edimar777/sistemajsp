<%@page import="model.dao.AlbumsDAO"%>
<!-- page content -->
<%@page import="model.bean.AlbumsBean"%>
<%@page import="java.util.List"%>

<div class="right_col" role="main">
    <div class="">
        <div class="row">
            <div class="col-md-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Álbuns</h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <div class="row">
                            <!-- INICIO -->
                            <% 
                                AlbumsDAO lselect = new AlbumsDAO();
                                
                                List<AlbumsBean> AlbumsList = lselect.SelectAll();
                                String lidalbum = "";
                                        
                                for (int i = 0; i < AlbumsList.size(); i++) { 
                                    
                                lidalbum = AlbumsList.get(i).getID().toString();
                                String lalbumname = AlbumsList.get(i).getAlbumName().toString();
                                String lartistname = AlbumsList.get(i).getArtist().toString();
                            %>
                            <div class="col-md-55">
                                <div class="thumbnail">
                                    <div class="image view view-first">
                                        <a href="./item.jsp?n=<%= lidalbum%>"><img style="width: 100%; display: block;" src="images/covers/<%=lalbumname%>.jpg " alt="image"></a>
                                        <!--<div class="mask">    
                                            <p>detalhes</p>
                                        </div>-->
                                    </div>
                                    <div class="caption">
                                        <p><%=lartistname%> - <b><%=lalbumname%></b></p>
                                    </div>
                                </div>
                            </div>
                            <% }
                                    session.setAttribute("idalbum", lidalbum);
                            %>
                            <!-- FIM -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page content -->