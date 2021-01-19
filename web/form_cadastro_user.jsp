<%@page import="java.sql.Connection"%>
<%@page import="Controle.AcessoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
  <head>
    <title>Cadastro</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/cadastro.css">
  </head>
  <body>
    
    <header class="cabecalho">
      <a href="index.jsp">e-Bicycle</a>
          <nav>
            <ul class="menu">
              <li><a href="index.jsp">Home</a></li>              
            </ul>
          </nav>
    </header>  
    
    <form action="cadastrar_user.jsp" method="POST">
      <div class="campo">
        <label for="fullname">Nome Completo</label>
        <input type="text" name="fullname" id="fullname" required>
      </div>
      
      <div class="campo">
        <label for="email">E-mail</label>
        <input type="email" name="email" id="email" required>
      </div>
      
      <div class="campo">
        <label for="pwd">Senha</label>
        <input type="password" name="pwd" id="pwd" required>
      </div>
      
      <div class="button">
        <input type="submit" value="Cadastrar" name="btn_Cadastrar" id="btn_cadastrar">
      </div>
      
    </form>
    
  </body>
</html>