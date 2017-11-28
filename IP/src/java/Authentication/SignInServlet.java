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

public class SignInServlet extends HttpServlet {
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
 
response.setContentType("text/html");
try (PrintWriter out = response.getWriter()) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String level = request.getParameter("level");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ip", "root", "9596");
        
        /*login for manager*/
        if(level.equals("manager"))
        {
        PreparedStatement pst = con.prepareStatement("Select * from manager where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())   
        {
           response.sendRedirect("LoginModule/manager.jsp");     
        }
        else
           response.sendRedirect("LoginModule/welcome.jsp");
        }
        
        /*login for customer*/
        else if(level.equals("staff"))
        {
        PreparedStatement pst = con.prepareStatement("Select * from staff where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())   
        {
           response.sendRedirect("LoginModule/staff.jsp");     
        }
        else
           response.sendRedirect("LoginModule/welcome.jsp");
        }
        
        /*login for customer*/
        else if(level.equals("customer"))
        {
        PreparedStatement pst = con.prepareStatement("Select * from customer where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())   
        {
           response.sendRedirect("LoginModule/customer.jsp");     
        }
        else
           response.sendRedirect("LoginModule/welcome.jsp");
        }
    }
    catch (ClassNotFoundException | SQLException e2) {
        System.out.println(e2);
    }

} }

}