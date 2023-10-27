package com.laundrypro.price;

import java.util.List;

public interface IPriceUtil {

	/**
	 * @param iname
	 * @param price
	 * @return
	 */
	public boolean insertDryCleanPrice(String iname, double price);
	
	/**
	 * @param weight
	 * @param price
	 * @return
	 */
	public boolean insertBulkPrice(double weight, double price);
	
	/**
	 * @return
	 */
	public List<BulkPrice> getBulkPriceList();
	
	/**
	 * @return
	 */
	public List<DryCleanPrice> getDryCleanPriceList();
	
	/**
	 * @param id
	 * @param weight
	 * @param price
	 * @return
	 */
	public boolean updateBulkPrice(int id, double weight, double price);
	
	/**
	 * @param id
	 * @param iname
	 * @param price
	 * @return
	 */
	public boolean updateDryCleanPrice(int id, String iname, double price);
	
	/**
	 * @param id
	 * @return
	 */
	public boolean deleteBulkPrice(int id);
	
	/**
	 * @param id
	 * @return
	 */
	public boolean deleteDryCleanPrice(int id);
	
}
