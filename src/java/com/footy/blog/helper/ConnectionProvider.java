/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
public static Connection getConnection() {
    try {
        if (con == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String host = System.getenv("DB_HOST");
            String port = System.getenv("DB_PORT");
            String databaseName = System.getenv("DB_NAME");
            String user = System.getenv("DB_USER");
            String password = System.getenv("DB_PASSWORD");

            // Debugging output to check if env variables are being read
            System.out.println("DB_HOST: " + host);
            System.out.println("DB_PORT: " + port);
            System.out.println("DB_NAME: " + databaseName);
            System.out.println("DB_USER: " + user);

            String url = "jdbc:mysql://" + host + ":" + port + "/" + databaseName + "?useSSL=true&requireSSL=true";
            con = DriverManager.getConnection(url, user, password);
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }

    return con;
}
