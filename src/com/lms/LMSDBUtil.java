package com.lms;

import java.sql.Connection;
import java.sql.ResultSet;//new
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LMSDBUtil {
	private static boolean isSucess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<User> validate(String Username, String Password) {
		
		ArrayList<User> user = new ArrayList<>();

		//validate
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();			
			
			String sql = "SELECT * FROM lms_user WHERE userName = '"+Username+"' AND password = '"+Password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String nic = rs.getString(1);
				String name = rs.getString(2);
				String userName = rs.getString(3);
				String password = rs.getString(4);
				String address = rs.getString(5);
				String type = rs.getString(6);
				
				User u = new User(nic, name, userName, password, address, type);
				user.add(u);
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	//create method to insert customer details
	public static boolean cutomerDetails(String Name, String ContactNo, String Address)
	{
		boolean isSucess = false;

				
				//validate
				try {
					con = DatabaseConnection.getConnection();
					stmt = con.createStatement();
					
					String sql = "INSERT INTO Customer values('"+Name+"','"+ContactNo+"','"+Address+"')";
					
					int rs = stmt.executeUpdate(sql);
					
					if(rs > 0)
					{
						isSucess = true;
					}
					
					else
					{
						isSucess = false;
					}
				}
				
				catch(Exception e) {
					e.printStackTrace();
				}
		
		return isSucess;
	}
	
	public static boolean UserDetails(String Name, String Username, String Address, String NIC, String Password, String Type)
	{
		boolean isSucess = false;

				
				//validate
				try {
					con = DatabaseConnection.getConnection();
					stmt = con.createStatement();
					
					String sql = "INSERT INTO LMS_User values('"+Name+"','"+Username+"','"+Address+"','"+NIC+"','"+Password+"','"+Type+"')";
					
					int rs = stmt.executeUpdate(sql);
					
					if(rs > 0)
					{
						isSucess = true;
					}
					
					else
					{
						isSucess = false;
					}
				}
				
				catch(Exception e) {
					e.printStackTrace();
				}
		
		return isSucess;
	}
	

	public static List<Order> orderDetails() {

    	ArrayList<Order> order = new ArrayList<>();
    	
    	try {
    		
    		con = DatabaseConnection.getConnection();
			stmt =con.createStatement();
    		String sql = "select * from bill";
    		rs = stmt.executeQuery(sql);
    		
    		while (rs.next()) {
                String refNo = rs.getString(1);
                double finalAmount = rs.getDouble(2);
                double paidAmount = rs.getDouble(3);
                String billDate = rs.getString(4);
                String dueDate = rs.getString(5);
                String state = rs.getString(6);

                Order o = new Order(refNo, finalAmount, paidAmount, billDate, dueDate, state);
                order.add(o);
            }
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return order;	
    }
	
	public static boolean UpdateOrder(String refNo,String finalAmount,String paidAmount,String billDate,String dueDate,String state) {
    	
    	try {
    		
    		con = DatabaseConnection.getConnection();
			stmt =con.createStatement();
    		String sql = "update bill set finalAmount='"+finalAmount+"',paidAmount='"+paidAmount+"',billDate='"+billDate+"',dueDate='"+dueDate+"',state='"+state+"' where refNo='"+refNo+"'";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSucess = true;
    		}
    		
    		else {
    			isSucess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSucess;
    }

public static boolean DeleteOrder(String refNo) {
    	
    	try {
    		
    		con = DatabaseConnection.getConnection();
			stmt =con.createStatement();
    		String sql = "delete from bill where refNo='"+refNo+"'";
    		int r = stmt.executeUpdate(sql);
    		
    		if (r > 0) {
    			isSucess = true;
    		}
    		else {
    			isSucess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSucess;
    }
}