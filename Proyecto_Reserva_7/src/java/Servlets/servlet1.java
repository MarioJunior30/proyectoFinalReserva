/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
 * @author Eduardo
 */
@WebServlet(name = "servlet1", urlPatterns = {"/servlet1"})
public class servlet1 extends HttpServlet {

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

        String op = request.getParameter("op");

        if (op.equals("ejercicio1")) {
            double nl, n2, n3, prom;
            String cond;

            nl = Double.parseDouble(request.getParameter("txtN1"));
            n2 = Double.parseDouble(request.getParameter("txtN2"));
            n3 = Double.parseDouble(request.getParameter("txtN3"));

            prom = (nl + n2 + n3) / 3;

            if (prom >= 12) {
                cond = "Aprobado";
            } else {
                cond = "Desaprobado";
            }

            request.setAttribute("promedio", prom);
            request.setAttribute("condicion", cond);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (op.equals("ejercicio2")) {

        }

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

        String op = request.getParameter("op");

        if (op.equals("nuevoUsuario")) {
            try {
                String tipoDocumento = request.getParameter("txtTipoDocumento");
                String numeroDocumento = request.getParameter("txtNumeroDocumento");
                String nombres = request.getParameter("txtNombres");
                String apellidoPaterno = request.getParameter("txtApellidoPaterno");
                String apellidoMaterno = request.getParameter("txtApellidoMaterno");
                String correo = request.getParameter("txtCorreo");
                String celular = request.getParameter("txtCelular");
                String password = request.getParameter("txtPassword");

                PreparedStatement statement = ConexionDB.getConexion().prepareStatement("INSERT INTO dep_usuario (CODTIPODOCUMENTO,NUMDOCUMENTO,TXTNOMBRE,TXTAPEPATERNO,TXTAPEMATERNO,TXTCORREO,TXTCELULAR,TXTPASSWORD) VALUES (?,?,?,?,?,?,?,?)");
                statement.setString(1, tipoDocumento);
                statement.setString(2, numeroDocumento);
                statement.setString(3, nombres);
                statement.setString(4, apellidoPaterno);
                statement.setString(5, apellidoMaterno);
                statement.setString(6, correo);
                statement.setString(7, celular);
                statement.setString(8, password);
                statement.executeUpdate();

                request.setAttribute("code", "success");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } catch (IOException | SQLException | ServletException e) {
                System.out.println("Error: " + e);
            }
        } else if (op.equals("login")) {
            try {
                String correo = request.getParameter("txtCorreo");
                String password = request.getParameter("txtPassword");

                PreparedStatement statement = ConexionDB.getConexion().prepareStatement("SELECT * FROM dep_usuario WHERE TXTCORREO = ? AND TXTPASSWORD = ?");
                statement.setString(1, correo);
                statement.setString(2, password);

                ResultSet rs = statement.executeQuery();

                if (rs.next()) {
                    HttpSession sessionOk = request.getSession();
                    sessionOk.setAttribute("nombres", rs.getString(4));
                    sessionOk.setAttribute("ApePaterno", rs.getString(5));
                    sessionOk.setAttribute("ApeMaterno", rs.getString(6));
                    sessionOk.setAttribute("Correo", rs.getString(7));                   

                    request.getRequestDispatcher("Home.jsp").forward(request, response);
                } else {
                    request.setAttribute("code", "errorLogin");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            } catch (IOException | SQLException | ServletException e) {
                System.out.println("Error: " + e);
            }
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
