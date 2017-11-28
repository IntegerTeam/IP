/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Date;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.dbConnection;

/**
 *
 * @author Ikmal
 */
public class approveBooking extends HttpServlet {

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
        
        String homestay = request.getParameter("homestay");
        Date bookStart = null;
        Date bookEnd = null;
        SimpleDateFormat format = new SimpleDateFormat();
        String sBookStart = "";
        String sBookEnd = "";
        try{
            bookStart = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("bookstart"));
            bookEnd = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("bookend"));
            sBookStart = format.format(bookStart);
            sBookEnd = format.format(bookEnd);
        }
        catch(Exception e){
            out.print("Invalid booking period<br>");
        }
        String custName = request.getParameter("name");
        String custEmail = request.getParameter("email");
        
        //debugg
        out.print(homestay+"<br>");
        out.print(sBookStart+"<br>");
        out.print(sBookEnd+"<br>");
        out.print(custName+"<br>");
        out.print(custEmail+"<br>");
        try {
            Connection conn = null;
            try { 
                conn = dbConnection.getConnection();  
            } catch (Exception e) {
                out.println("Unable to connect to database<br>");
            }
            String sql1 = "Select * from booking";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql1);
            
            int count = 1;
            while(rset.next()){
                count++;
            }
            String bookID = "";
            if(count<10)
                bookID = "BK0000" + String.valueOf(count);
            else if(count<100)
                bookID = "BK000" + String.valueOf(count);
            else if(count<1000)
                bookID = "BK00" + String.valueOf(count);
            else if(count<10000)
                bookID = "BK0" + String.valueOf(count);
            else if(count<100000)
                bookID = "BK" + String.valueOf(count);
            
            String sql2 = "insert into booking values(?,?,?,?,?,?)";
            PreparedStatement stmt2 = conn.prepareStatement(sql2);
            
            //into database debugg
            out.print(bookID +"<br>");
            out.print(homestay +"<br>");
            out.print(custEmail +"<br>");
            out.print(sBookStart +"<br>");
            out.print(sBookEnd +"<br>");            
            out.print(bookID +"<br>");
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
