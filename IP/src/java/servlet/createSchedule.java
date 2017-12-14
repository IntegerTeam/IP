/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

import conn.*;
/**
 *
 * @author Ikmal
 */
public class createSchedule extends HttpServlet {

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
        SimpleDateFormat datetimeFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        String sStart = "";
        String sEnd = "";
        
        java.sql.Date sqlStart = null;
        java.sql.Date sqlEnd = null;
        Date date;        
        try {
            date = datetimeFormatter1.parse(request.getParameter("start"));
            sqlStart = new java.sql.Date(date.getTime());
            date = datetimeFormatter1.parse(request.getParameter("end"));
            sqlEnd = new java.sql.Date(date.getTime());

        } catch (Exception e) {
            out.print("Invalid booking period<br>");
        }
        PreparedStatement stmt = null;
        try{
            Connection conn = null;
            conn = MySQL.getMySQLConnection();
            String sql = "Insert into schedule(username, houseID, start, end) values(?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, request.getParameter("worker"));
            stmt.setString(2, request.getParameter("homestay"));
            stmt.setDate(3, sqlStart);
            stmt.setDate(4, sqlEnd);
            
            stmt.executeUpdate();
        }
        catch(Exception e){
            
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
