<!-- page content -->

<%
       String luserregister = (String)session.getAttribute("username");
       
       String lhiddenid = "0";
       
       String lartist      = "";
       String lalbumname   = "";
       String lalbumdate   = "";
       String lcomment     = "";
       String luser        = "";
       String lqnttracks   = "";
       
       if(request.getParameter("artist") != null)
       {
                lartist      = request.getParameter("artist");
       }
       
        if(request.getParameter("albumname") != null)
       {
                lalbumname   = request.getParameter("albumname");
       }
        
       if(request.getParameter("albumdate") != null)
       {
                lalbumdate   = request.getParameter("albumdate");
       }
         
       if(request.getParameter("comment") != null)
       {
                lcomment     = request.getParameter("comment");
       }
          
       if(request.getParameter("user") != null)
       {
                luser        = request.getParameter("user");
       }
           
       if(request.getParameter("qnttracks") != null)
       {
                lqnttracks   = request.getParameter("qnttracks");
       }
       
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
                        <form action="./publicalbum.jsp" method="post" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="">
                            <div class="form-group">
                                <input type="text" style="visibility: hidden" id="user" name="user" value="<%=luserregister%>"> 
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Artista <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="artist" name="artist" required="required" class="form-control col-md-7 col-xs-12" value="<%=lartist%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Nome do Álbum <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="albumname" name="albumname" required="required" class="form-control col-md-7 col-xs-12" value="<%=lalbumname%>">
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Data de laçamento do álbum <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="albumdate" class="date-picker form-control col-md-7 col-xs-12" name="albumdate" required="required" type="date" value="<%=lalbumdate%>">
                                </div>
                            </div>
                                
                                <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Quantidade de Faixas <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="qnttracks" class="date-picker form-control col-md-7 col-xs-12" name="qnttracks" required="required" type="number" value="<%=lqnttracks%>">
                                </div>
                            </div>
                                
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Comentário <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="comment" class="date-picker form-control col-md-7 col-xs-12" name="comment" required="required" type="text" value="<%=lcomment%>">
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            
                            <% if(request.getParameter("subvalue") == null)
                            {
                                   
                            %>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="reset">LIMPAR</button>
                                    <button type="submit" class="btn btn-success" value="1" id="subvalue" name="subvalue">INSERIR FAIXAS</button>
                                </div>
                                </div>
                               <%  
                                }
                               %> 
                            
                            </div>
                        </form>
                                <!---->
                                
                                <% 
                                    if(request.getParameter("subvalue") != null)
                                    {
                                %>
                        <form action="./Register" method="post" id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left" novalidate="" style="">
                            
                            <% 
                                
                               int lQnt_Tracks = Integer.parseInt(request.getParameter("qnttracks"));
                               
                               for(int i = 1; i <= lQnt_Tracks; i++)
                               {
                            %>
                            <div class="form-group">
                                
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"> Faixa <%= i %> <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="tracks" class="date-picker form-control col-md-7 col-xs-12" name="track_<%=i%>" required="required" type="text">
                                </div>
                            </div>
                            <%
                                }

                                 
                            %> 
                            <input type="text" style="visibility: hidden" id="artistreq"        name="artistreq"    value="<%=lartist%>"> 
                            <input type="text" style="visibility: hidden" id="albumnamereq"     name="albumnamereq" value="<%=lalbumname%>"> 
                            <input type="text" style="visibility: hidden" id="albumdatereq"     name="albumdatereq" value="<%=lalbumdate%>"> 
                            <input type="text" style="visibility: hidden" id="commentreq"       name="commentreq"   value="<%=lcomment%>"> 
                            <input type="text" style="visibility: hidden" id="userreq"          name="userreq"      value="<%=luser%>"> 
                            <input type="text" style="visibility: hidden" id="qnttracksreq"     name="qnttracksreq" value="<%=lqnttracks%>"> 
                                
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                    <button class="btn btn-primary" type="reset">Limpar</button>
                                    <input type="submit" class="btn btn-success" type="submit" name="function" id="funcao" value="PUBLICAR ALBUM"></>
                                </div>
                                
                            </div>
                            </div>
                        </form>
                            
                        <%
                            }
                        %>   
                    </div>
                </div>

            </div>
        </div>


    </div>
</div>
<!-- /page content -->