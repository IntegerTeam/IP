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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beans.Homestay;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class createHomestay extends HttpServlet {

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
        //String houseid = request.getParameter("houseid");
        String housename = request.getParameter("housename");
        String address = request.getParameter("address");
        String accomodation = request.getParameter("accomodation");
        int rate = Integer.valueOf(request.getParameter("rate"));
        
      //  Homestay homestay = new Homestay(houseid, housename, address, accomodation, rate);
        
        
        try{
            Connection conn = null;
            try { 
                conn = dbConnection.getConnection();  
            } catch (Exception e) {
                out.println("Unable to connect to database<br>");
            }
            
            String sql1 = "Select * from homestay";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql1);
            int count = 1;
            while (rset.next()) {
            count++;
            }
            String houseid = "";
             if (count < 10) {
                houseid = "H000" + String.valueOf(count);
             } else if (count < 100) {
                houseid = "H00" + String.valueOf(count);
             } else if (count < 1000) {
                 houseid = "H0" + String.valueOf(count);
             } else if (count < 10000) {
                houseid = "H" + String.valueOf(count);
             }
           
        PreparedStatement stmt2 = null;
        String sql2 = "INSERT into homestay values (?,?,?,?,?)";
        stmt2 = conn.prepareStatement(sql2);
        
        
        stmt2.setString(1, houseid);
        stmt2.setString(2, housename);
        stmt2.setString(3, address);
        stmt2.setString(4, accomodation);
        stmt2.setInt(5, rate);
        
        stmt2.executeUpdate();
        out.print("test");
        Boolean stat = true;
        if (stat == true)
        {
            response.sendRedirect("homestayList.jsp");
        }
        }
        catch(Exception e){
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

