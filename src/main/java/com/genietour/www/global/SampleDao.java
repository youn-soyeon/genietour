package com.genietour.www.global;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Scanner;
import java.util.concurrent.ConcurrentHashMap;

class Query {
	
}

public class SampleDao {

	public static void main(String[] args) {
		SampleDao dao = new SampleDao();
		
		System.out.println( dao.count() );
		System.out.println( dao.countCatches() );
		System.out.println( dao.countTryWithResource() );
		System.out.println( dao.execCountSql("SELECT COUNT(*) FROM Member") );
		
		System.out.println(  );
		
		dao.genericChange();
		
		System.out.println( dao.underscore() );
		
		dao.switchString();
		
	}
	
	public int count() {
		int result = 0;
		Connection			c	= null;
		PreparedStatement 	ps	= null;
		ResultSet			rs	= null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://203.236.209.102:3306/genie?useSSL=false", "genie", "mysql");
			
			ps = c.prepareStatement("SELECT COUNT(*) FROM Member");
			
			rs = ps.executeQuery();
			
			rs.next();
			
			result = rs.getInt(1);
			
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				c.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		return result;
	}
	
	
	
	public int countCatches() {
		int result = 0;
		Connection			c	= null;
		PreparedStatement 	ps	= null;
		ResultSet			rs	= null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection("jdbc:mysql://203.236.209.102:3306/genie?useSSL=false", "genie", "mysql");
			
			ps = c.prepareStatement("SELECT COUNT(*) FROM Member");
			
			rs = ps.executeQuery();
			
			rs.next();
			
			result = rs.getInt(1);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) { rs.close(); }				
				if( ps != null ) { ps.close(); }
				if( c  != null ) {  c.close(); }
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}
	
	public int countTryWithResource() {
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {}
		
		try(Connection			c	= DriverManager.getConnection("jdbc:mysql://203.236.209.102:3306/genie?useSSL=false", "genie", "mysql");
			PreparedStatement 	ps	= c.prepareStatement("SELECT COUNT(*) FROM Member");
			ResultSet			rs	= ps.executeQuery();) {
		
			rs.next();
			result = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try( Scanner s = new Scanner(System.in) ) {
			//s.next();
		}		
		
		return result;
	}
	
	
	private int execCountSql(String sql) {
		int result = 0;
		try {	Class.forName("com.mysql.jdbc.Driver");	} catch (ClassNotFoundException e1) {}
		
		try(Connection			c	= DriverManager.getConnection("jdbc:mysql://203.236.209.102:3306/genie?useSSL=false", "genie", "mysql");
			PreparedStatement 	ps	= c.prepareStatement(sql);
			ResultSet			rs	= ps.executeQuery();) {
		
			rs.next();
			result = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
//	private <T> T execSql(String sql, String ... params) {
//		T result = null;
//		
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//		} catch (ClassNotFoundException e1) {}
//		
//		try(Connection			c	= DriverManager.getConnection("jdbc:mysql://203.236.209.102:3306/genie?useSSL=false", "genie", "mysql");
//			PreparedStatement 	ps	= c.prepareStatement(sql);
//			ResultSet			rs	= ps.executeQuery();) {	
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return T;
//	}	
	
	
	public void genericChange() {		
		Map<String, String> map = new ConcurrentHashMap<>();
		map.clear();
	}
	
	public long underscore() {
		long l = 1_0000_0000_0000_0000L;
		return l;
	}
	
	public void switchString() {
		switch( "true" ) {
			case "True" : break;
			case "False": break;
		}		
	}

}
