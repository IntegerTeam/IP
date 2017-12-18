/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import conn.dbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.*;

/**
 *
 * @author Ikmal
 */
public class updateStaff extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            Connection conn = null;
            try {
                conn = dbConnection.getConnection();
            } catch (Exception e) {
                out.println("Unable to connect to database<br>");
            }

            PreparedStatement stmt = null;
            String sql = "Update staff set address=?, telNo=?, email=? where username=?";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, request.getParameter("address"));
            stmt.setString(2, request.getParameter("telNo"));
            stmt.setString(3, request.getParameter("email"));
            stmt.setString(4, request.getParameter("username"));

//            out.print(request.getParameter("address") +"\n" +
//                    request.getParameter("telNo") +"\n" +
//                    request.getParameter("email") +"\n" +
//                    request.getParameter("username") +"\n");
            stmt.executeUpdate();

            HttpSession session = request.getSession();
            Staff staff = (Staff) session.getAttribute("staff");
            if (staff.getLevel().equals("owner")) {
                response.sendRedirect("ownerPage.jsp");
            } else if (staff.getLevel().equals("manager")) {
                response.sendRedirect("managerPage.jsp");
            } else if (staff.getLevel().equals("worker")) {
                response.sendRedirect("workerPage.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
