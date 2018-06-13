<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="header.jsp"%>
    </head>
    <%
            String lUser = (String)session.getAttribute("user");
    %>
    <body background-image=url"images/background.jpg">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="./Login" method="post">
                            <h1 style="color:white"> LOGIN </h1>
                            <div>
                                <input type="text" name="nickname" id="nickname" class="form-control" placeholder="Usuário" required="" />
                            </div>
                            <div>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Senha" required="" />
                            </div>
                            
                            <div class="form-group">
                                <input type="submit" class="btn btn-success" type="submit" name="function" id="funcao" value="FAZER LOGIN   " style=""></>
                            </div>
                            <BR>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link" style="color:white; size: 10px">Novo no site?
                                    <a href="signup.jsp" class="to_register" style="color:white"> Criar uma nova conta </a>
                                </p>
                                <div class="clearfix"></div>
                                <br />
                            </div>
                        </form>
                        
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
