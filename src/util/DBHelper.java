package util;

import java.sql.*;

/**
 * @author 张不凡
 * 
 * util 工具对象  用来封装数据库连接 与资源关闭
 *
 */
public class DBHelper {
	
// 8.0.11
 private static final String URL = "jdbc:mysql://localhost:3306/server?useSSL=false&useUnicode=true"
         + "&characterEncoding=utf8&autoReconnect=true&rewriteBatchedStatements=TRUE"
         + "&serverTimezone=Asia/Shanghai";	
	public static Connection getConnection() {
		Connection conn = null;
		//设置驱动
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, "root", "root");	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	//关闭资源
	public static void closeResource(Connection conn, PreparedStatement ps,
			ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ps!=null) {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
		
}
