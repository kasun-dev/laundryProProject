package com.laundrypro.mix;

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

		/* validate */
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM lms_user WHERE userName = '" + Username
					+ "' AND password = '" + Password + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
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

		catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	// Insert Customer Details
	public static boolean insertCutomerDetails(String refNo, String Name,
			String ContactNo, String Address) {
		
		boolean isSuccess = false;
		int count = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			// Check if ContactNo already exists in the database
			String sqlq1 = "SELECT COUNT(*) as 'Count' FROM Customer WHERE ContactNo = '"
					+ ContactNo + "'";
			
			rs = stmt.executeQuery(sqlq1);

			while (rs.next()) {
				count = rs.getInt("Count");
			}

			if (count == 1) {
				isSuccess = false;
			} 
			
			if( count == 0)
			{
				String sqlq2 = "INSERT INTO customer values('" + ContactNo
						+ "','" + Name + "','" + Address + "')";
				
				String sqlq3 = "INSERT INTO customer_ref(refNo,contactNo) VALUES ('" + refNo
						+ "','" + ContactNo + "')";

				int rs1 = stmt.executeUpdate(sqlq2);
				int rs2 = stmt.executeUpdate(sqlq3);

				if (rs1 > 0 && rs2 > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// Insert Existing Customer to bill
	public static boolean linkExtCusToBill(String refNo, String ContactNo) {

		boolean isSuccess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO customer_ref(refNo,contactNo) values('" + refNo + "','"
					+ ContactNo + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// Retrive exsisting customer
	public static List<Customer> ValidateCustomer(String contactNo) {

		ArrayList<Customer> customer = new ArrayList<>();

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT * FROM customer WHERE contactNo = '"
					+ contactNo + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				String contactno = rs.getString(1);
				String name = rs.getString(2);
				String address = rs.getString(3);
				Customer c = new Customer(contactno, name, address);
				customer.add(c);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return customer;
	}

	public static boolean UserDetails(String Name, String Username,
			String Address, String NIC, String Password, String Type) {
		boolean isSucess = false;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "INSERT INTO LMS_User values('" + Name + "','"
					+ Username + "','" + Address + "','" + NIC + "','"
					+ Password + "','" + Type + "')";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
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

	// Retrieve All Order Details
	public static List<Order> orderDetails() {

		ArrayList<Order> order = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM bill";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				String refNo = rs.getString(1);
				double finalAmount = rs.getDouble(2);
				double paidAmount = rs.getDouble(3);
				String billDate = rs.getString(4);
				String dueDate = rs.getString(5);
				String state = rs.getString(6);

				Order o = new Order(refNo, finalAmount, paidAmount, billDate,
						dueDate, state);
				order.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}

	// Update Order Details
	public static boolean UpdateOrder(String refNo, String finalAmount,
			String paidAmount, String billDate, String dueDate, String state) {

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE bill SET finalAmount='" + finalAmount
					+ "',paidAmount='" + paidAmount + "',billDate='" + billDate
					+ "',dueDate='" + dueDate + "',state='" + state
					+ "' where refNo='" + refNo + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSucess = true;
			}

			else {
				isSucess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSucess;
	}

	public static boolean DeleteOrder(String refNo) {

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql1 = "DELETE FROM bill WHERE refNo='" + refNo + "'";
			String sql2 = "DELETE FROM refgeneratetable WHERE refNo='" + refNo
					+ "'";
			int r1 = stmt.executeUpdate(sql1);
			int r2 = stmt.executeUpdate(sql2);

			if (r1 > 0 && r2 > 0) {
				isSucess = true;
			} else {
				isSucess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSucess;
	}

	/* CHECK FOR COUNT OF THE CONFIRMED ORDERS */
	public static int ConfirmedCount() {
		int count = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT COUNT(*) AS 'Count' FROM bill WHERE state LIKE 'Confirmed'";
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getInt("Count");

			System.out.print(count);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	/* CHECK FOR COUNT OF THE PROCESSING ORDERS */
	public static int ProcessingCount() {
		int count = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT COUNT(*) AS 'Count' FROM bill WHERE state LIKE 'Processing'";
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getInt("Count");

			System.out.print(count);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	/* CHECK FOR COUNT OF THE HOLD ORDERS */
	public static int HoldCount() {
		int count = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT COUNT(*) AS 'Count' FROM bill WHERE state LIKE 'Hold'";
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getInt("Count");

			System.out.print(count);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	/* CHECK FOR COUNT OF THE READY ORDERS */
	public static int ReadyCount() {
		int count = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT COUNT(*) AS 'Count' FROM bill WHERE state LIKE 'Ready'";
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getInt("Count");

			System.out.print(count);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	/* CHECK FOR COUNT OF THE COMPLETE ORDERS */
	public static int CompleteCount() {
		int count = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT COUNT(*) AS 'Count' FROM bill WHERE state LIKE 'Complete'";
			rs = stmt.executeQuery(sql);
			rs.next();
			count = rs.getInt("Count");

			System.out.print(count);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	/* TRACK ORDER */
	public static List<TrackOrder> TrackOrder(String refno) {

		ArrayList<TrackOrder> trackorder = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT b.refNo, b.finalAmount, b.paidAmount, b.billDate, b.dueDate, b.state, cr.contactNo, c.name, c.address FROM bill b, customer_ref cr, customer c WHERE b.refNo = cr.refNo AND cr.contactNo = c.contactNo AND b.refNo='"
					+ refno + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				String refNo = rs.getString(1);
				double finalAmount = rs.getDouble(2);
				double paidAmount = rs.getDouble(3);
				String billDate = rs.getString(4);
				String dueDate = rs.getString(5);
				String state = rs.getString(6);
				String contactNo = rs.getString(7);
				String name = rs.getString(8);
				String address = rs.getString(9);

				TrackOrder to = new TrackOrder(refNo, finalAmount, paidAmount,
						billDate, dueDate, state, contactNo, name, address);
				trackorder.add(to);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return trackorder;
	}

	/* CALCULATE AND RETURN MONTHLY INCOME */
	public static double MonthlyIncome() {
		double monthlyincome = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT SUM(finalAmount) AS MonthlyIncome FROM Bill WHERE DATE_FORMAT(billDate, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m') AND state = 'Complete' GROUP BY DATE_FORMAT(billDate, '%Y-%m')";
			rs = stmt.executeQuery(sql);
			rs.next();
			monthlyincome = rs.getDouble("MonthlyIncome");
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return monthlyincome;
	}

	/* CALCULATE AND RETURN DAILY INCOME */
	public static double DailyIncome() {
		double dailyincome = 0;

		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			String sql = "SELECT SUM(finalAmount) AS TodayIncome FROM Bill WHERE billDate = CURDATE() AND state = 'Complete'";
			rs = stmt.executeQuery(sql);
			rs.next();
			dailyincome = rs.getDouble("TodayIncome");
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return dailyincome;
	}

	public static List<OrderItem> OrderItem(String refNo) {

		ArrayList<OrderItem> orderitem = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM bill_items WHERE refNo='" + refNo + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				String description = rs.getString(2);
				String serviceType = rs.getString(3);
				double unitPrice = rs.getDouble(4);
				int quantity = rs.getInt(5);

				OrderItem oi = new OrderItem(description, serviceType,
						unitPrice, quantity);
				orderitem.add(oi);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderitem;
	}

	public static List<Customer> CustomerDetails(String refNo) {

		ArrayList<Customer> customer = new ArrayList<>();

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM customer WHERE contactNo = (SELECT contactNo FROM customer_ref WHERE refNo='"
					+ refNo + "')";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				String contactNo = rs.getString(1);
				String name = rs.getString(2);
				String address = rs.getString(3);

				Customer cus = new Customer(contactNo, name, address);
				customer.add(cus);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}

	// Close Bill
	public static boolean CloseBill(String refNo, String paidAmount) {

		try {

			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE bill SET paidAmount='" + paidAmount
					+ "' where refNo='" + refNo + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSucess = true;
			}

			else {
				isSucess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSucess;
	}
}