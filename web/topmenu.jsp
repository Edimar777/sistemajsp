       <%@page import="model.bean.UsersBean"%>
       
       <%
       String lusername = session.getAttribute("username").toString().toUpperCase();
       %>
        
<!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
                
                <ul class="nav navbar-nav navbar-left">
                    <li class="" style="align-items: flex-start">
                      <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-bars" style="color:white"></i> <span style="visibility: hidden">------</span> 
                          <span style="color:white" > MENU OPÇÕES </span>
                          <span style="visibility: hidden">-----</span> 
                        <span class=" fa fa-angle-down"></span>
                      </a>
                      <ul class="dropdown-menu">
                      <li><a href="album.jsp">ÁLBUNS</a></li>
                      <li><a href="publicalbum.jsp">PUBLICAR ALBUM</a></li>
                      <li><a href="systemusers.jsp">USUÁRIOS DE SISTEMA</a></li>
                      <li><a href="report.jsp">RELATÓRIO ALBUMS</a></li>
                      </ul>
                    </li>
                </ul>
                        
              <ul class="nav navbar-nav navbar-right">
                
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                      <span style="color:white"> <%= lusername%> </span> <span>-</span>  <img src="images/img.jpg" alt="">
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="user.jsp"> PERFIL</a></li>
                    <li><a href="updatepassword.jsp"> ALTERAR SENHA</a></li>
                    <!--<li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a> 
                    </li>
                    <li><a href="javascript:;">Help</a></li>-->
                    <li><a href="login.jsp"><i class="fa fa-sign-out pull-right"></i> LOG OUT</a></li>
                  </ul>
                </li>
                
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->