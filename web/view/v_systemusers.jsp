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
                        <h2>PUBLICAR ALBUM</h2> 
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

    <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>Usuário</th>
            </tr>
        </thead>
        <tbody>
            <%       
                UsersDAO lselect = new UsersDAO();
                                
                List<UsersBean> UsersList = lselect.SelectAll();
       
                for(int i = 0; i < UsersList.size(); i++)
                {
                    String lName = UsersList.get(i).getName();
                    String lSurname = UsersList.get(i).getSurname();
                    String lNickname = UsersList.get(i).getNickname();
                %>
            <tr>
                <td><%= lName%></td>
                <td><%= lSurname%></td>
                <td><%= lNickname%></td>
            </tr>
               <%       }  %>
        </tbody>
        <tfoot>
            <tr>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>Usuário</th>
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