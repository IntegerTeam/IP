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

        SimpleDateFormat datetimeFormatter1 = new SimpleDateFormat("yyyy-MM-dd");
        String sBookStart = "";
        String sBookEnd = "";

        //      out.println(request.getParameter("checkin") + " " + request.getParameter("checkout"));
        java.sql.Date sqlStartDate = null;
        java.sql.Date sqlEndDate = null;
        Date date;
        try {
            date = datetimeFormatter1.parse(request.getParameter("checkin"));
            sqlStartDate = new java.sql.Date(date.getTime());
            date = datetimeFormatter1.parse(request.getParameter("checkout"));
            sqlEndDate = new java.sql.Date(date.getTime());

        } catch (Exception e) {
            out.print("Invalid booking period<br>");
        }
        String homestay = null;
        homestay = request.getParameter("houseName");
        String custEmail = request.getParameter("email");
        float totalPay = Float.valueOf(request.getParameter("totalPay"));

        //debugg
        out.print(homestay + "<br>");
        out.print(sqlStartDate + "<br>");
        out.print(sqlEndDate + "<br>");
        out.print(custEmail + "<br>");
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
            while (rset.next()) {
                count++;
            }
            String bookID = "";
            if (count < 10) {
                bookID = "BK0000" + String.valueOf(count);
            } else if (count < 100) {
                bookID = "BK000" + String.valueOf(count);
            } else if (count < 1000) {
                bookID = "BK00" + String.valueOf(count);
            } else if (count < 10000) {
                bookID = "BK0" + String.valueOf(count);
            } else if (count < 100000) {
                bookID = "BK" + String.valueOf(count);
            }

            String sql2 = "insert into booking values(?,?,?,?,?,?)";
            PreparedStatement stmt2 = conn.prepareStatement(sql2);
            
            stmt2.setString(1, bookID);
            stmt2.setString(2, homestay);
            stmt2.setString(3, custEmail);
            stmt2.setDate(4, sqlStartDate);
            stmt2.setDate(5, sqlEndDate);
            stmt2.setFloat(6, totalPay);
            
            //into database debugg
            //    out.print(bookID +"<br>");
            //    out.print(homestay +"<br>");
            //    out.print(custEmail +"<br>");
            //    out.print(sqlStartDate +"<br>");
            //    out.print(sqlEndDate +"<br>");            
            //    out.print(totalPay +"<br>");
            
            stmt2.executeUpdate();
            
            response.sendRedirect("BookingModule/Payment/paymentPage.jsp");
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
