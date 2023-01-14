package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manik
 */
@WebServlet(name = "Edit", urlPatterns = {"/Edit"})
public class Edit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            RequestDispatcher dp = null;
//            Getting all details receiving from signup.jsp
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String pass = request.getParameter("user_pass");
            int id = Integer.parseInt(request.getParameter("user_id"));
            HttpSession session = request.getSession();

//            Connecting to Database.........
            try {
                out.print("<h3>" + id + name + email + pass + "</h3>");
                Class.forName("com.mysql.cj.jdbc.Driver");
                String serverpath = "jdbc:mysql://localhost:3306/mydb";
                Connection con = DriverManager.getConnection(serverpath, "root", "");
                String query = "UPDATE users SET name=?,email=?,password=? WHERE `users`.`user_id` = ?;";
//            out.println("Connected to server");
                PreparedStatement pst = con.prepareStatement(query);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, pass);
                pst.setInt(4, id);

                int f = pst.executeUpdate();
                out.print("<h1>" + f + "</h1>");

                if (f > 0) {
                    session.setAttribute("id", id);
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    session.setAttribute("password", pass);
                    request.setAttribute("status", "success");
                    dp = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("status", "failed");
                    dp = request.getRequestDispatcher("editform.jsp");
                }
                dp.forward(request, response);
            } catch (Exception e) {
                out.print(e);
            } finally {
            }

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
//    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
