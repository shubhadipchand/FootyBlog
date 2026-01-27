import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySqlExample {
    public static void main(String[] args) throws ClassNotFoundException {
        
        // 1. Fetch connection details from environment variables
        String host = System.getenv("DB_HOST");
        String port = System.getenv("DB_PORT");
        String databaseName = System.getenv("DB_NAME");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        // 2. Validate that essential variables exist
        if (host == null || port == null || databaseName == null) {
            System.out.println("Error: Missing required environment variables (DB_HOST, DB_PORT, DB_NAME).");
            return;
        }

        // 3. Load the MySQL Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 4. Establish the connection
        try (final Connection connection = DriverManager.getConnection(
                "jdbc:mysql://" + host + ":" + port + "/" + databaseName + "?sslmode=require", user, password);
             final Statement statement = connection.createStatement();
             final ResultSet resultSet = statement.executeQuery("SELECT version() AS version")) {

            while (resultSet.next()) {
                System.out.println("Connected Successfully! MySQL Version: " + resultSet.getString("version"));
            }

        } catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
    }
}
