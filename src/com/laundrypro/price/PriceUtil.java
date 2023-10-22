//Model of PricesInsert
package com.laundrypro.price;

import com.laundrypro.common.DBconnect;
import java.sql.*;
import java.util.ArrayList;

public class PriceUtil {

	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// insert dry cleaning prices method
	public static boolean insertDryCleanPrice(String iname, double price) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO  price_dry_clean (itemName,price) VALUES ('"
					+ iname + "','" + price + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;
	}

	// insert bulk laundry prices method
	public static boolean insertBulkPrice(double weight, double price) {
		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO price_bulk_wash(amountinKilos,price) VALUES ('"
					+ weight + "','" + price + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;

	}

	// retrieve Bulk Laundry Prices

	public static ArrayList<BulkPrice> getBulkPriceList() {

		ArrayList<BulkPrice> array = new ArrayList<>();

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM price_bulk_wash";
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

	// retrieve Dry Clean Prices

	public static ArrayList<DryCleanPrice> getDryCleanPriceList() {

		ArrayList<DryCleanPrice> array = new ArrayList<>();

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT * FROM price_dry_clean";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("id");
				String iname = rs.getString("itemName");
				double price = rs.getDouble("price");
				array.add(new DryCleanPrice(id, iname, price));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return array;
	}

	// update Bulk Prices
	public static boolean UpdateBulkPrice(int id, double weight, double price) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE price_bulk_wash SET amountinKilos = " + weight
					+ ",price = " + price + "WHERE id = " + id + "";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;
	}

	// update Dry Clean Prices
	public static boolean UpdateDryCleanPrice(int id, String iname,
			double price) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "UPDATE price_dry_clean SET itemName = '" + iname
					+ "', price = " + price + " WHERE id = " + id;

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;
	}

	public static boolean DeleteBulkPrice(int id) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM price_bulk_wash WHERE id = " + id;

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;

	}

	public static boolean DeleteDryCleanPrice(int id) {

		boolean isSuccess = false;

		try {

			// db connection
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			String sql = "DELETE FROM price_dry_clean WHERE id = " + id;

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return isSuccess;

	}

	// //TESTING
	// public static void main(String[]args) {
	// try {
	// PriceUtil.UpdateDryCleanPrice(1, "trouser", 1350);
	// }
	// catch(Exception e)
	// {
	// System.out.println("error" + e);
	//
	// }

	// }
}
