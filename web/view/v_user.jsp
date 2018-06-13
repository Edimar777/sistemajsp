        <%@page import="model.bean.UsersBean"%>
<!-- page content -->
        
        <%
            String lusername_vuser = (String)session.getAttribute("username");
        %>
       
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Sejá bem vindo (a) <%=lusername_vuser%> </h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      
                      <br>
                      Observação, para que apareça a capa do album é necessário que salve a imagem da capa jpg na pasta:
                      <br><b>SystemJsp-master\web\images\covers</b>
                      <br>
                      O nome do arquivo deve ser o mesmo nome dado no album ao cadastrar o mesmo.
                      <br>
                      
<br>Integrantes:
<br>
<br>Nome: Anderson Conceição Silva
<br>RA: 2215103938
<br>
<br>Nome: Edimar Pinheiro dos Santos
<br>RA: 2215107577
<br>
<br>Nome: Luiz Claudio Santos Silva Junior
<br>RA: 2215103795
<br>
<br>Nome: Matheus Melo de Souza
<br>RA: 2215108065
<br>
<br>Nome: Victor Gustavo Silva Aleixo
<br>RA: 2215193561

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->