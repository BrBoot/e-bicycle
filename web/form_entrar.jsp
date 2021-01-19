<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/entrar.css">
    <title>Entrar</title>
  </head>
  <body>
    
    <header class="cabecalho">
      <a href="index.jsp">e-Bicycle</a>
        <nav>
          <ul class="menu">        
            <li><a href="index.jsp">Voltar</a></li>
          </ul>
        </nav>
    </header>
    
    <form id="formu" action="entrar.jsp" method="POST">                
      <div class="campo">
        <label for="fullname">E-mail</label>
        <input type="email" name="email" id="email" required>
      </div>

      <div class="campo">
        <label for="email">Senha</label>
        <input type="password" name="pwd" id="pwd" required>
      </div>

      <div class="button">
        <input type="submit" value="Entrar" name="btn_Cadastrar" id="btn_cadastrar">
      </div>
       
    </form>  
    
  </body>
</html>
