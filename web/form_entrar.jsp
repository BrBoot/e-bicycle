<%-- --%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controle.AcessoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/entrar.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="shortcut icon" href="img/favicon.svg" type="image/x-svg">
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
    
    <% 
       AcessoBD conexao = new AcessoBD();
       Connection resp = conexao.conectaPostgre("e_bicycle");
    %>
    
    <form id="formu" action="form_entrar.jsp" method="POST">                
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
      
      <%
        if(resp != null){
          if ((request.getParameter("email") != null) && (request.getParameter("pwd") != null)){
         String email, pwd;
         email = request.getParameter("email");
         pwd = request.getParameter("pwd");
         Statement st;
         ResultSet rs;
         st = resp.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
         rs = st.executeQuery("SELECT * FROM usuarios WHERE senha='" +pwd+ "' and email='" +email+ "'");
         if (rs.next()){
           response.sendRedirect("form_cadastrar_bicicleta.jsp");
         }
        } else { 
         out.println("E-mail ou senha incorreto!");
         }
        }
      %>
       
    </form>  
    
  </body>
</html>
