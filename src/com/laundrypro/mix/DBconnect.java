package com.laundrypro.mix;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static String url = "jdbc:mysql://localhost:3306/laundrypro_db_v2";
	private static String  un = "root";
	private static String  pw = "naruto2527";
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
