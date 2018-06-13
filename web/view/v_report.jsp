<%@page import="model.bean.AlbumsBean"%>
<%@page import="model.dao.AlbumsDAO"%>
<%@page import="model.bean.UsersBean"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.UsersDAO"%>
<!-- page content -->

<div class="right_col" role="main">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>RELATÓRIO ALBUMS CADASTRADOS</h2> 
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

    <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Nome do Album</th>
                <th>Artista</th>
                <th>Quantidade de Faixas</th>
                <th>Data Lançamento</th>
                <th>Data de Cadastro</th>
                <th>Cadastrado por</th>
            </tr>
        </thead>
        <tbody>
            <%       
                AlbumsDAO lselect = new AlbumsDAO();
                                
                List<AlbumsBean> AlbumsList = lselect.SelectAll();
       
                for(int i = 0; i < AlbumsList.size(); i++)
                {
                    String lAlbumName = AlbumsList.get(i).getAlbumName();
                    String lArtist = AlbumsList.get(i).getArtist();
                    String lQntTracks = AlbumsList.get(i).getQntTracks();
                    String lAlbumDate = AlbumsList.get(i).getAlbumDate();
                    String lRegdate = AlbumsList.get(i).getRegDate();
                    String lUser = AlbumsList.get(i).getUser();
                %>
            <tr>
                <td><%= lAlbumName%></td>
                <td><%= lArtist%></td>
                <td><%= lQntTracks%></td>
                <td><%= lAlbumDate%></td>
                <td><%= lRegdate%></td>
                <td><%= lUser%></td>
            </tr>
               <%       }  %>
        </tbody>
        <tfoot>
            <tr>
                <th>Nome do Album</th>
                <th>Artista</th>
                <th>Quantidade de Faixas</th>
                <th>Data Lançamento</th>
                <th>Data de Cadastro</th>
                <th>Cadastrado por</th>
            </tr>
        </tfoot>
    </table>
</div></div></div></div></div></div></div>
<!-- /page content -->


<script type="text/javascript">

    $(document).ready(function() {
        $('#example').DataTable();
    } );

</script>