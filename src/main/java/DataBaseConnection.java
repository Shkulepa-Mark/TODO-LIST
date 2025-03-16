import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DataBaseConnection {
    public static Connection getConnection() {
        String user = null;
        String password = null;
        String url = null;

        Properties prop = new Properties();
        InputStream fis;

        try {
            fis = DataBaseConnection.class.getClassLoader().getResourceAsStream("config.properties");

            prop.load(fis);

            user = prop.getProperty("DBUser");
            password = prop.getProperty("DBPass");
            url = prop.getProperty("DBUrl");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Connection connect = null;

        try {
            Class.forName("org.postgresql.Driver");

            connect = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return connect;
    }
}
