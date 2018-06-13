<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="header.jsp"%>
    </head>
    <body background-image=url"images/background.jpg">
        <div>
            <a class="hiddenanchor" id="signup"></a>
            <a class="hiddenanchor" id="signin"></a>

            <div class="login_wrapper">
                <div class="animate form login_form">
                    <section class="login_content">
                        <form action="./Signup" method="post">
                            <h1 style="color:white">CADASTRO</h1>
                            <div>
                                <input type="text" name="name" id="name" class="form-control" placeholder="Nome" required="" />
                            </div>
                            <div>
                                <input type="text" name="surname" id="surname" class="form-control" placeholder="Sobrenome" required="" />
                            </div>
                            <div>
                                <input type="text" name="nickname" id="nickname" class="form-control" placeholder="Usuário" required="" />
                            </div>
                            <div>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Senha" required="" />
                            </div>
                            <div>
                                <input type="password" name="reenterpassword" id="reenterpassword" class="form-control" placeholder="Digite novamente a senha" required="" />
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-success" type="submit" name="function" id="funcao" value="CADASTRAR" style=""></>
                            </div>

                            <div class="clearfix"></div>
                            <div class="separator" style="color:white">
                                <p class="change_link">Já possui cadastro?
                                    <a href="login.jsp" class="to_register" style="color:white"> Entre com sua conta </a>
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
