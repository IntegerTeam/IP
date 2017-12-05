package Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/integer2", "root", "1234");
        
        PreparedStatement pst = con.prepareStatement("Select * from customer where custEmail=? and password=?");
        pst.setString(1, custEmail);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())   
        {
           response.sendRedirect("homestayList.jsp");     
        }
        else
           response.sendRedirect("index.html");
        }
    
    catch (ClassNotFoundException | SQLException e2) {
        System.out.println(e2);
    }
}
} }
