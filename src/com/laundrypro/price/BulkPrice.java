package com.laundrypro.price;

public class BulkPrice {

	private int id;
	private double weight;
	private double price;
	
	//constructor
	public BulkPrice(int id,double weight, double price) {
		this.id = id;
		this.weight = weight;
		this.price = price;
	}
	
	//getters and setters
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}

}
