/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.footy.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                // Load the MySQL driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Fetch connection details (hardcoded or environment variables)
                String host = "footyblog-shubhadipchand-11fb.b.aivencloud.com";
                int port = 22785;
                String databaseName = "defaultdb";
                String user = "avnadmin";
                String password = System.geten("DB_PASSWORD");

                // Construct the database URL with SSL mode enabled
                String url = "jdbc:mysql://" + host + ":" + port + "/" + databaseName + "?useSSL=true&requireSSL=true";

                // Create the connection
                con = DriverManager.getConnection(url, user, password);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return con;
    }
}

