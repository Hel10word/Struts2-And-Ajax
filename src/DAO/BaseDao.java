package DAO;

import java.sql.*;

public class BaseDao {
	protected Connection conn;
	protected PreparedStatement ps;
	protected ResultSet rs;
}
