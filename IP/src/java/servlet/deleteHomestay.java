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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class deleteHomestay extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String houseid = request.getParameter("houseid");

            Connection conn = null;
            try {
                conn = dbConnection.getConnection();
            } catch (Exception e) {
                out.println("Unable to connect to database<br>");
            }

            String sql = "Delete From homestay where houseid='" + houseid + "'";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);

            String sql2 = "Select * from homestay";
            Statement stmt2 = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql2);
            int i = 1;
            ArrayList<String> sqlarray = new ArrayList<String>();
            while (rset.next()) {
                System.out.println(i);
                String house = "";
                if (i < 10) {
                    house = "H000" + String.valueOf(i);
                } else if (i < 100) {
                    house = "H00" + String.valueOf(i);
                } else if (i < 1000) {
                    house = "H0" + String.valueOf(i);
                } else if (i < 10000) {
                    house = "H" + String.valueOf(i);
                }
                String sql3 = "Update homestay set houseid='" + house + "' where houseid='" + rset.getString(1) + "';";
                sqlarray.add(sql3);
                i++;
                //stmt.executeUpdate(sql3);
            }

            for (String s : sqlarray) {
                stmt.executeUpdate(s);
            }

            response.sendRedirect("homestayList.jsp");

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(deleteHomestay.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(deleteHomestay.class.getName()).log(Level.SEVERE, null, ex);
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
