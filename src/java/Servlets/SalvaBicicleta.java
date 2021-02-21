
package Servlets;

import Controle.AcessoBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "SalvaBicicleta", urlPatterns = {"/SalvaBicicleta"})
public class SalvaBicicleta extends HttpServlet {

  AcessoBD conexao = new AcessoBD();
  Connection resp;

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    String marca, cor, preco;
    marca = request.getParameter("marca");
    cor = request.getParameter("cor");
    preco = request.getParameter("preco");
    try {
      resp = conexao.conectaPostgre("e_bycicle");
      if (resp != null){
        PreparedStatement pst = resp.prepareStatement("INSERT INTO bicicletas (marca, cor, aluguel) values (?,?,?) ");
        pst.setString(1, marca);
        pst.setString(2, cor);
        pst.setString(3, preco);
        pst.execute();
      }
      
    } catch (SQLException ex) {
      Logger.getLogger(SalvaBicicleta.class.getName()).log(Level.SEVERE, null, ex);
    }
    
    
    try (PrintWriter out = response.getWriter()) {
      
      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet SalvaBicicleta</title>");      
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>Servlet SalvaBicicleta at " + marca + " e cor "+ cor + "preço "+ preco +"</h1>");
      out.println("</body>");
      out.println("</html>");
    }
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
