package com.laundrypro.users;

import com.laundrypro.common.DBconnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class userDbUtil {
	
	private static boolean isValid;	
//Database connection object	
	private static Connection con= null;
	private static Statement stmt= null;
	private static ResultSet rs= null;
	

//Get type of the user account to redirect to the specific interface
		public static String UserAcctype(String userName) {
		    String jobtype = null;
		    try {
		        con = DBconnect.getConnection();
		        stmt = con.createStatement();
		        //the type column denotes the job role in the company as manager,worker or the cashier
		        //SQL query use to get the type related to the userName entered
		        String sql = "SELECT type FROM lms_user WHERE userName = '" + userName + "'";
		        rs = stmt.executeQuery(sql);
		        	if (rs.next()) {
		            jobtype = rs.getString("type");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } 	   
		    return jobtype;
		}
//login validation-checks with the database to know whether the user exist for login			
		public static boolean validate(String userName,String password){
			 try {
				//connect database using DBconnect class
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				//SQL query-provide all data in the row related to the userName and the password
				String sql = "select * from lms_user where userName = '"+userName+"' and password = '"+password+"' ";
				rs = stmt.executeQuery(sql);
				
					if(rs.next()) {
						isValid =true;
					}
					else {
						isValid=false;
					}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return isValid;
		}
//values returning to user profile
		public static List<user> getuser(String userName){
			ArrayList<user> user = new ArrayList<>();
			
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql = "select * from lms_user where username='"+userName+"'";
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					String nic = rs.getString(1);
					String name = rs.getString(2);
					String username = rs.getString(3);
					String password = rs.getString(4);
					String phoneNo = rs.getString(5);
					String type = rs.getString(6);
					
					user usr = new user(nic,name,username,password,phoneNo,type);
					user.add(usr);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return user;	
		}
//create account and insert details of the account		
		public static boolean insertuser(String name,String nic,String phoneNo ,String username ,String password,String type) {
				boolean isSuccess = false;
				try {
					//connect database
					con = DBconnect.getConnection();
					stmt = con.createStatement();
					String sql = "INSERT INTO lms_user VALUES ('"+nic+"','"+name+"','"+username+"','"+password+"','"+phoneNo+"','"+type+"')";
					int rs = stmt.executeUpdate(sql);
					
					if(rs>0) {
						isSuccess=true;
					}
					else
						isSuccess=false;
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				return isSuccess; 
		}
//delete account function		
		public static boolean deleteUAcc(String userName){
			 boolean isDelete = false;
			try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from lms_user where userName='"+userName+"'";
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isDelete=true;
			}
			else {
				isDelete=false;}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return isDelete;
	}
//update account details of manager
		public static boolean updateuser(String name,String nic,String phoneNo ,String password,String userName) {
			boolean isSuccess = false;	
			try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "update lms_user set name='"+name+"',nic='"+nic+"',phoneNo='"+phoneNo+"',password='"+password+"'"
    				+"where userName='"+userName+"'";
			int rs = stmt.executeUpdate(sql);
		
			if(rs>0) {
				isSuccess=true;
			}
			else
				isSuccess=false;
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return isSuccess;
			}
		

//all users table-manager.jsp/AccManagepg.jsp ()	
		public static List<user> selectAllUsers() {
			ArrayList<user> usr = new ArrayList<>();
			try {
				
				con = DBconnect.getConnection();
				stmt = con.createStatement();
				String sql="select* from lms_user";
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					String nic = rs.getString(1);
					String name = rs.getString(2);
					String username = rs.getString(3);
					String password = rs.getString(4);
					String phoneNo = rs.getString(5);
					String type = rs.getString(6);
				
				
				user user1 = new user(nic,name,username,password,phoneNo,type);
				usr.add(user1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return usr;
		}
			
		
}
