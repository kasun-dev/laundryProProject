package com.laundrypro.bill;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.laundrypro.common.DBconnect;
import com.laundrypro.price.BulkPrice;
import com.laundrypro.price.DryCleanPrice;

public class BillDbUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// insert UUID to generate refNo from DB method
	public static boolean insertUUID(String UUID) {
		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO refgeneratetable (UUID) VALUES ( '" + UUID
					+ "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// get refNo method
	public static String getRefNoFromDB(String UUID) {
		String refno = "";

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT refNo FROM refgeneratetable WHERE UUID = '"
					+ UUID + "'";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				refno = rs.getString("refNo");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return refno;
	}

	// insert bill data method
	public static boolean insertBillData(String refNo, double finalAmount,
			double paidAmount, String billDate, String dueDate, String state) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO bill(refNo,finalAmount,paidAmount,billDate,dueDate,state) VALUES ('"
					+ refNo + "','" + finalAmount + "','" + paidAmount + "','"
					+ billDate + "','" + dueDate + "','" + state + "' )";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;
	}

	// insert/save bill items method=
	public static boolean insertBillItem(String refNo,
			ArrayList<OrderItem> itemList) {
		boolean isSuccess = false;
		int rs = 0;
		String sql;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();

			for (OrderItem item : itemList) {

				sql = "INSERT INTO bill_items (refNo,descript,serviceType,unitPrice,qty) VALUES ( '"
						+ refNo + "','" + item.getDescription() + "','"
						+ item.getServiceType() + "','" + item.getUnitPrice()
						+ "','" + item.getQuantity() + "')";
				rs = stmt.executeUpdate(sql);

				if (rs > 0) {
					isSuccess = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSuccess;
	}

	// public static String GetRefNo() {
	//
	// String refNo;
	//
	// try {
	//
	// // db connection
	// con = DBconnect.getConnection();
	// stmt = con.createStatement();
	// String sql = "SELECT reNo FROM bill";
	// ResultSet rs = stmt.executeQuery(sql);
	//
	// while (rs.next()) {
	// int id = rs.getInt("id");
	// double weight = rs.getDouble("amountinKilos");
	// double price = rs.getDouble("price");
	// array.add(new BulkPrice(id, weight, price));
	// }
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	//
	// }
	//
	// return array;
	// }

}
