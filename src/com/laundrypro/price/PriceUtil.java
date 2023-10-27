//Model of PricesInsert
package com.laundrypro.price;

import com.laundrypro.common.DBconnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PriceUtil implements IPriceUtil {

	private Connection con = null;
	private Statement stmt = null;

	/**
	 * insert dry cleaning prices method
	 */
	@Override
	public boolean insertDryCleanPrice(String iname, double price) {

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

	/**
	 * insert bulk laundry prices method
	 */
	@Override
	public boolean insertBulkPrice(double weight, double price) {
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

	/**
	 * retrieve Bulk Laundry Prices
	 */
	@Override
	public List<BulkPrice> getBulkPriceList() {

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

	/**
	 * retrieve Dry Clean Prices
	 */
	@Override
	public List<DryCleanPrice> getDryCleanPriceList() {

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

	/**
	 * update Bulk Prices
	 */
	@Override
	public boolean updateBulkPrice(int id, double weight, double price) {

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

	/**
	 * update Dry Clean Prices
	 */
	@Override
	public boolean updateDryCleanPrice(int id, String iname, double price) {

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

	/**
	 * delete bulk prices method
	 */
	@Override
	public boolean deleteBulkPrice(int id) {

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

	/**
	 * delete dry clean prices method
	 */
	@Override
	public boolean deleteDryCleanPrice(int id) {

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

}
