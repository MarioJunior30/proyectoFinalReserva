/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Utils.ConexionDB;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gino
 */
@WebServlet(name = "svPerfil", urlPatterns = {"/svPerfil"})
public class svPerfil extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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

        try {
            int rowUpdated;
            String Correo = request.getParameter("txtCorreoRegistrar");
            String Celular = request.getParameter("txtCelular");
            String Password = request.getParameter("txtPassword");
            String TipoDocumento = request.getParameter("txtPassword");
            String NumDocumento = request.getParameter("txtNumDocumento");

            if (Password != null) {
                PreparedStatement statement = ConexionDB.getConexion().prepareStatement("UPDATE DEP_USUARIO SET TXTCORREO = ?, TXTCELULAR = ? WHERE CODTIPODOCUMENTO = ? AND NUMDOCUMENTO = ? ) VALUES (?,?,?,?,?,?,?,?)");
                statement.setString(1, Correo);
                statement.setString(2, Celular);
                statement.setString(3, TipoDocumento);
                statement.setString(4, NumDocumento);
                rowUpdated = statement.executeUpdate();
            } else {
                PreparedStatement statement = ConexionDB.getConexion().prepareStatement("UPDATE DEP_USUARIO SET TXTCORREO = ?, TXTCELULAR = ?, TXTPASSWORD = ? WHERE CODTIPODOCUMENTO = ? AND NUMDOCUMENTO = ? ) VALUES (?,?,?,?,?,?,?,?)");
                statement.setString(1, Correo);
                statement.setString(2, Celular);
                statement.setString(3, Password);
                statement.setString(4, TipoDocumento);
                statement.setString(5, NumDocumento);
                rowUpdated = statement.executeUpdate();
            }

            request.setAttribute("code", "success");

            if (rowUpdated > 0) {
                System.out.println("Row updated Successfully!!");
            } else {
                System.out.println("Row isn't Updated!!");
            }

            request.getRequestDispatcher("").forward(request, response);
        } catch (IOException | SQLException | ServletException e) {
            System.out.println("Error: " + e);
        }

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
