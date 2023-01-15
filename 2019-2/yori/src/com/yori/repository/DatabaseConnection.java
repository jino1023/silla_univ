package com.yori.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseConnection {
	
	private final String URL = "jdbc:mysql://localhost:3306/yori?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private final String ID  = "root";
	private final String PW  = "1234";

	private static DatabaseConnection instance = new DatabaseConnection();
	private Connection conn = null;
	
	private DatabaseConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(URL, ID, PW);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static DatabaseConnection getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		return conn;
	}
}
