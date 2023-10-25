package com.laundrypro.mix;

public class TrackOrder {
	private String refNo;
    private double finalAmount;
    private double paidAmount;
    private String billDate;
    private String dueDate;
    private String state;
    private String contactNo;
    private String name;
    private String address;
    
    
	public TrackOrder(String refNo, double finalAmount, double paidAmount, String billDate, String dueDate, String state,
			String contactNo, String name, String address) {
		super();
		this.refNo = refNo;
		this.finalAmount = finalAmount;
		this.paidAmount = paidAmount;
		this.billDate = billDate;
		this.dueDate = dueDate;
		this.state = state;
		this.contactNo = contactNo;
		this.name = name;
		this.address = address;
	}
	
	public String getRefNo() {
		return refNo;
	}

	public double getFinalAmount() {
		return finalAmount;
	}
	
	public double getPaidAmount() {
		return paidAmount;
	}
	
	public String getBillDate() {
		return billDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public String getState() {
		return state;
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
		return "TrckOrder [refNo=" + refNo + ", finalAmount=" + finalAmount + ", paidAmount=" + paidAmount
				+ ", billDate=" + billDate + ", dueDate=" + dueDate + ", state=" + state + ", contactNo=" + contactNo
				+ ", name=" + name + ", address=" + address + "]";
	}
    
    

}
