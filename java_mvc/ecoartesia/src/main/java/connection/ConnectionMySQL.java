package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionMySQL {
	private static String URL = System.getenv("JTV_URL");
	private static String USUARIO = System.getenv("JTV_USUARIO");
	private static String SENHA = System.getenv("JTV_SENHA");
	
	public static Connection createConnectionMySQL() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection connection = DriverManager.getConnection(URL, USUARIO, SENHA);
		
		return connection;
	}
	
	public static void main(String[] args) throws Exception {
		
		Connection con = createConnectionMySQL();
		
		if (con != null) {
			System.out.println(con + "\n\n ***  CONEXÃO OBTIDA COM SUCESSO! ******");
			con.close();
		}
	}
}