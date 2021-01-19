<%-- --%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controle.AcessoBD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  AcessoBD conexao = new AcessoBD();
  Connection resp;
  
  String name = request.getParameter("fullname");
  String email = request.getParameter("email");
  String senha = request.getParameter("pwd");
  
try{
  resp = conexao.conectaPostgre("e_bicycle");
  String sql = "INSERT INTO usuarios (fullname, email, senha) values (?, ?, ?)";
  
  PreparedStatement stmt = resp.prepareStatement(sql);
  
  stmt.setString(1, name);  
  stmt.setString(2, email);  
  stmt.setString(3, senha);
  stmt.execute();
  stmt.close();
  resp.close();

}catch(Exception e){
  out.print("Erro ao cadastrar!!! " + e);
}
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/form_cadastro.css">
    <title>Entrar</title>
  </head>
  <body>
    
    <header>
      <a href="index.jsp">Voltar</a>
    </header>    
  </body>
</html>

