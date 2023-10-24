package com.laundrypro.bill;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.laundrypro.common.DBconnect;
import com.laundrypro.price.BulkPrice;

public class BillUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// insert dry cleaning prices method
	public static boolean insertBillData(String refNo,double finalAmount, double paidAmount, String billDate, String dueDate, String state ) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO bill(refNo,finalAmount,paidAmount,billDate,dueDate,state) VALUES ('" +refNo+"','"
					+ finalAmount + "','" + paidAmount + "','" + billDate + "','" + dueDate + "','" + state + "' )";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;
	}
	

	public static String GetRefNo() {

		String refNo;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT reNo FROM bill";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				double weight = rs.getDouble("amountinKilos");
				double price = rs.getDouble("price");
				array.add(new BulkPrice(id, weight, price));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return array;
	}
	
	
}
