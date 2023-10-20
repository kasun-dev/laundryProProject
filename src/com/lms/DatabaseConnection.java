package com.lms;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private static String url = "jdbc:mysql://localhost:3306/laundary_pro";
	private static String  un = "root";
	private static String  pw = "80332811";
	private static Connection con;

	public static Connection getConnection()
	{
			
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, un, pw);
		}
		
		catch (Exception e)
		{
			System.out.println("Database connection is not success!!!");
		}
			
		return con;
	}
}
