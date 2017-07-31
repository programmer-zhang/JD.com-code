package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnDB {

	
	private static Connection ct=null;
	
	//连接数据库类
	
	public static Connection getConn(){
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoop?useUnicode=true&characterEncoding=utf-8&useSSL=false","root","duqinzong");
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			//System.out.println("数据库连接失败");
		}
		
		return ct;
	}
	
	


}
