<%----%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="img/favicon.svg" type="image/x-svg">
    <link rel="stylesheet" href="css/cadastro_bicicleta.css">
    <title>Bicycle</title>
  </head>
  <body>
    <header>
      <a>e-Bicycle</a>
        <nav>
          <ul class="menu">        
            <li><a href="index.jsp">Usuário</a></li>
            <li><a href="index.jsp">Sair</a></li>
          </ul>
        </nav>
    </header>
    <main>
      <h2>Cadastre sua bicicleta</h2>
      <form id="cadastrar" method="POST" action="./SalvaBicicleta">
        <div class="campos">    
          <label for="marca">Marca</label>
          <input type="text" name="marca" id="marca" required>
          <label for="cor">Cor</label>
          <input type="text" name="cor" id="cor" required>
        </div>
        
        <h3>Valores do Aluguel</h3>
        
        <div class="preco">            
          <input type="radio" id="30min" name="preco" value="30 Min: R$ 1">
          <label for="30min">30 Min: R$ 1</label>
          <input type="radio" id="1hr" name="preco" value="1hr: R$ 1,50">
          <label for="1hr">1hr: R$ 1,50</label>
          <input type="radio" id="2hr" name="preco" value="2hr: R$ 2,20">
          <label for="2hr">2hr: R$ 2,20</label>
          <input type="radio" id="3hr" name="preco" value="3hr: R$ 3,20">
          <label for="3hr">3hr: R$ 3,20</label>
        </div>
        
        <div class="button"> 
         <input id="cadastrar" type="submit" value="Cadastrar">
         <input id="cancelar" type="submit" value="Cancelar">
        </div> 
      </form>
    </main>
    
  </body>
</html>
