<%@page import="model.bean.AlbumsBean"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.AlbumsDAO"%>
<!-- page content -->

<% 
                        
                        AlbumsDAO lselect = new AlbumsDAO();
                        
                        String lid = (String)request.getParameter("n");
                        
                        List<AlbumsBean> DetailList = lselect.SelectDetails(lid);
                        
                        String vartist = DetailList.get(0).getArtist().toString();
                        String valbum = DetailList.get(0).getAlbumName().toString();
                        String valbumdate = DetailList.get(0).getAlbumDate().toString();
                        String vreguser = DetailList.get(0).getUser().toString();
                        String vregdate = DetailList.get(0).getRegDate().toString();
                        String vcomment = DetailList.get(0).getComment().toString();
                        
                        List<String> lMusics =  DetailList.get(0).getMusics();
                    %>
                    
<div class="right_col" role="main">
    <div class="">

        <div class="clearfix"></div>
        <!-- ITEM -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="">
                    
                    <div class="x_content">

                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="product-image">
                                <img src="images/covers/<%=valbum%>.jpg" alt="...">
                            </div>
                        </div>

                        <div class="col-md-5 col-sm-5 col-xs-12" style="">
                            
                            <br>
                            
                            
                            <form action="./Register" method="post" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" style="">
                                <div class="form-group">
                                    
                                    <input type="text" name="albumid" id="albumid" value="<%=lid%>" style="visibility: hidden"></>
                                    <h1 class="prod_title">INFORMAÇÕES</h1><input type="submit" class="btn btn-success" name="function" id="function" value="DELETAR ALBUM" style=""></>
                                    
                                </div>
                            </form>
                                    
                            <br>
                            <div class="">
                                <h3>Artista: <b><%=vartist%></b></h3>
                                <br>
                                
                                <h3>Album: <b><%=valbum%></b></h3>
                                
                                <br>
                                
                                <h3>Data de lançamento do album: <b><%=valbumdate%></b></h3>
                                
                                <br>
                                
                                <h3>Postagem realizada por: <b><%=vreguser%></b></h3>
                                
                                <br>
                                
                                <h3>Data da postagem: <b><%=vregdate%></b></h3>
                                
                                <br>
                                <h1 class="prod_title">FAIXAS</h1>
                                <br>
                            </div>
                                <%
                                    for(int i = 0; i < lMusics.size(); i++)
                                    {
                                        String lMusicName = lMusics.get(i);
                                        int lTrack = i + 1;
                                %>
                                <div class="">
                                <h3>Faixa <%= lTrack %>: <b><%= lMusicName%></b></h3>
                                <br>
                                <%
                                }
                                %>
                            </div>
                            

                           

                        </div>


                        <div class="col-md-12">

                            <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Comentário sobre o album</a>
                                    </li>
                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false"> Link para download</a>
                                    </li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                        <h3> <%= vcomment%></h3> 
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                        <a href="www.site.com.br"> Ir para link de Download</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- /page content -->