<!-- page content -->

<%
       String lteste = (String)request.getParameter("artist");
       
       %>

<div class="right_col" role="main">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Publicar album</h2> 
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <br>
                        <form action="./Register" method="post" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                            <div class="form-group">
                                <input type="text" style="visibility: hidden" id="user" name="user" value=""> 
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Artista <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="artist" name="artist" required="required" class="form-control col-md-7 col-xs-12">
                                </div>
                            
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="reset">Limpar</button>
                                    <input type="submit" class="btn btn-success" type="submit" name="function" id="funcao" value="Publicar"></>
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