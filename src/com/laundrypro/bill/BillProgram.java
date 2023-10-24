package com.laundrypro.bill;

import java.util.ArrayList;
import java.util.UUID;

public class BillProgram {

	// item list
	static ArrayList<OrderItem> itemList = new ArrayList<>();

	// add item to item list method
	public static void addItemToList(String desc, String serviceType,
			double unitprice, int quantity) {
		OrderItem item = new OrderItem(desc, serviceType, unitprice, quantity);

		try {
			itemList.add(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// get item list method
	public static ArrayList<OrderItem> getItemList() {
		return itemList;
	}

	// item deletion from list method
	public static void DeleteItemFromList(String desc, String type, int qty,
			double unitPrice, double subTotal) {
		try {
			for (int i = 0; i < itemList.size(); i++) {
				OrderItem current = itemList.get(i); // current item

				if (current.getDescription().equals(desc)
						&& current.getServiceType().equals(type)
						&& current.getUnitPrice() == unitPrice
						&& current.getQuantity() == qty
						&& current.getSubTotal() == subTotal) {

					itemList.remove(i);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// final amount calculation method
	public static double CalculateFinalAmount() {

		double finalAmount = 0;

		if (itemList.size() > 0) {
			for (OrderItem item : itemList) {
				finalAmount = finalAmount + item.getSubTotal();
			}

		}
		return finalAmount;

	}

	// minimum amount calculation method
	public static double CalculateMinPayment(double finalAmount) {

		double minPayment = 0;

		if (itemList.size() > 0) {
			minPayment = (finalAmount / 100.0) * 25.0;
		}

		return minPayment;
	}

	// UUID generation method
	public static String GenerateUUID() {
		UUID uuid = UUID.randomUUID();
		String stringUUID = uuid.toString();
		return stringUUID;

	}
	
	//empty the array
	public static boolean emptyArray() {
		
		boolean isCleared = false;
				
		itemList.clear();
		
		int size = itemList.size();
		
		if(size == 0)
		{
			isCleared = true;
		}
		
		return isCleared;

	}

	//testing
//	public static void main(String[] args) {
//
//		BillProgram.addItemToList("trouser", "bulk", 450.50, 2);
//		BillProgram.addItemToList("trouser", "bulk", 450.50, 2);
//		BillProgram.addItemToList("shirt", "regular", 25.0, 3);
//
//		for (OrderItem x : itemList) {
//			System.out.println(x.getDescription());
//			System.out.println(x.getQuantity());
//			System.out.println(x.getServiceType());
//			System.out.println(x.getUnitPrice());
//			System.out.println(x.getSubTotal());
//			System.out.println();
//		}
//
//		//BillProgram.CalculateFinalAmount();
//		//System.out.println(finalAmount);
//		//BillProgram.CalculateMinPayment();
//		//System.out.println(minPayment);
//
//	//System.out.println(BillProgram.GenerateUUID());
//		
//		if(BillProgram.emptyArray())
//		{
//			System.out.println("array is empty");
//		}
//		else
//		{
//			System.out.println("didnt work");
//		}
//
//	}
}
