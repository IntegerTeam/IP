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
    String name = request.getParameter("custName");
    String custTelNo = request.getParameter("custTel");
    String custEmail = request.getParameter("custEmail");
    String password = request.getParameter("custPassword");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con;
        con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/integer2", "root", "1234");
        
        PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?)");
        
        ps.setString(1, custEmail);
        ps.setString(2, name);
        ps.setString(3, custTelNo);
        ps.setString(4, password);
        
        int i = ps.executeUpdate();
        
        if (i > 0)
            response.sendRedirect("homestayList.jsp");
        
    }
    catch (ClassNotFoundException | SQLException e2) {
        System.out.println(e2);
    }

} }

}