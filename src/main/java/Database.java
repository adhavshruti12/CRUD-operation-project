import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/Register_form";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    // Method to get database connection
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
