package Authentication;

import conn.MySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import beans.Customer;

public class SignInCustomer extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String custEmail = request.getParameter("custEmail");
            String password = request.getParameter("custPassword");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = MySQL.getMySQLConnection();

                PreparedStatement pst = con.prepareStatement("Select * from customer where custEmail=? and password=?");
                pst.setString(1, custEmail);
                pst.setString(2, password);

                Customer customer = new Customer();

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {

                    customer.setEmail(rs.getString("custEmail"));
                    customer.setName(rs.getString("name"));
                    customer.setTelNo(rs.getString("custTelNo"));
                    HttpSession session = request.getSession();
                    if (session != null) {                        
                        session.invalidate();
                        session = request.getSession();                       
                    }                    
                    session.setAttribute("customer", customer);
                    response.sendRedirect("homestayList.jsp");
                } else {
                    response.sendRedirect("index.html");
                }
            } catch (ClassNotFoundException | SQLException e2) {
                System.out.println(e2);
            }
        }
    }
}
