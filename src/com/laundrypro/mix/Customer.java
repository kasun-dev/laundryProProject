package com.laundrypro.mix;

public class Customer {
	private String contactNo;
	private String name;
	private String address;
	
	public Customer(String contactNo, String name, String address) {
		super();
		this.contactNo = contactNo;
		this.name = name;
		this.address = address;
	}

	public String getContactNo() {
		return contactNo;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}
	
	@Override
	public String toString() {
	    return "Customer{" +
	            "contactNo='" + contactNo + '\'' +
	            ", name='" + name + '\'' +
	            ", address='" + address + '\'' +
	            '}';
	}
}
