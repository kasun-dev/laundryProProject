package com.laundrypro.mix;

public class OrderItem {
	private String description;
	private String serviceType;
	private double unitPrice;
	private int quantity;
	private double subTotal;

	public OrderItem(String description, String serviceType, double unitPrice, int quantity) {
		super();
		this.description = description;
		this.serviceType = serviceType;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.subTotal = quantity * unitPrice;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubTotal() {
		return subTotal;
	}


}