package com.laundrypro.price;

public class DryCleanPrice extends Price {

	private String itemname;
	private double price;

	// constructors
	public DryCleanPrice(int id, String iname, double price) {
		super(id);
		this.itemname = iname;
		this.price = price;
	}

	// getters and setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

}
