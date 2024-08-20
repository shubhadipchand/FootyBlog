/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.footy.blog.helper;

import io.github.cdimascio.dotenv.Dotenv;
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

                // Load the .env file
                Dotenv dotenv = Dotenv.load();

                // Fetch connection details from the .env file
                String host = dotenv.get("DB_HOST");
                String port = dotenv.get("DB_PORT");
                String databaseName = dotenv.get("DB_NAME");
                String user = dotenv.get("DB_USER");
                String password = dotenv.get("DB_PASSWORD");

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
