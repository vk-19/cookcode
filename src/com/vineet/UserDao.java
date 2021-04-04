package com.vineet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDao {
	
	Connection conn;
	
	public void connect() throws Exception {
		String url = "jdbc:mysql://localhost:3306/cookcode";
		String user = "admin";
		String pass = "password";
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
	}
	
	
	
	String getUserName(String roll, String pass) throws Exception{
		connect();
		String query = "select name from user where roll=? and pass=?";
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setString(1, roll);
		pst.setString(2, pass);
		
		ResultSet rs = pst.executeQuery();
		//conn.close();
		
		if (rs.next()) {
			return rs.getString("name");
		}
		else 
			return null;
		
		
	}
	
	public String getUserName(String roll) throws Exception{
		connect();
		String query = "select name from user where roll=" + roll;
		PreparedStatement pst = conn.prepareStatement(query);
		//pst.setString(1, roll);
		//pst.setString(2, pass);
		
		ResultSet rs = pst.executeQuery();
		//conn.close();
		
		if (rs.next()) {
			return rs.getString("name");
		}
		else 
			return null;
		
		
	}
	
	boolean isRollExist(String roll) throws Exception {
		connect();
		String query = "select * from user where roll=" + "\"" + roll + "\"";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		//conn.close();
		if (rs.next())
			return true;
		else
			return false;
	}
	
	boolean register(String roll, String name, String pass)throws Exception {
		connect();
		String query = "insert into user values(?,?,?)";
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setString(1, roll);
		pst.setString(2, name);
		pst.setString(3, pass);
		
		int count = pst.executeUpdate();
		//conn.close();
		if (count == 1)
			return true;
		else
			return false;
	}
	
	boolean addfile(String roll, String path, String verdict, String ques) throws Exception{
		connect();
		String query = "insert into file values(?, ?, ?, ?)";
		PreparedStatement pst = conn.prepareStatement(query);
		pst.setString(1, roll);
		pst.setString(2, path);
		pst.setString(3, verdict);
		pst.setString(4, ques);
		
		int count = pst.executeUpdate();
		//conn.close();
		if (count == 1)
			return true;
		else
			return false;
	}
	
	boolean addUserResult(String roll)throws Exception {
		
		connect();
		String query = "insert into result(roll) values (\'"+ roll+"\')";
		Statement pst = conn.createStatement();
		int count = pst.executeUpdate(query);
		//conn.close();
		if (count == 1)
			return true;
		else
			return false;
	}
	
	boolean updateResult(String roll, String ques, String verdict) throws Exception{
		connect();
		Statement stmt = conn.createStatement();
		if (verdict == "correct") {
			String query = "update result set ques" + ques + "=1 where roll=\'" + roll + "\'";
			int count = stmt.executeUpdate(query);
			if (count == 1)
				return true;
			else
				return false;
		}
		return true;
		
//		else {
//			String query = "update result set ques" + ques + " where roll=" + roll;
//			int count = stmt.executeUpdate(query);
//			if (count == 1)
//				return true;
//			else
//				return false;
//		}
	}
	
	public ResultSet getUserInfo(String roll) throws Exception {
		connect();
		String query = "select * from user where roll=" + roll;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		return rs;
		
	}
//	public List<Files> list(String roll) throws Exception {
//		List<Files> files= new ArrayList<Files>();
//		
//			connect();
//		
//				String query = "select * from file where roll=" + roll;
//				Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery(query);
//				while(rs.next()) {
//					Files file= new Files();
//					file.setRoll(roll);
//					file.setName(rs.get);
//					
//				}
//	
//				
//	}
	
	/*public ResultSet getUserFiles(String roll) throws Exception {
		connect();
		String query = "select * from file where roll=" + roll;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		return rs;
	}*/
	
	public ResultSet getResult() throws Exception {
		
		connect();
		String query = "select * from result";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		return rs;
	}
}
