package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mpenderg
 */
public class signin {
    String username = "";
    String password = "";
    
    boolean loggedIn = false;
    
    public signin()
    {
        
    }
    
   public boolean isLoggedIn()
   {
       return loggedIn;
   }
   
   
   public  String getUsername()
    {
      return username;
    }
   
   public void setUsername(String f)
   {
     username = f;
   }
   
    public  String getPassword()
    {
      return password;
    }
   
   public void setPassword(String p)
   {
     password = p;
   }
   
   public boolean login(String url)
   {
   //    
   // database work
   //               
        try{
         // open a connection
          Connection con = null;
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  // load the driver
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/integer2", "root", "1234");
      //    con = DriverManager.getConnection("jdbc:sqlserver://rubble.student.ad.fgcu.edu:1433;databaseName=sp12ism3232x;user=s12ISM3232;password=s12ISM3232;");
      // create the sql command
          PreparedStatement prep = con.prepareStatement("Select * from staff where username=? and password=?");  
          prep.setString(1,username);
          prep.setString(2,password);
        
          ResultSet rs  = prep.executeQuery();
          if(rs.next())
          {
           username = rs.getString(1);
           loggedIn = true;
          }
          else
            loggedIn = false;
          prep.close();
          con.close();
          
         }
        catch(ClassNotFoundException | SQLException sqlex)
        {
          loggedIn = false;  
        }  
        
        return loggedIn;
   }
   
   public void logOut()
   {
     loggedIn = false;
   }
}