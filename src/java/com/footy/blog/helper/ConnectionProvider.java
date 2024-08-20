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

                // Fetch connection details from environment variables
                String host = System.getenv("DB_HOST");
                String port = System.getenv("DB_PORT");
                String databaseName = System.getenv("DB_NAME");
                String user = System.getenv("DB_USER");
                String password = System.getenv("DB_PASSWORD");

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

