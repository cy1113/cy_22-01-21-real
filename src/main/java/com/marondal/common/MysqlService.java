package com.marondal.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	
	private static MysqlService mysqlService = null;
	
	private final String url = "jdbc:mysql://localhost:3306/test_db0107";
	private final String id = "root";
	private final String password = "root";
	
	private Connection connection;
	private Statement statement;
	
	public static MysqlService getInstance() { // static 클래스에서 객체 생성없이 사용가능하게 만듬 
		
		if(mysqlService == null) {
			mysqlService = new MysqlService();
		}
		
		return mysqlService;
	}
	
	private MysqlService() {
		
	}
	
	
	// 접속기능
	public void connect() {
		try {
			
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			this.connection = DriverManager.getConnection(url, id, password);
			this.statement = connection.createStatement();
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	// 접속 끊기
	public void disconnect() {
		try {
			this.connection.close();
			this.statement.close();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
	// select 쿼리 수행기능
	public ResultSet select(String query) {
		try {
			return this.statement.executeQuery(query);
			
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	// insert, update, delete 쿼리 수행기능
	
	public int update(String query) {
		try {
			return this.statement.executeUpdate(query);
				
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
		
		
	}
	
	
	
	
	
	
	
}
