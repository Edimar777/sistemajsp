        <%@page import="model.bean.UsersBean"%>
<!-- page content -->
        
        <%
            String lnickname = (String)session.getAttribute("nickname");
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
                    <h2>ALTERAR SENHA </h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      
                      <script>
                          function teste()
                          {
                              if()
                              alert("usuário cadastrrado com sucesso);
                          }
                          </script>
                      

                        <form action="./Register" method="post" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                            <div class="form-group">
                                <input type="text" style="visibility: hidden" id="nickname" name="nickname" value="<%=lnickname%>"> 
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Nova senha <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="newpassword" name="newpassword" required="required" class="form-control col-md-7 col-xs-12" value="">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Repita senha <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" id="repeatpassword" name="repeatpassword" required="required" class="form-control col-md-7 col-xs-12" value="">
                                </div>
                            </div>
                            
                            
                            <div class="ln_solid"></div>
                            
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="reset">LIMPAR</button>
                                    <input type="submit" class="btn btn-success" onclick="alert('Senha alterada com sucesso')" type="submit" name="function" id="funcao" value="ALTERAR SENHA"></>
                                </div>
                                </div>
                            
                            </div>
                        </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->