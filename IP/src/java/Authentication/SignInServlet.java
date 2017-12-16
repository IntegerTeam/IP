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

import beans.Staff;

public class SignInServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = MySQL.getMySQLConnection();

                PreparedStatement pst = con.prepareStatement("Select * from staff where username=? and password=?");
                pst.setString(1, username);
                pst.setString(2, password);

                ResultSet rs = pst.executeQuery();

                Staff staff = new Staff();

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    if (session != null) {
                        session.invalidate();
                        session = request.getSession();
                    }
                    staff.setUsername(rs.getString("username"));
                    staff.setName(rs.getString("name"));
                    staff.setIcNo(rs.getString("icNo"));
                    staff.setAddress(rs.getString("address"));
                    staff.setTelNo(rs.getString("telNo"));
                    staff.setEmail(rs.getString("email"));
                    staff.setLevel(rs.getString("level"));
                    session.setAttribute("staff", staff);
                    if (rs.getString("level").equals("owner")) {
                        response.sendRedirect("ownerPage.jsp");
                    } else if (rs.getString("level").equals("manager")) {
                        response.sendRedirect("managerPage.jsp");
                    } else if (rs.getString("level").equals("worker")) {
                        response.sendRedirect("staffPage.jsp");
                    }
                } else {
                    response.sendRedirect("index.html");
                }

            } catch (ClassNotFoundException | SQLException e2) {
                System.out.println(e2);
            }

        }

    }
}
