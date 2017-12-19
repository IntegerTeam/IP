/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author jhz
 */
public class MySQLQuery {
    
    public static float getQueryPaymentResult(String query){
        
            Connection conn = null;
            float result = 0f;
            try {
                conn = dbConnection.getConnection();
                String sql = query;
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery(sql);
                
                while(rset.next()){
                    result = rset.getFloat(1);
                }
            } catch (Exception e) {
                System.out.println("Unable to connect to database<br>");
            }
            
            return result;
    }
    
    public static String getQuerytResult(String query,boolean noDecimal){
        
            Connection conn = null;
            String result = "";
            try {
                conn = dbConnection.getConnection();
                String sql = query;
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery(sql);
                
                while(rset.next()){
                    if (noDecimal)
                        result = Integer.toString(rset.getInt(1));
                    else
                        result = String.format("%.2f", (rset.getFloat(1)));
                }
                
            } catch (Exception e) {
                System.out.println("Unable to connect to database<br>");
            }
            
            return result;
    }
}
