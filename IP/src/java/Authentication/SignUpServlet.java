package Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpServlet extends HttpServlet {
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
 
response.setContentType("text/html");
try (PrintWriter out = response.getWriter()) {
    String username = request.getParameter("username");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/ip", "root", "9596");
        
        PreparedStatement ps = con.prepareStatement("insert into ip.customerdetails values(?,?,?,?)");
        PreparedStatement ps2 = con.prepareStatement("insert into ip.customer values(?,?)");
        
        ps.setString(1, username);
        ps.setString(2, fullname);
        ps.setString(3, email);
        ps.setString(4, password);
        
        ps2.setString(1, username);
        ps2.setString(2, password);
        
        int i = ps.executeUpdate();
        int j = ps2.executeUpdate();
        
        if (i > 0)
            response.sendRedirect("welcomelogin.jsp");
        
    }
    catch (ClassNotFoundException | SQLException e2) {
        System.out.println(e2);
    }

} }

}