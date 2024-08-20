/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.footy.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection() {
        try {
        
            if (con == null) 
            {
                // load driver class 
                Class.forName("com.mysql.jdbc.Driver"); 
            
                // create connection
                String url = System.getenv("DB_URL");
                String user = System.getenv("DB_USER");
                String password = System.getenv("DB_PASSWORD");
                con = DriverManager.getConnection(url, user, password);
            
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return con;
    }
}
